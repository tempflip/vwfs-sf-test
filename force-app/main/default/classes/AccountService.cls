public with sharing class AccountService {

    public static void rollupOpportunityRandomNumber(Set<Id> accIdSet) {
        Map<Id, Account> toUpdate = new Map<Id, Account>();
        AggregateResult[] oppAggr = [SELECT AccountId, AVG(Random_Number__c)
                                FROM Opportunity
                                WHERE AccountId IN :accIdSet
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
}