@isTest
public with sharing class AccountServiceTest {
    @isTest
    public static void calculateAvg_insert_happy1() {
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

    @isTest
    public static void calculateAvg_update_happy1() {
        Account a = new Account(Name = 'x');
        insert a;
        Account a2 = new Account(Name = 'x');
        insert a2;

        Opportunity opp1= new Opportunity(Name = 'hello', StageName = 'New', CloseDate = Date.today().addDays(100),
                                        AccountId = a.Id,
                                        Random_Number__c = 10);
        Opportunity opp2 = new Opportunity(Name = 'hello', StageName = 'New', CloseDate = Date.today().addDays(100),
                                        AccountId = a.Id,
                                        Random_Number__c = 20);

        Opportunity opp3 = new Opportunity(Name = 'hello', StageName = 'New', CloseDate = Date.today().addDays(100),
                                        AccountId = a2.Id,
                                        Random_Number__c = 50);

        insert new Opportunity[]{opp1, opp2, opp3};

        system.assertEquals(15, [SELECT Average_Random_Number__c FROM Account WHERE Id = :a.Id].Average_Random_Number__c);
        system.assertEquals(50, [SELECT Average_Random_Number__c FROM Account WHERE Id = :a2.Id].Average_Random_Number__c);

        opp2.AccountId = a2.Id;
        update opp2;

        system.assertEquals(10, [SELECT Average_Random_Number__c FROM Account WHERE Id = :a.Id].Average_Random_Number__c);
        system.assertEquals(35, [SELECT Average_Random_Number__c FROM Account WHERE Id = :a2.Id].Average_Random_Number__c);
    }

    @isTest
    public static void calculateAvg_update_happy2() {
        Account a = new Account(Name = 'x');
        insert a;
        Account a2 = new Account(Name = 'x');
        insert a2;

        Opportunity opp1= new Opportunity(Name = 'hello', StageName = 'New', CloseDate = Date.today().addDays(100),
                                        AccountId = a.Id,
                                        Random_Number__c = 10);
        Opportunity opp2 = new Opportunity(Name = 'hello', StageName = 'New', CloseDate = Date.today().addDays(100),
                                        AccountId = a.Id,
                                        Random_Number__c = 20);

        Opportunity opp3 = new Opportunity(Name = 'hello', StageName = 'New', CloseDate = Date.today().addDays(100),
                                        AccountId = a2.Id,
                                        Random_Number__c = 50);

        insert new Opportunity[]{opp1, opp2, opp3};

        system.assertEquals(15, [SELECT Average_Random_Number__c FROM Account WHERE Id = :a.Id].Average_Random_Number__c);
        system.assertEquals(50, [SELECT Average_Random_Number__c FROM Account WHERE Id = :a2.Id].Average_Random_Number__c);

        opp1.AccountId = a2.Id;
        opp2.AccountId = a2.Id;
        opp3.AccountId = a.Id;
        update new Opportunity[]{opp1, opp2, opp3};

        system.assertEquals(50, [SELECT Average_Random_Number__c FROM Account WHERE Id = :a.Id].Average_Random_Number__c);
        system.assertEquals(15, [SELECT Average_Random_Number__c FROM Account WHERE Id = :a2.Id].Average_Random_Number__c);
    }

    @isTest
    public static void calculateAvg_update_happy3() {
        Account a = new Account(Name = 'x');
        insert a;
        Account a2 = new Account(Name = 'x');
        insert a2;

        Opportunity opp1= new Opportunity(Name = 'hello', StageName = 'New', CloseDate = Date.today().addDays(100),
                                        AccountId = a.Id,
                                        Random_Number__c = 10);
        Opportunity opp2 = new Opportunity(Name = 'hello', StageName = 'New', CloseDate = Date.today().addDays(100),
                                        AccountId = a.Id,
                                        Random_Number__c = 20);

        Opportunity opp3 = new Opportunity(Name = 'hello', StageName = 'New', CloseDate = Date.today().addDays(100),
                                        AccountId = a2.Id,
                                        Random_Number__c = 50);

        insert new Opportunity[]{opp1, opp2, opp3};

        system.assertEquals(15, [SELECT Average_Random_Number__c FROM Account WHERE Id = :a.Id].Average_Random_Number__c);
        system.assertEquals(50, [SELECT Average_Random_Number__c FROM Account WHERE Id = :a2.Id].Average_Random_Number__c);

        opp2.AccountId = null;
        opp3.AccountId = null;
        update new Opportunity[]{opp1, opp2, opp3};
        system.assertEquals(10, [SELECT Average_Random_Number__c FROM Account WHERE Id = :a.Id].Average_Random_Number__c);
        system.assertEquals(0, [SELECT Average_Random_Number__c FROM Account WHERE Id = :a2.Id].Average_Random_Number__c);
    }            

    @isTest
    public static void calculateAvg_delet_happy1() {
        Account a = new Account(Name = 'x');
        insert a;
        Account a2 = new Account(Name = 'x');
        insert a2;

        Opportunity opp1= new Opportunity(Name = 'hello', StageName = 'New', CloseDate = Date.today().addDays(100),
                                        AccountId = a.Id,
                                        Random_Number__c = 10);
        Opportunity opp2 = new Opportunity(Name = 'hello', StageName = 'New', CloseDate = Date.today().addDays(100),
                                        AccountId = a.Id,
                                        Random_Number__c = 20);

        Opportunity opp3 = new Opportunity(Name = 'hello', StageName = 'New', CloseDate = Date.today().addDays(100),
                                        AccountId = a2.Id,
                                        Random_Number__c = 50);

        insert new Opportunity[]{opp1, opp2, opp3};

        system.assertEquals(15, [SELECT Average_Random_Number__c FROM Account WHERE Id = :a.Id].Average_Random_Number__c);
        system.assertEquals(50, [SELECT Average_Random_Number__c FROM Account WHERE Id = :a2.Id].Average_Random_Number__c);

        delete new Opportunity[]{opp1, opp3};
        system.assertEquals(20, [SELECT Average_Random_Number__c FROM Account WHERE Id = :a.Id].Average_Random_Number__c);
        system.assertEquals(0, [SELECT Average_Random_Number__c FROM Account WHERE Id = :a2.Id].Average_Random_Number__c);
    }                
}