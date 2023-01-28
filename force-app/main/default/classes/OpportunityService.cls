public with sharing class OpportunityService {

    private static final String ERR_MSG_RANGE = 'Random Number should be between 0 and 100.';
    private static final String ERR_MSG_MOD = 'Random Number should not be divisible by 3.';


    public static void validateOpportunity(Opportunity[] oppList) {
        for (Opportunity opp : oppList) {
            if (opp.Random_Number__c == null) continue;
            if (opp.Random_Number__c < 0 || opp.Random_Number__c > 100) {
                opp.addError(ERR_MSG_RANGE);
            }

            if (Math.mod((Integer) opp.Random_Number__c, 3) == 0) {
                opp.addError(ERR_MSG_MOD);
            }

        }
    }

    public static void pingAccountNumberRollup(Opportunity[] oppList) {
        Set<Id> accIdSet = new Set<Id>();
        for (Opportunity opp : oppList) {
            if (Trigger.isInsert || opp.Random_Number__c != Trigger.oldMap.get(opp.Id).get('Random_Number__c')) {
                if (opp.AccountId != null) {
                    accIdSet.add(opp.AccountId);
                } else if (Trigger.oldMap.get(opp.Id).get('AccountId') != null) {
                    accIdSet.add((Id) Trigger.oldMap.get(opp.Id).get('AccountId'));
                }
            }
        }
        if (!accIdSet.isEmpty()) {
            AccountService.rollupOpportunityRandomNumber(accIdSet);
        }
    }

}