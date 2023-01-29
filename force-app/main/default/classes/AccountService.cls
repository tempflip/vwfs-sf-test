public with sharing class AccountService {
    public static final Integer EVENT_RANGE_D = 60;
    public static final Integer EVENT_RANGE_H = 70;
    
    public static void pingAccountNumberRollup(Account[] accList) {
        Set<Id> accIdSet = new Set<Id>();
        for(Account acc : accList) {
            if (acc.Average_Random_Number__c != Trigger.oldMap.get(acc.Id).get('Average_Random_Number__c')) {
                accIdSet.add(acc.Id);
            }
        }
        rollupOpportunityRandomNumber(accIdSet);
    }

    public static void rollupOpportunityRandomNumber(Set<Id> accIdSet) {
        Map<Id, Account> toUpdate = new Map<Id, Account>();
        AggregateResult[] oppAggr = [SELECT AccountId, AVG(Random_Number__c)
                                FROM Opportunity
                                WHERE StageName = 'Closed Won'
                                AND AccountId IN :accIdSet
                                GROUP BY AccountId
                                ];
        for (Id accId : accIdSet) {
            toUpdate.put(accId, new Account(Id = accId, Average_Random_Number__c = 0));
        }

        for (AggregateResult ar : oppAggr) {
            toUpdate.get((Id) ar.get('AccountId'))
                            .Average_Random_Number__c = (Decimal) ar.get('expr0');
        }
        update toUpdate.values();
    }

    public static void createEvents(Account[] accList) {
        Event[] evList = new Event[]{};
        for (Account acc : accList) {
            if (acc.Average_Random_Number__c == Trigger.oldMap.get(acc.Id).get('Average_Random_Number__c')) {
                continue;
            }
            if (acc.Average_Random_Number__c < EVENT_RANGE_D
                || acc.Average_Random_Number__c > EVENT_RANGE_H) {
                    continue;
                }
            evList.add(new Event(
                WhatId = acc.Id,
                DurationInMinutes = 30,
                Subject = 'Value is '
                            + acc.Average_Random_Number__c
                            +' , please contact customer',
                ActivityDateTime = System.now().addDays(3)
            ));
        }
        if (!evList.isEmpty()) {
            insert evList;
        }
    }
}