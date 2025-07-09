

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