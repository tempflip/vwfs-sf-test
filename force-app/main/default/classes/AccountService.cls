public with sharing class AccountService {

    public static void rollupOpportunityRandomNumber(Set<Id> accIdSet) {
        Account[] toUpdate = new Account[]{};
        AggregateResult[] oppAggr = [SELECT AccountId, AVG(Random_Number__c)
                                FROM Opportunity
                                WHERE AccountId IN :accIdSet
                                GROUP BY AccountId
                                ];

        for (AggregateResult ar : oppAggr) {
            toUpdate.add(new Account(
                    Id = (Id) ar.get('AccountId'),
                    Average_Random_Number__c = (Decimal) ar.get('expr0')
                ));
        }
        if (!toUpdate.isEmpty()) {
            update toUpdate;
        }
    }
}