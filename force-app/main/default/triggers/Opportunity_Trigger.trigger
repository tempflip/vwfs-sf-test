trigger Opportunity_Trigger on Opportunity(before insert, before update, after insert, after update, after delete) {
    if (Trigger.isBefore ) {
            OpportunityService.validateOpportunity(trigger.new);            
    } else {
        if (Trigger.isDelete) {
            OpportunityService.pingAccountNumberRollup(trigger.old);            
        } else {
            OpportunityService.pingAccountNumberRollup(trigger.new);
        }
    }

}
