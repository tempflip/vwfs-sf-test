trigger Account_Trigger on Account(after update) {
    AccountService.pingAccountNumberRollup(trigger.new);
    AccountService.createEvents(trigger.new);
}
