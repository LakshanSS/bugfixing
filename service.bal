import ballerina/log;
import ballerina/http;

listener http:Listener httpListener = check new (7071);

service / on httpListener {

    function init() returns error? {
        log:printInfo("Service started successfully.");
    }

    resource function get lakshans(@http:Header string lakshans_userId) returns string {
        log:printInfo("received header: " + lakshans_userId);
        return lakshans_userId + " " + lakshans_userId;
    }
}
