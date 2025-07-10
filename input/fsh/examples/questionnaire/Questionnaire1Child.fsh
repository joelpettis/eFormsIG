// Demonstrates a child questionnaire referenced by the root form

Instance: Questionnaire1-Child
InstanceOf: EFormsQuestionnaire
Usage: #example
* url = "http://ontario.ca/fhir/eforms/Questionnaire/Questionnaire1-Child"
* name = "Questionnaire1-Child"
* title = "Questionnaire 1 Subform"
* status = #active

// All child questionnaires must be independent-child
* extension[assemble-expectation].valueCode = #independent-child

// Actual questions
* item[0].linkId = "patient-name"
* item[0].text = "Patient Full Name"
* item[0].type = #string

* item[1].linkId = "patient-dob"
* item[1].text = "Date of Birth"
* item[1].type = #date