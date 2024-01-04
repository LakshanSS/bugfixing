import ballerina/log;
import ballerina/http;
import ballerinax/github;

configurable string username = "lakshans";
configurable github:ConnectionConfig githubConfig  = ?;
listener http:Listener httpListener = check new (7071);

service / on httpListener {

    function init() returns error? {
        log:printInfo("Service started successfully.");
        log:printInfo(username + "is the username");
        log:printInfo(githubConfig.toString());
    }

    resource function get username() returns string {
        
        return username + "is the username";
    }
}
