//**********************************************************************************/
// Operation Definition for Transitioning the workflow
//**********************************************************************************/

Instance: TransitionWorkflow
InstanceOf: OperationDefinition
Usage: #definition

* url       = "http://ontario.ca/fhir/eforms/OperationDefinition/TransitionWorkflow"
* name      = "TransitionWorkflow"
* title     = "[base]/ServiceRequest/[id]/$transitionWorkflow"
* status    = #draft
* kind      = #operation
* date      = "2025-07-06"
* publisher = "Ontario Health eForms"
* jurisdiction = urn:iso:std:iso:3166:-2#CA-ON "Ontario"
* description = """
Instance-level operation on ServiceRequest that changes the businessStatus
extension (eForms workflow state) and updates associated Task resources.
"""

* code      = #transitionWorkflow
* resource  = #ServiceRequest
* system    = false
* type      = false
* instance  = true

// ---------- INPUT ----------
* parameter[+].name          = #targetStatus
* parameter[=].use           = #in
* parameter[=].min           = 1
* parameter[=].max           = "1"
* parameter[=].type          = #code
* parameter[=].binding.strength = #required
* parameter[=].binding.valueSet = $EFormsBusinessStatusVS
* parameter[=].documentation = "Desired new businessStatus value."

// ---------- OUTPUT ----------
* parameter[+].name          = #bundle
* parameter[=].use           = #out
* parameter[=].min           = 1
* parameter[=].max           = "1"
* parameter[=].type          = #Bundle
* parameter[=].documentation = """
Snapshot Bundle (type=collection) containing the updated ServiceRequest and
all Task resources whose status changed or were newly created by the transition.
"""

* parameter[+].name          = #outcome
* parameter[=].use           = #out
* parameter[=].min           = 0
* parameter[=].max           = "1"
* parameter[=].type          = #OperationOutcome
* parameter[=].documentation = "Optional OperationOutcome with warnings or authorization errors."