//**********************************************************************************
// CodeSystem: OH eForms Task Code
//**********************************************************************************
CodeSystem:  EFormsTaskCode
Id:          task-code
Title:       "OH eForms Task Code System"
Description: "Additional workflow codes used by eForms tasks."
* ^status   = #active
* ^content  = #complete
* ^experimental = false
* ^caseSensitive = false
* ^jurisdiction = urn:iso:std:iso:3166:-2#CA-ON "Ontario"

// ------ eForms specific Statuses
* #complete-section "Complete Questionnaire Response Section"
* #complete-section ^designation[+].language = #en
* #complete-section ^designation[=].value = "This type of task requires the Questionnaire to be completed"
* #amend-section    "Amend Questionnaire Response Section"
* #amend-section ^designation[+].language = #en
* #amend-section ^designation[=].value = "This type of task requires the Questionnaire to be ammended"