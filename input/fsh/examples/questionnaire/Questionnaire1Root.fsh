// Demonstrates a root questionnaire that pulls in child forms

Instance: Questionnaire1-Root
InstanceOf: EFormsQuestionnaire
Usage: #example
* url = "http://ontario.ca/fhir/eforms/Questionnaire/Questionnaire1-Root"
* name = "Questionnaire1-Root"
* title = "Questionnaire 1 Root"
* status = #active

// All root questionnaires must be independent-root-or-child
* extension[assemble-expectation].valueCode = #independent-root-or-child

// Display items that will be replaced by child questionnaires
* item[0].linkId = "section-patient-info"
* item[0].text = "Patient Information"
* item[0].type = #display
* item[0].extension[$QuestionnaireSubExtCanonical].valueCanonical = "http://ontario.ca/fhir/eforms/Questionnaire/ChildPatientInfo"

* item[1].linkId = "section-consent"
* item[1].text = "Consent"
* item[1].type = #display
* item[1].extension[$QuestionnaireSubExtCanonical].valueCanonical = "http://ontario.ca/fhir/eforms/Questionnaire/ChildConsent"