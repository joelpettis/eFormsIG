//**********************************************************************************/
// Operation Definition for Intantiating the workflow from a Plan Definition
//**********************************************************************************/
Instance: InstantiateFormWorkflow
InstanceOf: OperationDefinition
Usage: #definition

* url       = "http://ontario.ca/fhir/OperationDefinition/instantiateFormWorkflow"
* name      = "InstantiateFormWorkflow"
* title     = "[base]/PlanDefinition/[id]/$instantiateFormWorkflow"
* status    = #draft
* kind      = #operation
* date      = "2025-07-04"
* publisher = "Ontario Health eForms"
* description = """
Instantiates the eform Workflow by creating a ServiceRequesta as well as all required Tasks, 
as defined by the Plan Definition.activity[].  The Service `Request Questionnaire extension`
provides the reference(s) to the assoicated Quesstionnaires. 


The operation **persists** all resources derived from the associate 
Paln Definition in the Repository and then returns a
**collection** Bundle snapshot (plus an optional OperationOutcome).
"""

// Scope
* code      = #instantiateFormWorkflow
* resource  = #PlanDefinition
* system    = false
* type      = false
* instance  = true

// ---------- INPUT ----------

* parameter[+].name          = #subject
* parameter[=].use           = #in
* parameter[=].min           = 1
* parameter[=].max           = "1"
* parameter[=].type          = #Reference
* parameter[=].targetProfile[+] = $EFormPatient
* parameter[=].documentation = "The individual who is the subject of the eForm. Sourced from CMS when possible. "

* parameter[+].name          = #requester
* parameter[=].use           = #in
* parameter[=].min           = 0
* parameter[=].max           = "1"
* parameter[=].type          = #Reference
* parameter[=].targetProfile[+] = $EFormPractitionerRole
* parameter[=].targetProfile[+] = $EFormOrganization
* parameter[=].documentation = "The Organization (or PractionerRole) __placing__ the ServiceRequest.  They are the initiators of the eForms workflow"

* parameter[+].name          = #performer
* parameter[=].use           = #in
* parameter[=].min           = 0
* parameter[=].max           = "1"
* parameter[=].type          = #Reference
* parameter[=].targetProfile[+] = $EFormPractitionerRole
* parameter[=].targetProfile[+] = $EFormOrganization
* parameter[=].documentation = "The Organization (or PractionerRole) who will be __assigned__ the ServiceRequest.  They will be required to complete (at __least__ one) QuestionnaireResponse"

// ---------- OUTPUT ----------
* parameter[+].name          = #bundle
* parameter[=].use           = #out
* parameter[=].min           = 1
* parameter[=].max           = "1"
* parameter[=].type          = #Bundle
* parameter[=].documentation = """
A Bundle of type **collection** containing the persisted ServiceRequest as the
first entry and all associated Task resources as subsequent entries.  
Clients should treat the bundle as a read‑only snapshot of the workflow that
has just been created.
"""

* parameter[+].name          = #outcome
* parameter[=].use           = #out
* parameter[=].min           = 0
* parameter[=].max           = "1"
* parameter[=].type          = #OperationOutcome
* parameter[=].documentation = "Optional OperationOutcome conveying warnings or informational messages."


//**********************************************************************************/
// Operation Definition for Transitioning the workflow
//**********************************************************************************/

Instance: TransitionWorkflow
InstanceOf: OperationDefinition
Usage: #definition

* url       = "http://ontario.ca/fhir/OperationDefinition/transitionWorkflow"
* name      = "TransitionWorkflow"
* title     = "[base]/ServiceRequest/[id]/$transitionWorkflow"
* status    = #draft
* kind      = #operation
* date      = "2025-07-06"
* publisher = "Ontario Health eForms"
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