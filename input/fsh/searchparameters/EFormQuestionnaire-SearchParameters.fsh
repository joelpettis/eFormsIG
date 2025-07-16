// SearchParameter for EFormQuestionnaire workflow context
Instance: questionnaire-workflow-context
InstanceOf: SearchParameter
Usage: #definition
* url = "http://ontario.ca/fhir/eforms/SearchParameter/questionnaire-workflow-context"
* version = "0.1.0"
* name = "QuestionnaireWorkflowContext"
* status = #active
* experimental = false
* date = "2025-07-16"
* publisher = "Ontario Health"
* description = "Search for questionnaires by workflow context"
* code = #workflow-context
* base = #Questionnaire
* type = #string
* expression = "Questionnaire.useContext.value.coding.code"
* xpathUsage = #normal

// SearchParameter for assembly expectation
Instance: questionnaire-assemble-expectation
InstanceOf: SearchParameter
Usage: #definition
* url = "http://ontario.ca/fhir/eforms/SearchParameter/questionnaire-assemble-expectation"
* version = "0.1.0"
* name = "QuestionnaireAssembleExpectation"
* status = #active
* experimental = false
* date = "2025-07-16"
* publisher = "Ontario Health"
* description = "Search for questionnaires by assembly expectation"
* code = #assemble-expectation
* base = #Questionnaire
* type = #token
* expression = "Questionnaire.extension.where(url='http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assembleExpectation').value"
* xpathUsage = #normal