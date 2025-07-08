
//**********************************************************************************/
// Extension: Business Status
//**********************************************************************************/
Extension: BusinessStatus
Id: businessStatus
Title: "OH eForms Business Status Extension paralleling Task.businessStatus"
Description: """
Indicates the business (workflow) status of a ServiceRequest, paralleling Task.businessStatus.
"""

// metadata
* ^status  = #active
* ^version = "1.0.0"
// The extension is intended for use on ServiceRequest
* ^context.type = #element
* ^context.expression = "ServiceRequest"

// Define the value
* value[x] only CodeableConcept
* valueCodeableConcept MS
* value[x] 1..1
* value[x] only CodeableConcept
* valueCodeableConcept from http://ontario.ca/fhir/eforms/ValueSet/business-status (required)
* valueCodeableConcept ^short = "Workflow state (draft | submitted | request-info | processed | completed | revoked | error)"