//**********************************************************************************/
// Service Request profile
//**********************************************************************************/
Profile:   EFormsServiceRequest
Parent:    $SDCServiceRequestCanonical   // sdc-task
Id: EFormsServiceRequest
Title:     "Service Request Profile"
Description: """
Service Request Profile for OH eForms which extends sdc-service-request.

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