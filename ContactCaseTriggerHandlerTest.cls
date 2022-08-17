@isTest
public with sharing class ContactCaseTriggerHandlerTest {
    public ContactCaseTriggerHandlerTest() {
 static testMethod void TestMe(){
        String errorMsg = 'Please Close Open Activities to update...';
        Test.startTest();
        
        set<id> setIds = new set<id>();
        try{
            Contact co = new Contact(
                FirstName='test123',
                LastName = 'test',
                Level__c= 'Primary'
            );
            insert co;
            setIds.add(co.id);
            
            Contact co1 = new Contact(
                FirstName='test234',
                LastName = 'test2',
                Level__c= 'Secondary'
            );
            insert co1;
            setIds.add(co1.id);
            
            Contact co2 = new Contact(
                FirstName='test2345',
                LastName = 'test23',
                Level__c= 'Tertiary'
            );
            insert co2;
            setIds.add(co2.id);
            
            
        }
        
        catch(Exception exc){
            System.assertEquals(exc.getMessage(), errorMsg);
        }
        Test.stopTest();
    }
    
    }
}
