import ballerina/log;
import ballerina/http;

listener http:Listener httpListener = check new (7071);

service / on httpListener {

    function init() returns error? {
        log:printInfo("Service started successfully.");
    }

    resource function get lakshans(@http:Header string api\-userId) returns string {
        log:printInfo("received header: " + api\-userId);
        return api\-userId + " " + api\-userId;
    }
}
