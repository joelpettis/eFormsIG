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