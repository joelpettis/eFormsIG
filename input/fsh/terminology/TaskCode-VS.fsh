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