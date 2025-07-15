// Child questionnaire for consent information
Instance: ChildConsent
InstanceOf: EFormsQuestionnaire
Usage: #example

* url = "http://ontario.ca/fhir/eforms/Questionnaire/ChildConsent"
* name = "ChildConsent"
* title = "Child Questionnaire - Consent"
* status = #active
* description = """
Child questionnaire for collecting consent information
"""

// child questionnaires must be independent child
* extension[assemble-expectation].valueCode = #independent-child

// Consent items
* item[0].linkId = "consent-treatment"
* item[0].text = "Do you consent to treatment?"
* item[0].type = #boolean

* item[1].linkId = "consent-information-sharing"
* item[1].text = "Do you consent to information sharing?"
* item[1].type = #boolean

* item[2].linkId = "consent-signature"
* item[2].text = "Patient/Guardian Signature"
* item[2].type = #string