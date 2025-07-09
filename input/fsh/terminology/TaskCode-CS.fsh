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