Alias: $EFormsTaskCodeCS = http://ontario.ca/fhir/eforms/CodeSystem/task-code
Alias: $EFormsBusinessStatusCS = http://ontario.ca/fhir/eforms/CodeSystem/business-status
Alias: $EFormsBusinessStatusVS = http://ontario.ca/fhir/eforms/ValueSet/business-status

//**********************************************************************************
// CodeSystem: OH eForms Task Code
//**********************************************************************************
CodeSystem:  EFormsTaskCode
Id:          task-code
Title:       "OH eForms Task Code System"
Description: "Additional workflow codes used by eForms tasks."
* ^status   = #active
* ^content  = #complete

// ------ eForms specific Statuses
* #complete-section "Complete Questionnaire Response Section"
* #amend-section    "Amend Questionnaire Response Section"


//**********************************************************************************
// ValueSet: OH eForms Task Code ValueSet
//**********************************************************************************
ValueSet:    EFormsTaskCodeVS
Id:          task-code
Title:       "OH eForms Task Code ValueSet"
Description: """
Allowed codes for `Task.code` in the eForms implementation guide.
Combines base FHIR Task codes, SDC codes, and eForms-specific codes.
"""
* ^status = #active

// Base FHIR Task.codes (e.g., 'fulfill')
* include codes from system http://hl7.org/fhir/CodeSystem/task-code

// SDC-specific Task codes (e.g., 'complete-questionnaire')
* include codes from system http://hl7.org/fhir/uv/sdc/CodeSystem/temp

// eForms codes
* include codes from system $EFormsTaskCodeCS




// ──────────────────────────────────────────────────────────────────────────────
// CodeSystem: eForms Business Status
// ──────────────────────────────────────────────────────────────────────────────
CodeSystem: EFormsBusinessStatusCS
Id: business-status-cs
Title: "eForms Business Status CodeSystem"
Description: """
Codes representing the eForms workflow states that appear in the
`businessStatus` extension on ServiceRequest and Task.
"""
* ^url = $EFormsBusinessStatusCS
* ^status = #active
* ^content = #complete

* #draft           "Draft"                     "The form is being prepared and is not yet submitted."
* #submitted       "Submitted"                 "The form package has been delivered for processing."
* #request-info    "Request for Information"   "Additional data has been requested."
* #processed       "Processed"                 "The submission has been accepted and processed."
* #completed       "Completed"                 "All steps are finished; no further action required."
* #revoked         "Revoked"                   "The request has been cancelled or withdrawn."
* #error           "Error"                     "Processing failed or an unrecoverable error occurred."


// ──────────────────────────────────────────────────────────────────────────────
// ValueSet: eForms Business Status
// ──────────────────────────────────────────────────────────────────────────────
ValueSet: EFormsBusinessStatusVS
Id: business-status
Title: "eForms Business Status ValueSet"
Description: """
Permitted values for the `businessStatus` extension on eForms ServiceRequest
and Task resources.
"""
* ^url = $EFormsBusinessStatusVS
* ^status = #active

// eForms codes
* include codes from system $EFormsBusinessStatusCS