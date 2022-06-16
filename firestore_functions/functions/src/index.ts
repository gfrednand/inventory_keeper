import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript
//
// export const helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });


admin.initializeApp();

exports.createTeam = functions.firestore.document("teams/{teamId}")
    .onCreate((snapshot, context) => createTeam(snapshot));
exports.createteamSettingsLastUpdate = functions.firestore
    .document("teams/{teamId}/teamSettings/{id}")
    .onWrite(async (change, context) => { const doc: any = change.after.data();
        await updateAt(doc.teamId, doc.lastUpdatedAt, "teamSettingsLastUpdate");
    });

exports.createusersLastUpdate = functions.firestore
    .document("users/{id}")
    .onWrite(async (change, context) => {
        const doc: any = change.after.data();
        if (doc.selectedTeamId) {
            await updateAt(doc.selectedTeamId, doc.lastUpdatedAt, "usersLastUpdate");
        }
    });
exports.createrolesLastUpdate = functions.firestore
    .document("teams/{teamId}/roles/{id}")
    .onWrite(async (change, context) => {
        const doc: any = change.after.data();
        await updateAt(doc.teamId, doc.lastUpdatedAt, "rolesLastUpdate");
    });
exports.createpermissionsLastUpdate = functions.firestore
    .document("teams/{teamId}/permissions/{id}")
    .onWrite(async (change, context) => {
        const doc: any = change.after.data();
        await updateAt(doc.teamId, doc.lastUpdatedAt, "permissionsLastUpdate");
    });
exports.createproductsLastUpdate = functions.firestore
    .document("teams/{teamId}/products/{id}")
    .onWrite(async (change, context) => {
        const doc: any = change.after.data();
        await updateAt(doc.teamId, doc.lastUpdatedAt, "productsLastUpdate");
    });
exports.createstockSummariesLastUpdate = functions.firestore
    .document("teams/{teamId}/stockSummaries/{id}")
    .onWrite(async (change, context) => {
        const doc: any = change.after.data();
        await updateAt(doc.teamId, doc.lastUpdatedAt, "stockSummariesLastUpdate");
    });
exports.createproductTransactionsLastUpdate = functions.firestore
    .document("teams/{teamId}/productTransactions/{id}")
    .onWrite(async (change, context) => createTransaction(change));

exports.createpartnersLastUpdate = functions.firestore
    .document("teams/{teamId}/partners/{id}")
    .onWrite(async (change, context) => {
        const doc: any = change.after.data();
        await updateAt(doc.teamId, doc.lastUpdatedAt, "partnersLastUpdate");
    });
exports.createcategoriesLastUpdate = functions.firestore
    .document("teams/{teamId}/categories/{id}")
    .onWrite(async (change, context) => {
        const doc: any = change.after.data();
        await updateAt(doc.teamId, doc.lastUpdatedAt, "categoriesLastUpdate");
    });
exports.createproductsSummaryLastUpdate = functions.firestore
    .document("teams/{teamId}/productsSummary/{id}")
    .onWrite(async (change, context) => {
        const doc: any = change.after.data();
        await updateAt(doc.teamId, doc.lastUpdatedAt, "productsSummaryLastUpdate");
    });


async function createTeam(snapshot: functions.firestore.QueryDocumentSnapshot) {
    const firestore = admin.firestore();
    const doc: any = snapshot.data();
    await firestore.collection(`users`).doc(doc.userId)
        .update({ "teams": [snapshot.id], "selectedTeamId": snapshot.id });
    await updateAt(snapshot.id, doc.lastUpdatedAt, "teamsLastUpdate");
}

async function updateAt(teamId: string, lastUpdatedAt: number, updateField: string) {
    const firestore = admin.firestore();
    await firestore.collection("teams").doc(teamId)
        .collection("updatedAt").doc("latest")
        .set({ [updateField]: lastUpdatedAt }, { merge: true })
}


// Where all business logic go

async function createTransaction(change: functions.Change<functions.firestore.DocumentSnapshot>) {
    try {
        const chagedDoc: any = change.after.data();
        await updateAt(chagedDoc.teamId, chagedDoc.lastUpdatedAt, "productTransactionsLastUpdate");
        const firestore = admin.firestore();
        const collection = await firestore.collection("teams")
            .doc(chagedDoc.teamId).collection("productTransactions")
            .where("transactionDate", "==", chagedDoc.transactionDate).get();
        const docs = collection.docs.sort((a, b) => a.updateTime.toMillis() - b.updateTime.toMillis());
        // setup initial data
        var totalAmount = 0;
        var totalQuantity = 0;
        var totalAuditQuantity = 0;
        var totalIn = 0;
        var totalOut = 0;
        var totalBuy = 0;
        var totalSale = 0;
        var productsSummary: any[] = [];
        let productsSummaryMap: { [key: string]: any }[] = [];
        for (const doc of docs) {
            const transaction: any = doc.data();
            totalAmount = totalAmount + transaction.totalAmount;
            totalAuditQuantity = totalAuditQuantity + transaction.totalAuditQuantity;
            totalQuantity =
                totalQuantity + transaction.totalQuantity + totalAuditQuantity;
            if (
                transaction.transactionType == "inStock") {
                totalIn = totalIn + transaction.totalQuantity;
                totalBuy = totalBuy + (transaction.totalAmount);
            } else if (transaction.transactionType == "outStock") {
                totalOut = totalOut + transaction.totalQuantity;
                totalSale = totalSale + (transaction.totalAmount);
            }
            for (const summary of transaction.productsSummary) {
                const index = productsSummary.map(object => object.id).indexOf(summary.id);
                if (index == -1) {
                    productsSummary.push(summary);
                } else {
                    productsSummary[index] = {
                        ...productsSummary[index],
                        amount: (productsSummary[index].amount ?? 0) +
                            (summary.amount ?? 0),
                        quantity: transaction.transactionType == "audit"
                            ? summary.quantity
                            : productsSummary[index].quantity + summary.quantity,
                        currentStock: transaction.transactionType == "audit"
                            ? summary.quantity
                            : summary.currentStock,
                    }
                }
            }
        }

        productsSummaryMap = productsSummary.map((summary) => ({
            "amount": summary["amount"],
            "auditedQuantity": summary["auditedQuantity"],
            "currentStock": summary["currentStock"],
            "id": summary["id"],
            "lastUpdatedAt": summary["lastUpdatedAt"],
            "productId": summary["productId"],
            "quantity": summary["quantity"],
     
        }));

        console.log(chagedDoc);
        console.log(productsSummaryMap);

        return await firestore.doc("teams/"+chagedDoc.teamId+"/stockSummaries/"+chagedDoc.transactionDate)
            .set({
                "totalAmount": totalAmount,
                "totalQuantity": totalQuantity,
                "totalAuditQuantity": totalAuditQuantity,
                "teamId": chagedDoc.teamId,
                "productsSummary": productsSummaryMap,
                "totalIn": totalIn,
                "totalOut": totalOut,
                "totalSale": totalSale,
                "totalBuy": totalBuy,
                "lastUpdatedAt": chagedDoc.lastUpdatedAt

            }, { merge: true });





    } catch (error) {
        console.error(error);

        return null;

    }


}