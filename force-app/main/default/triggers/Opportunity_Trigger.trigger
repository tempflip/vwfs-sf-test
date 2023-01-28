trigger Opportunity_Trigger on Opportunity(before insert, before update, after insert, after update) {
    if (Trigger.isBefore) {
        OpportunityService.validateOpportunity(trigger.new);
    }
    if (Trigger.isAfter) {
        OpportunityService.pingAccountNumberRollup(trigger.new);
    }
}
