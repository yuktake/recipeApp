/* Amplify Params - DO NOT EDIT
    API_SWIFTUITEST_GRAPHQLAPIIDOUTPUT
    API_SWIFTUITEST_USERTABLE_ARN
    API_SWIFTUITEST_USERTABLE_NAME
    ENV
    REGION
Amplify Params - DO NOT EDIT */

var aws = require('aws-sdk');
var ddb = new aws.DynamoDB();

exports.handler = async (event, context) => {
    
    let date = new Date();
    if (event.request.userAttributes.sub) {
        let params = {
            Item: {
                'id': {S: event.request.userAttributes.sub},
                '__typename': {S: 'User'},
                'type': {S: 'User'},
                'name': {S: event.userName},
                'displayName': {S: Math.random().toString(32).substring(2)},
                'description': {S: ''},
                'profileImage': {S: ''},
                'email': {S: event.request.userAttributes.email},
                'favNum' : {N: 0},
                'reviewNum' : {N: 0},
                'createdAt': {S: date.toISOString()},
                'updatedAt': {S: date.toISOString()},
            },
            TableName: process.env.API_SWIFTUITEST_USERTABLE_NAME
        };

        // Call DynamoDB
        try {
            await ddb.putItem(params).promise()
            console.log("Success");
        } catch (err) {
            console.log("Error", err);
        }

        console.log("Success: Everything executed correctly");
        context.done(null, event);

    } else {
        // Nothing to do, the user's email ID is unknown
        console.log("Error: Nothing was written to DynamoDB");
        context.done(null, event);
    }
};
