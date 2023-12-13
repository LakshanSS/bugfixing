import ballerina/log;
import ballerina/http;

configurable string username = "lakshans";
listener http:Listener httpListener = check new (7071);

service / on httpListener {

    function init() returns error? {
        log:printInfo("Service started successfully.");
        log:printInfo(username + "is the username");
    }

    resource function get username() returns string {
        return username + "is the username";
    }
}
