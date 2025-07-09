//**********************************************************************************/
// Subscription profile
//**********************************************************************************/
Profile:   EFormsSubscription
Parent:    Subscription 
Id: EFormSubscription
Title:     "Subscription Profile"
Description: """
Subscription Profile for OH eForms, based on the R4 version.

A Subscription is a publish-subscribe (pub/sub) mechanism built into the FHIR specification.
Subscriptions are defined using the Subscription resource, which specifies what type of data
is being subscribed to and how the recipient should be notified.

`status` - When a Subscription is created by a client, it should have a status of requested. Smile CDR will process this Subscription, and if it is valid, the status will automatically be changed to active, meaning that the Subscription is now being processed.
`criteria` - This is a FHIR search query URL that will be used to determine which resources apply to the Subscription. These resources will trigger a notification when they change. See Criteria below for more information.
`channel.type - This is the mechanism for delivery, such as rest-hook, websocket, email, sms, or message. See Channel Types for more information.
`channel.endpoint` - For channel types that require the server to initiate a connection to the client, this is the URL of the endpoint to which the server should connect.
`channel.payload` - This is the MIME type encoding to use (e.g. application/fhir+json for JSON data).
`channel.extension` - Providing an extension allows finer control of subscription handling. Some extensions are channel specific, while others are used to define retry handling.

With Subscriptions enabled, Smile creates a Matching Queue and sends all created/updated 
QuestionnaireResponse or Communication resources to that queue. This queue is drained by a 
Subscription Matching module. The Subscription Matcher module uses its FHIR Storage module 
to retrieve two resource types required for subscription matching: Subscription and SearchParameter. 
The Subscription Matcher module maintains in-memory caches of both of these resources that it updates 
from its FHIR Storage module every 60 seconds. 

In the requirements, eForms is required to send email notifications whenever a 
QuestionnaireResponse or Communication Resource is submitted by the form filler to the FHIR 
Repository.  While Smile does offer the ability to trigger email notifications via smtp, OH 
has a requirement that their AWS Simple Email Service (SES) must be used in order to send notifications. 
In addition to notifications, Subscriptions will also be utilized to trigger the integration with 
the OH ObjectStore 

AWS SES Delivery - When an QuestionnaireResponse or Communication resource is submitted 
and the subscription is triggered in the FHIR Server, Smile will trigger a RESTful API call to the
AWS SES API. 

Object Store Delivery - This Subscription class will automatically invoke an SDC extraction by invoking the QuestionnaireResponse/$extraction operation which will convert the matched QuestionnaireResponse resource into a MessageBundle as defined by the ObjectStore Implementation Guide (IG). 

A custom Subscription Delivery class is invoked whenever the matching criteria defined in the 
Subscription Resource for Object Store integration.  
"""

* ^version = "1.0.0"
* ^status  = #active