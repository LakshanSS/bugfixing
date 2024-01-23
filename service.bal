import ballerina/log;
import ballerina/http;

listener http:Listener httpListener = check new (7071);

service / on httpListener {

    function init() returns error? {
        log:printInfo("Service started successfully.");
    }

    resource function get lakshans(@http:Header string api_userId, @http:Header string headerX) returns string {
        log:printInfo("received headers: " + api_userId + " " + headerX);
        return api_userId + " " + headerX;
    }
}
