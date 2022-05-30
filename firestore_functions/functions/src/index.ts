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

    // get the collection data located at `mood`
    const firestore = admin.firestore();
    const collection = await firestore.collection(`transactions`).get();
   
    // iterate through all the documents
    for (const doc of collection.docs) {
        // extract the mood value
        // note: this code uses *destructuring*
        // const { transaction } = doc.data();

        console.log( doc.data());
        
  
        totalAmount = totalAmount + doc.data().totalAmount;
        totalQuantity = totalQuantity + doc.data().totalQuantity;
        totalAuditedQuantity = totalAuditedQuantity + doc.data().totalAuditedQuantity;



    }
    console.log({
        'totalAmount': totalAmount,
        'totalQuantity': totalQuantity,
        'totalAuditedQuantity': totalAuditedQuantity,
    })
    return await firestore.doc(`summary/transaction`).set({
        'totalAmount': totalAmount,
        'totalQuantity': totalQuantity,
        'totalAuditedQuantity': totalAuditedQuantity,

    })

}