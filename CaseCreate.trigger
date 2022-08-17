trigger CaseCreate on Contact (after insert) {
    list<Case>lstCase = new list<Case>();
        for(Contact aObj : Trigger.new){
            Case cse = new Case();
            cse.Status = 'Working';
            cse.Origin = 'New Contact';
            cse.AccountId = aObj.AccountId;
            cse.ContactId = aObj.Id;
            if(aObj.Level__c != 'none' ){
                cse.Priority = '';
            }
            if( aObj.Level__c == 'Primary'){
                cse.Priority = 'High';
            }
            if(aObj.Level__c == 'Secondary'){
                cse.Priority = 'Medium';
            }
            
            if(aObj.Level__c == 'Tertiary'){
                cse.Priority = 'Low';
            }
            
            lstCase.Add(cse);
            
        }
        insert lstCase;
    
    }
