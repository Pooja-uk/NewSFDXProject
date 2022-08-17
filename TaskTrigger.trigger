trigger TaskTrigger on Case (after insert, after update) {
    List<Task> insertTask = new List<Task>();
    for(Case c: Trigger.new)
    {
        Task ts = new Task();
        if(c.Contact!=NULL)
            ts.WhoId = c.Id;
        ts.Status = 'Not Started';
        ts.Subject = c.CaseNumber ;
        ts.Priority = 'Normal';
        if(c.Priority == 'High'){
            ts.ActivityDate = Date.valueOf(c.CreatedDate)+7;
        }
        if(c.Priority == 'Medium'){
            ts.ActivityDate = Date.valueOf(c.CreatedDate)+14;
        }
        if(c.Priority == 'Low'){
            ts.ActivityDate = Date.valueOf(c.CreatedDate)+21;
        }
        insertTask.add(ts);
    }
    insert insertTask;
}