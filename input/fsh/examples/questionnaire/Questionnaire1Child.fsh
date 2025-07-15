// Demonstrates a child questionnaire referenced by the root form
Instance: Questionnaire1-Child
InstanceOf: EFormsQuestionnaire
Usage: #example

* url = "http://ontario.ca/fhir/eforms/Questionnaire/Questionnaire1-Child"

// machine-readable identifiers
* name = "Questionnaire1Child"
* version = "1.0.0"
* title = "Questionnaire 1 Subform"
* status = #active
* description = """
A Questionnaire example that is a child
"""
// jurisdiction is optional – include only if needed
* jurisdiction[+] = urn:iso:std:iso:3166:-2#CA-ON "Ontario"

// child questionnaires must be independent child
* extension[assemble-expectation].valueCode = #independent-child

// versionAlgorithmString only exists in FHIR R4B+.
* extension[$versionAlgorithm].valueString = "semver" 


// actual questions
* item[0].linkId = "patient-name"
* item[0].text   = "Patient Full Name"
* item[0].type   = #string

* item[1].linkId = "patient-dob"
* item[1].text   = "Date of Birth"
* item[1].type   = #date