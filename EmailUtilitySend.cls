/**
* @Name EmailSendUtility
* @Author Andy Bennett
* @Date 1/21/2022
* @Group Utility
* @Description This class is a reusable utility class used for both single email send and mass email sends.
*/
public class EmailSendUtility {
    /** 
    * @Description This utility method handles sending mass emails.
    * @Param List of Ids for mass email send, template the email will use, replyTo (optional) to set reply to email, display name for sender email.
    */
	public static void massEmailSend(List<Id> targetIds, EmailTemplate template, String replyTo, String displayName) {
        if(!targetIds.isEmpty()) {
                //Create new Mass Email Send instance
                List<Messaging.MassEmailMessage> emailList = new List<Messaging.MassEmailMessage>();
                Messaging.MassEmailMessage mail = new Messaging.MassEmailMessage();

                //Set MassEmailMessage values
                mail.setSenderDisplayName(displayName);
                mail.setTemplateId(template.Id);
                mail.setTargetObjectIds(targetIds);
            	//Check if replyTo param is blank before setting mail value
                if(String.IsNotBlank(replyTo)){
                    mail.setReplyTo(replyTo);
                }
                emailList.add(mail);
                //Make sure list is not empty, and send Mass Email
                if(!emailList.isEmpty()) {
                    Messaging.sendEmail(emailList);
                }
        }
    }

    /** 
    * @Description This utility method handles sending a single email.
    * @Param email address for who this email will go to, subject of the email, the body of the email.
    */
    public static void singleEmailSend(String toEmail, String subject, String body) {
        //Create new Single email
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        //set SingleEmailMessage values
        String[] toAddress = new String[]{toEmail};
        mail.setToAddresses(toAddress);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        //Send Single email
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
    }
}