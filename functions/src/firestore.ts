import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

const db = admin.firestore();

export const sessionID = functions.firestore
    .document(`sessions/{sessionID}`)
    .onCreate(async (snapshot, context)=>{
        const data = snapshot.data();

        const bidRef = db.doc(`bids/${data.bidID}`);

        const bidSnap = await bidRef.get();
        const bidData = bidSnap.data();

        return bidRef.update({
//            sessionID: bidData.sessionID + 1
        });
    });