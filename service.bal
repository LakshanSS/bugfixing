import ballerina/log;
import ballerina/http;

configurable string authHeader =?;

listener http:Listener httpListener = check new (7071);

service / on httpListener {

    function init() returns error? {
        log:printInfo("Service started successfully.");
        log:printInfo(authHeader + " is the header");
    }

    resource function get hi() returns string {
        return "hi";
    }

    resource function get customer() returns http:Response|error {
        http:Client cl = check new("https://esb-qa.sipr.ucl.ac.be:8243/learningUnits/v1/esb/2020");
        log:printInfo("sending request");
        http:Response res = check cl->get("", {"Authorization": authHeader, "Accept": "application/json"});
        log:printInfo("received response");
        log:printInfo(res.statusCode.toString());
        json|error p = res.getJsonPayload();
        if p is json {
            log:printInfo(p.toString());
        } else {
            log:printInfo("error in payload", p);
        }
        return res;
    }
}
