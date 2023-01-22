# EmailUtilitySend

This is an Apex Utility Class that can be used to send single or mass emails.

The Email Utility Class has 2 functionalities.
- Sending a mass emails which has these parameters: 
  - A list of Ids, used in the mass email send as TargetIds to know who should receive this email
  - An email template record
  - A String (replyTo) that will set the reply To address on the email when a Contact wants to respond
  - A String (displayName) that will se the display name of the Sender
    - Instead of 'bananabuilder@email.com', sender will show as 'Banana Builder'
- Sending a single email which has these parameters:
  - A String that will be the to Address of who the email will go to
  - A String that will be the subject of the email
  - A String that will be the Body of the email
  
Email Utility Send Test Class:
- Utilizes a TestDataFactory that takes an Integer as a parameter, creates that many Contacts, and returns a list of Ids.
- Uses Limits.getEmailInvocations in the test in order to determine if an email was sent
