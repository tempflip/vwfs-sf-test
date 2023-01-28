@isTest
public with sharing class OpportunityServiceTest {
    // @isTest
    // public static void validateOpportunity_insert_happy1() {
    //     Opportunity opp = new Opportunity(Name = 'hello', StageName = 'New', CloseDate = Date.today().addDays(100),
    //                                     Random_Number__c = 10);
    //     Test.startTest();
    //         insert opp;
    //     Test.stopTest();
    //     System.assert(true);
    // }

    // @isTest
    // public static void validateOpportunity_insert_happy2() {
    //     Opportunity opp = new Opportunity(Name = 'hello', StageName = 'New', CloseDate = Date.today().addDays(100),
    //                                     Random_Number__c = 10.1);
    //     Test.startTest();
    //         insert opp;
    //     Test.stopTest();
    //     System.assert(true);
    // }

    // @isTest
    // public static void validateOpportunity_update_happy1() {
    //     Opportunity opp = new Opportunity(Name = 'hello', StageName = 'New', CloseDate = Date.today().addDays(100),
    //                                     Random_Number__c = 10);
    //     Test.startTest();
    //         insert opp;
    //         opp.Random_Number__c = 20;
    //         update opp;
    //     Test.stopTest();
    //     System.assert(true);
    // }    

    // @isTest
    // public static void validateOpportunity_insert_sad1() {
    //     Opportunity opp = new Opportunity(Name = 'hello', StageName = 'New', CloseDate = Date.today().addDays(100),
    //                                     Random_Number__c = 101);

    //     Test.startTest();
    //         Boolean catched = false;
    //         try {
    //             insert opp;
    //         } catch(System.DmlException e) {
    //             catched = true;
    //         }
    //         System.assert(catched);
    //     Test.stopTest();
    // }    

    // @isTest
    // public static void validateOpportunity_insert_sad2() {
    //     Opportunity opp = new Opportunity(Name = 'hello', StageName = 'New', CloseDate = Date.today().addDays(100),
    //                                     Random_Number__c = -0);

    //     Test.startTest();
    //         Boolean catched = false;
    //         try {
    //             insert opp;
    //         } catch(System.DmlException e) {
    //             catched = true;
    //         }
    //         System.assert(catched);
    //     Test.stopTest();
    // }    

    // @isTest
    // public static void validateOpportunity_insert_sad3() {
    //     Opportunity opp = new Opportunity(Name = 'hello', StageName = 'New', CloseDate = Date.today().addDays(100),
    //                                     Random_Number__c = 9);

    //     Test.startTest();
    //         Boolean catched = false;
    //         try {
    //             insert opp;
    //         } catch(System.DmlException e) {
    //             catched = true;
    //         }
    //         System.assert(catched);
    //     Test.stopTest();
    // }

    // @isTest
    // public static void validateOpportunity_update_sad1() {
    //     Opportunity opp = new Opportunity(Name = 'hello', StageName = 'New', CloseDate = Date.today().addDays(100),
    //                                     Random_Number__c = 10);
    //     Test.startTest();
    //         insert opp;
    //         opp.Random_Number__c = 12;
    //         Boolean catched = false;
    //         try {
    //             update opp;
    //         } catch(System.DmlException e) {
    //             catched = true;
    //         }
    //         System.assert(catched);
    //     Test.stopTest();
    // }    
    
    @isTest
    public static void calculateAvg_happy1() {
        Account a = new Account(Name = 'x');
        insert a;
        Opportunity opp1= new Opportunity(Name = 'hello', StageName = 'New', CloseDate = Date.today().addDays(100),
                                        AccountId = a.Id,
                                        Random_Number__c = 10);
        Opportunity opp2 = new Opportunity(Name = 'hello', StageName = 'New', CloseDate = Date.today().addDays(100),
                                        AccountId = a.Id,
                                        Random_Number__c = 20);


        system.assertEquals(null, [SELECT Average_Random_Number__c FROM Account WHERE Id = :a.Id].Average_Random_Number__c);
        insert opp1;
        system.assertEquals(10, [SELECT Average_Random_Number__c FROM Account WHERE Id = :a.Id].Average_Random_Number__c);
        insert opp2;
        system.assertEquals(15, [SELECT Average_Random_Number__c FROM Account WHERE Id = :a.Id].Average_Random_Number__c);
    }
}