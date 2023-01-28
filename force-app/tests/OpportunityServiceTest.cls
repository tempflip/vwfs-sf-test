@isTest
public with sharing class OpportunityServiceTest {
    @isTest
    public static void validateOpportunity_insert_happy1() {
        Opportunity opp = new Opportunity(Name = 'hello', StageName = 'New', CloseDate = Date.today().addDays(100),
                                        Random_Number__c = 10);
        Test.startTest();
            insert opp;
        Test.stopTest();
        System.assert(true);
    }

    @isTest
    public static void validateOpportunity_insert_happy2() {
        Opportunity opp = new Opportunity(Name = 'hello', StageName = 'New', CloseDate = Date.today().addDays(100),
                                        Random_Number__c = 10.1);
        Test.startTest();
            insert opp;
        Test.stopTest();
        System.assert(true);
    }

    @isTest
    public static void validateOpportunity_update_happy1() {
        Opportunity opp = new Opportunity(Name = 'hello', StageName = 'New', CloseDate = Date.today().addDays(100),
                                        Random_Number__c = 10);
        Test.startTest();
            insert opp;
            opp.Random_Number__c = 20;
            update opp;
        Test.stopTest();
        System.assert(true);
    }    

    @isTest
    public static void validateOpportunity_insert_sad1() {
        Opportunity opp = new Opportunity(Name = 'hello', StageName = 'New', CloseDate = Date.today().addDays(100),
                                        Random_Number__c = 101);

        Test.startTest();
            Boolean catched = false;
            try {
                insert opp;
            } catch(System.DmlException e) {
                catched = true;
            }
            System.assert(catched);
        Test.stopTest();
    }    

    @isTest
    public static void validateOpportunity_insert_sad2() {
        Opportunity opp = new Opportunity(Name = 'hello', StageName = 'New', CloseDate = Date.today().addDays(100),
                                        Random_Number__c = -0);

        Test.startTest();
            Boolean catched = false;
            try {
                insert opp;
            } catch(System.DmlException e) {
                catched = true;
            }
            System.assert(catched);
        Test.stopTest();
    }    

    @isTest
    public static void validateOpportunity_insert_sad3() {
        Opportunity opp = new Opportunity(Name = 'hello', StageName = 'New', CloseDate = Date.today().addDays(100),
                                        Random_Number__c = 9);

        Test.startTest();
            Boolean catched = false;
            try {
                insert opp;
            } catch(System.DmlException e) {
                catched = true;
            }
            System.assert(catched);
        Test.stopTest();
    }

    @isTest
    public static void validateOpportunity_update_sad1() {
        Opportunity opp = new Opportunity(Name = 'hello', StageName = 'New', CloseDate = Date.today().addDays(100),
                                        Random_Number__c = 10);
        Test.startTest();
            insert opp;
            opp.Random_Number__c = 12;
            Boolean catched = false;
            try {
                update opp;
            } catch(System.DmlException e) {
                catched = true;
            }
            System.assert(catched);
        Test.stopTest();
    }    
    

}