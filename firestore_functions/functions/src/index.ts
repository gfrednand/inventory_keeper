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

exports.createTransactions = functions.firestore.document('transactions/{transactionId}').onCreate((_, __) => updateTransactionSummary());


// Where all business logic go

async function updateTransactionSummary() {


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

    // iterate through all the documents
    for (const doc of collection.docs) {
        // extract the mood value
        // note: this code uses *destructuring*
        // const { transaction } = doc.data();



        totalAmount = totalAmount + doc.data().totalAmount;

        const tr: any = doc.data();

        var prodSummary = tr.productsSummary.sort((firstEl: any, secondEl: any) => {
            if (firstEl['summaryDate'] < secondEl['summaryDate']) { return -1; }
            if (firstEl['summaryDate'] > secondEl['summaryDate']) { return 1; }
            return 0;
        });


        totalQuantity = totalQuantity + tr.totalQuantity;
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
            const index =  productsSummary.map(object => object.id).indexOf( summary.id);
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
                        : productsSummary[index].currentStock,
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