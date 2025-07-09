//**********************************************************************************/
// DocumentReference profile
//**********************************************************************************/
Profile:   EFormsDocumentReference
Parent:    DocumentReference 
Id: EFormDocumentReference
Title:     "Document Reference Profile"
Description: """
DocumentReference Profile for OH eForms, based on the R4 version.
Stores metadata about an attachment that was uploaded to the OTN file service.  
This is a valueReference in an item in the QuestionnaireResponse. 
"""
* ^version = "1.0.0"
* ^status  = #active