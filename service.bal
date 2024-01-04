import ballerina/log;
import ballerina/http;

configurable string username = "lakshans";
configurable Person customer = ?;

listener http:Listener httpListener = check new (7071);

service / on httpListener {

    function init() returns error? {
        log:printInfo("Service started successfully.");
        log:printInfo(username + "is the username");
        log:printInfo(customer.toString());
    }

    resource function get username() returns string {
        return username + "is the username";
    }

    resource function get customer() returns Person {
        return customer;
    }
}

public type Person record {|
    string name;
    int age;
    Contact contact;
|};

public type Contact record {|
    string email;
    string[] numbers;
|};
