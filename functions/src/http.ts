import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

admin.initializeApp();

import * as express from 'express';

const app = express();

const db = admin.firestore();

app.get('/user',(request, response)=>{
    response.send('userID: 123443');
});

app.get('/bid',(request, response)=>{
    response.send('Bid id: 123423, userID: 43234');
});

export const api =functions.https.onRequest(app);
