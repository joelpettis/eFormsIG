// Child questionnaire for patient information
Instance: ChildPatientInfo
InstanceOf: EFormsQuestionnaire
Usage: #example

* url = "http://ontario.ca/fhir/eforms/Questionnaire/ChildPatientInfo"
* name = "ChildPatientInfo"
* title = "Child Questionnaire - Patient Information"
* status = #active
* description = """
Child questionnaire for collecting patient information
"""

// child questionnaires must be independent child
* extension[assemble-expectation].valueCode = #independent-child

// Patient information items
* item[0].linkId = "patient-full-name"
* item[0].text = "Patient Full Name"
* item[0].type = #string

* item[1].linkId = "patient-date-of-birth"
* item[1].text = "Date of Birth"
* item[1].type = #date

* item[2].linkId = "patient-health-card"
* item[2].text = "Health Card Number"
* item[2].type = #string