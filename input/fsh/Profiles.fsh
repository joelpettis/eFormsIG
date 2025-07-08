

//**********************************************************************************/
// Task profile
//**********************************************************************************/
Profile:   EFormsTaskProfile
Parent:    $SDCTaskCanonical   // sdc-task
Id: EFormsTaskProfile
Title:     "Task Profile"
Description: """
Task Profile for OH eForms which extends sdc-task.
Adds the standard **task-replaces** extension so a new Task can
point to the Task(s) it supersedes.

The task is utilized as a central workflow management resource.
It tracks the work item of getting a specific eForm completed. It includes custom statuses status,
 who requested it, and who is currently assigned to work on it, and any communication between parties.
"""
* ^version = "1.0.0"
* ^status  = #active

// Add the existing ‘task-replaces’ extension
* extension contains $TaskReplacesExtCanonical named task-replaces 0..1 MS  
* businessStatus 0..1 MS
* focus 1..1 MS
* focus only Reference(EFormsServiceRequest)

//patient required as the reference
* for 1..1 MS
* for only Reference(Patient)

* requester only Reference(Organization or PractitionerRole)
* owner 1..1 MS
* owner only Reference(Organization or PractitionerRole)
* note 0..1 MS
* code 1..1 MS
* code from $EFormsTaskCodeVS 
* input[questionnaire] 1..1 MS
* input[questionnaire] ^definition = "Indicates the questionnaire(s) to be completed."
* input[questionnaire] ^condition = "sdc-t1"
* input[questionnaire].type = $temp#questionnaire
* input[questionnaire].type MS
* input[questionnaire].value[x] only canonical
* input[questionnaire].value[x] MS
* input[questionnaire].value[x] ^short = "url"
* output[response] 0..1 MS
* output[response] ^definition = "Indicates the questionnaire response resulting from the request."
* output[response].type = $temp#questionnaire-response
* output[response].type MS
* output[response].value[x] only Reference(QuestionnaireResponse)
* output[response].value[x] MS
* output[response].value[x] ^short = "url"


Invariant: sdc-t1
Description: "Either code is 'fulfill', focus is ServiceRequest and no 'questionnaire' input; or code is 'complete-questionnaire', focus is omitted and 'questionnaire' input is present"
* severity = #error
* expression = "(code.coding.exists(code='fulfill' and system='http://hl7.org/fhir/CodeSystem/task-code') and (focus.resolve() is ServiceRequest) and input.exists(type.coding.exists(system='http://hl7.org/fhir/uv/sdc/CodeSystem/temp' and code='questionnaire')).not()) or (code.coding.exists(code='complete-questionnaire' and system='http://hl7.org/fhir/uv/sdc/CodeSystem/temp') and focus.exists().not() and input.exists(type.coding.exists(system='http://hl7.org/fhir/uv/sdc/CodeSystem/temp' and code='questionnaire')))"

//**********************************************************************************/
// Service Request profile
//**********************************************************************************/
Profile:   EFormsServiceRequest
Parent:    $SDCServiceRequestCanonical   // sdc-task
Id: EFormsServiceRequest
Title:     "Service Request Profile"
Description: """
Service Request Profile for OH eForms which extends sdc-service-request.
Adds some additional extensions to be described <<TBD>>

Utilized in Request-based solicitation as defined by SDC, this resource is the initial trigger
for the entire workflow.  
 
A  ServiceRequest is created by the system once the PlanDefinition is selected.  

When the ServiceRequest is created, the system will generate a corresponding Task(s) 
and to see fulfillment of the request by generating and populating the QuestionnaireResponse resources. 
"""
* ^version = "1.0.0"
* ^status  = #active

// Business Status extension
* extension contains $eFormsBusinessStatus named businessStatus 1..1 MS // Add the existing ‘task-replaces’ extension
* extension[businessStatus].valueCodeableConcept from $EFormsBusinessStatusVS (required)
* extension[businessStatus] ^short = "Workflow state (must be one of the defined business-status codes)"

* requester only Reference(Organization or PractitionerRole)
* performer 1..1 MS
* performer only Reference(Organization or PractitionerRole)
* subject 1..1 MS
* subject only Reference(Patient)
* instantiatesCanonical 1..1 MS


//**********************************************************************************/
// Questionnaire profile
//**********************************************************************************/
Profile:   EFormsQuestionnaire
Parent:    $SDCQuestionnaireCanonical   // sdc-task
Id: EFormQuestionnaire
Title:     "Questionnaire Profile"
Description: """
Questionnaire Profile for OH eForms which extends sdc-questionnaire.

Requires the assemble-expectation extensions wiith the expectation that all will beindependent. 
The assemble-expectation SHALL either be `independent-root-or-child` to indicate it is a root Questionnaires, 
or `independent-child` for all child Questionnaires

One or more Questionnaires comprise the template itself, containing all the questions, 
answer options, and structure. Questionnaires may be assembled from other sub-Questionnaires 
utilizing FHIR’s Structured Data Capture’s Modular Forms.

The `sub-questionnaire` is utilized to indicate that the display item on which this 
extension appears should be replaced with the referenced Questionnaire

"""
* ^version = "1.0.0"
* ^status  = #active

// require assemble-expectation
* extension[assemble-expectation] 1..1 MS
* extension[assemble-expectation] ^short = "For eForms, all forms must be independent.  Use independent-root-or-child to indicate it is a root Questionnaires, and independent-child for all child Questionnaires"

// hide extensions we won't use
* extension[copyrightLabel] 0..0
* extension[performerType] 0..0
* extension[versionAlgorithm] 0..0
* item.extension[hidden] 0..0
* item.extension[answerConstraint] 0..0

// add Sub Questionnaire Sub
* item.extension contains $QuestionnaireSubExtCanonical named subQuestionnaire 0..1 MS


//**********************************************************************************/
// QuestionnaireResponse profile
//**********************************************************************************/
Profile:   EFormsQuestionnaireResponse
Parent:    $SDCQuestionnaireResponseCanonical   // sdc-task
Id: EFormQuestionnaireResponse
Title:     "Questionnaire Response Profile"
Description: """
QuestionnaireResponse Profile for OH eForms which extends sdc-QuestionnaireResponse.

	
This Resource represents a completed (or partially completed) eForm, 
containing the patient's or practitioner's answers 
to the questions from the Questionnaire.
"""
* ^version = "1.0.0"
* ^status  = #active


//**********************************************************************************/
// DocumentReference profile
//**********************************************************************************/
Profile:   EFormsDocumentReference
Parent:    DocumentReference 
Id: EFormDocumentReference
Title:     "Document Reference Profile"
Description: """
DocumentReference Profile for OH eForms, based on the R4 version.
Stores metadata about an attachment that was uploaded to the OTN file service.  
This is a valueReference in an item in the QuestionnaireResponse. 
"""
* ^version = "1.0.0"
* ^status  = #active

//**********************************************************************************/
// Communication profile
//**********************************************************************************/
Profile:   EFormsCommunication
Parent:    Communication 
Id: EFormCommunication
Title:     "Communication Profile"
Description: """
Communication Profile for OH eForms, based on the R4 version.
	
Notifications, messages, or other communications related to the eForm workflow 
(e.g., `Form X has been assigned to you, A comment was added to Form Y`).

A new Communication resource will be generated to capture the Bi-Directional Communication requirement.  

There will be a Subscription Resource which will generate a Subscription each time
a Communication is saved in a specific state (proposal: in-progress or completed )
"""
* ^version = "1.0.0"
* ^status  = #active

//**********************************************************************************/
// Plan Definition profile
//**********************************************************************************/
Profile:   EFormsPlanDefinition
Parent:    PlanDefinition
Id: EFormPlanDefinition
Title:     "Plan Definition Profile"
Description: """
Plan Definition Profile for OH eForms, based on the R4 version.

The Plan Definition represents the Form and Workflow Template. 
It defines a multi-step process in a shareable and executable way
that represents a standard definition for the workflow and composite forms, 
if applicable.  It acts as a manifest, listing all the modular components such as
(Questionnaires, Tasks and Organizaiton  
"""
* ^version = "1.0.0"
* ^status  = #active


//**********************************************************************************/
// Provenance profile
//**********************************************************************************/
Profile:   EFormsProvenance
Parent:    Provenance 
Id: EFormProvenance
Title:     "Provenance Profile"
Description: """
Provenance Profile for OH eForms, based on the R4 version.

The Provenance resource is the immutable audit trail of significant events. 
A new Provenance resource must be created for every significant business action 
(e.g., form creation, submission, revision, status change, revocation). 
It meticulously records who did what, when they did it, and to which specific version
 of a resource the action was applied.
"""
* ^version = "1.0.0"
* ^status  = #active

//**********************************************************************************/
// Organization profile
//**********************************************************************************/
Profile:   EFormsOrganization
Parent:    Organization 
Id: EFormOrganization
Title:     "Organization Profile"
Description: """
Organization Profile for OH eForms, based on the R4 version.

The Organization can be referenced as a Form Initiator, a Form Owner or a Notificaiton Recipient
"""
* ^version = "1.0.0"
* ^status  = #active

//**********************************************************************************/
// PractitionerRole profile
//**********************************************************************************/
Profile:   EFormsPractitionerRole
Parent:    PractitionerRole 
Id: EFormPractitionerRole
Title:     "PractitionerRole Profile"
Description: """
PractitionerRole Profile for OH eForms, based on the R4 version.

The PractitionerRole represents a specific set of roles at an Organization,  
referenced as a Form Initiator, a Form Owner or a Notificaiton Recipient
"""
* ^version = "1.0.0"
* ^status  = #active

//**********************************************************************************/
// Patient profile
//**********************************************************************************/
Profile:   EFormsPatient
Parent:    Patient 
Id: EFormPatient
Title:     "Patient Profile"
Description: """
Patient Profile for OH eForms, based on the R4 version.

The Patient represents the individual who is the subject of the eForm.  
This information is retrieved from CMS. 
"""
* ^version = "1.0.0"
* ^status  = #active

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