import * as functions from "firebase-functions";
import * as admin from 'firebase-admin'

// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript
//
// export const helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });


admin.initializeApp();

// Cloud function to be triggered when doc is created inside a transaction/{transactionId}
//and call updateTransactionSummary() method

exports.createTransactions = functions.firestore.document('transactions/{transactionId}').onCreate((_, __) => createTransaction());
exports.createTeam = functions.firestore.document('teams/{teamId}').onCreate((snapshot, context) => createTeam(snapshot));
exports.createteamSettingsLastUpdate = functions.firestore.document('teams/{teamId}/teamSettings/{id}').onWrite(async (change, context) => {
    const doc: any = change.after.data();
    await updateAt(doc.teamId, doc.lastUpdatedAt, 'teamSettingsLastUpdate');
});

exports.createusersLastUpdate = functions.firestore.document('users/{id}').onWrite(async (change, context) => {
    const doc: any = change.after.data();
    if (doc.selectedTeamId) {
        await updateAt(doc.selectedTeamId, doc.lastUpdatedAt, 'usersLastUpdate');
    }
});
exports.createrolesLastUpdate = functions.firestore.document('teams/{teamId}/roles/{id}').onWrite(async (change, context) => {
    const doc: any = change.after.data();
    await updateAt(doc.teamId, doc.lastUpdatedAt, 'rolesLastUpdate');
});
exports.createpermissionsLastUpdate = functions.firestore.document('teams/{teamId}/permissions/{id}').onWrite(async (change, context) => {
    const doc: any = change.after.data();
    await updateAt(doc.teamId, doc.lastUpdatedAt, 'permissionsLastUpdate');
});
exports.createproductsLastUpdate = functions.firestore.document('teams/{teamId}/products/{id}').onWrite(async (change, context) => {
    const doc: any = change.after.data();
    await updateAt(doc.teamId, doc.lastUpdatedAt, 'productsLastUpdate');
});
exports.createstockSummariesLastUpdate = functions.firestore.document('teams/{teamId}/stockSummaries/{id}').onWrite(async (change, context) => {
    const doc: any = change.after.data();
    await updateAt(doc.teamId, doc.lastUpdatedAt, 'stockSummariesLastUpdate');
});
exports.createproductTransactionsLastUpdate = functions.firestore.document('teams/{teamId}/productTransactions/{id}').onWrite(async (change, context) => {
    const doc: any = change.after.data();
    await updateAt(doc.teamId, doc.lastUpdatedAt, 'productTransactionsLastUpdate');
});
exports.createpartnersLastUpdate = functions.firestore.document('teams/{teamId}/partners/{id}').onWrite(async (change, context) => {
    const doc: any = change.after.data();
    await updateAt(doc.teamId, doc.lastUpdatedAt, 'partnersLastUpdate');
});
exports.createcategoriesLastUpdate = functions.firestore.document('teams/{teamId}/categories/{id}').onWrite(async (change, context) => {
    const doc: any = change.after.data();
    await updateAt(doc.teamId, doc.lastUpdatedAt, 'categoriesLastUpdate');
});
exports.createproductsSummaryLastUpdate = functions.firestore.document('teams/{teamId}/productsSummary/{id}').onWrite(async (change, context) => {
    const doc: any = change.after.data();
    await updateAt(doc.teamId, doc.lastUpdatedAt, 'productsSummaryLastUpdate');
});


async function createTeam(snapshot: functions.firestore.QueryDocumentSnapshot) {
    const firestore = admin.firestore();
    const doc: any = snapshot.data();
    await firestore.collection(`users`).doc(doc.userId).update({ 'teams': [snapshot.id], 'selectedTeamId': snapshot.id });
    await updateAt(snapshot.id, doc.lastUpdatedAt, 'teamsLastUpdate');
}

async function updateAt(teamId: string, lastUpdatedAt: number, updateField: string) {
    const firestore = admin.firestore();
    await firestore.collection('teams').doc(teamId).collection('updatedAt').doc('latest').set({ [updateField]: lastUpdatedAt }, { merge: true })
}


// Where all business logic go

async function createTransaction() {


    // setup initial data

    var totalAmount = 0;
    var totalQuantity = 0;
    var totalAuditedQuantity = 0;
    var totalIn = 0;
    var totalOut = 0;
    var totalBuy = 0;
    var totalSale = 0;
    var productsSummary: any[] = [];
    // get the collection data located at `mood`
    const firestore = admin.firestore();
    const collection = await firestore.collection(`transactions`).get();
    let productsSummaryMap: { [key: string]: any }[] = [];
    const colls = collection.docs.sort((a, b) => a.updateTime.toMillis() - b.updateTime.toMillis());
    // iterate through all the documents
    for (const doc of colls) {
        const tr: any = doc.data();
        totalAmount = totalAmount + tr.totalAmount;
        var prodSummary = tr.productsSummary;
        totalAuditedQuantity = totalAuditedQuantity + tr.totalAuditedQuantity;
        totalQuantity =
            totalQuantity + tr.totalQuantity + tr.totalAuditedQuantity;
        if (
            tr.transactionType == 'inStock') {
            totalIn = totalIn + tr.totalQuantity;
            totalBuy = totalBuy + (tr.totalAmount);
        } else if (tr.transactionType == 'outStock') {
            totalOut = totalOut + tr.totalQuantity;
            totalSale = totalSale + (tr.totalAmount);
        }

        for (const summary of prodSummary) {
            const index = productsSummary.map(object => object.id).indexOf(summary.id);
            if (index == -1) {
                productsSummary.push(summary);
            } else {
                productsSummary[index] = {
                    ...productsSummary[index],
                    amount: (productsSummary[index].amount ?? 0) +
                        (summary.amount ?? 0),
                    quantity: tr.transactionType == 'audit'
                        ? summary.quantity
                        : productsSummary[index].quantity + summary.quantity,
                    currentStock: tr.transactionType == 'audit'
                        ? summary.quantity
                        : summary.currentStock,
                }
            }
        }
    }

    productsSummaryMap = productsSummary.map((summary) => ({
        'active': summary['active'],
        'id': summary['id'],
        'name': summary['name'],
        'quantity': summary['quantity'],
        'auditedQuantity': summary['auditedQuantity'],
        'currentStock': summary['currentStock'],
        'amount': summary['amount'],
        'summaryDate': summary['summaryDate'],
    }));

    return await firestore.doc(`summary/transaction/`).set({
        'totalAmount': totalAmount,
        'totalQuantity': totalQuantity,
        'totalAuditedQuantity': totalAuditedQuantity,
        'productsSummary': productsSummaryMap,
        'totalIn': totalIn,
        'totalOut': totalOut,
        'totalSale': totalSale,
        'totalBuy': totalBuy,

    })

}