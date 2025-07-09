//**********************************************************************************/
// QuestionnaireResponse profile
//**********************************************************************************/
Profile:   EFormsQuestionnaireResponse
Parent:    $SDCQuestionnaireResponseCanonical   // sdc-task
Id: EFormQuestionnaireResponse
Title:     "Questionnaire Response Profile"
Description: """
QuestionnaireResponse Profile for OH eForms which extends sdc-QuestionnaireResponse.

	
This Resource represents a completed (or partially completed) eForm, 
containing the patient's or practitioner's answers 
to the questions from the Questionnaire.
"""
* ^version = "1.0.0"
* ^status  = #active