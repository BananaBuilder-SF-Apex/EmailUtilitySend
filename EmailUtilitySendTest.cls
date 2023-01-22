/**
* @Name EmailSendUtilityTest
* @Author Andy Bennett
* @Date 1/21/2023
* @Group Test
* @Description This class is a Test Class for the EmailSendUtility Class.
* It Tests both single and mass email send methods.
*/
@isTest
private class EmailSendUtilityTest {    
    /** 
    * @Description This is a test for the EmailSendUtility.massEmailSend method.
    */
    @isTest static void massEmailSendTest(){
        //Create new Contacts and get Ids
        List<Id> targetIds = TestDataFactory.generateContactIds(1);
        //Query an email template from the org. 
        //Unable to create a new Folder and then create a new Email template to store in folder for test.
        List<EmailTemplate> templates = [SELECT Id, Name, FolderId FROM EmailTemplate Limit 1];
        //Sets reply to value for emails
        String replyTo = 'replyTo@email.com';
        //Sets display name of the email
        String displayName = 'Display Name!';
        
        Test.startTest();
        EmailSendUtility.massEmailSend(targetIds, templates[0], replyTo, displayName);
        Integer invocations = Limits.getEmailInvocations();
        Test.stopTest();
        
        system.assertEquals(1, invocations, '1 Mass Email Should have been sent');
    }
    
    /** 
    * @Description This is a test for the EmailSendUtility.singleEmailSend method.
    */
    @isTest static void singleEmailSendTest(){
        //Set To Email Address Value
        String toEmail = 'test@email.com';
        //Sets Subject value
        String subject = 'Subject!';
        //Sets Body value
        String body = 'This is the body of the email!';
        
        Test.startTest();
        EmailSendUtility.singleEmailSend(toEmail, subject, body);
        Integer invocations = Limits.getEmailInvocations();
        Test.stopTest();
        
        system.assertEquals(1, invocations, '1 Single Email Should have been sent');
    }
}
