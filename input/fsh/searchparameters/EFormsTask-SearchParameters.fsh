// SearchParameter for EFormsTask businessStatus
Instance: task-business-status
InstanceOf: SearchParameter
Usage: #definition
* url = "http://ontario.ca/fhir/eforms/SearchParameter/task-business-status"
* version = "0.1.0"
* name = "TaskBusinessStatus"
* status = #active
* experimental = false
* date = "2025-07-16"
* publisher = "Ontario Health"
* description = "Search for tasks by business status"
* code = #business-status
* base = #Task
* type = #token
* expression = "Task.businessStatus"
* xpathUsage = #normal

// SearchParameter for task workflow step
Instance: task-workflow-step
InstanceOf: SearchParameter
Usage: #definition
* url = "http://ontario.ca/fhir/eforms/SearchParameter/task-workflow-step"
* version = "0.1.0"
* name = "TaskWorkflowStep"
* status = #active
* experimental = false
* date = "2025-07-16"
* publisher = "Ontario Health"
* description = "Search for tasks by workflow step"
* code = #workflow-step
* base = #Task
* type = #token
* expression = "Task.code.coding.code"
* xpathUsage = #normal

// SearchParameter for task form reference
Instance: task-form-reference
InstanceOf: SearchParameter
Usage: #definition
* url = "http://ontario.ca/fhir/eforms/SearchParameter/task-form-reference"
* version = "0.1.0"
* name = "TaskFormReference"
* status = #active
* experimental = false
* date = "2025-07-16"
* publisher = "Ontario Health"
* description = "Search for tasks by referenced form (questionnaire)"
* code = #form-reference
* base = #Task
* type = #reference
* expression = "Task.input.where(type.coding.code = 'questionnaire').value"
* target[0] = #Questionnaire
* xpathUsage = #normal