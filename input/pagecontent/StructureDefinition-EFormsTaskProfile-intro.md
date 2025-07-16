## Search Parameters

### eForms Custom Search Parameters

This profile defines the following custom search parameters:

| Name | Type | Description | Resource Link |
|------|------|-------------|---------------|
| `business-status` | token | Search by business status | [SearchParameter](SearchParameter-task-business-status.html) |
| `workflow-step` | token | Search by workflow step | [SearchParameter](SearchParameter-task-workflow-step.html) |
| `form-reference` | reference | Search by referenced questionnaire | [SearchParameter](SearchParameter-task-form-reference.html) |

### Standard FHIR Search Parameters

This profile also supports all standard Task search parameters:

| Name | Type | Description |
|------|------|-------------|
| `authored-on` | date | Search by creation date |
| `based-on` | reference | Search by request fulfilled by this task |
| `business-status` | token | Search by business-status |
| `code` | token | Search by task code |
| `encounter` | reference | Search by associated encounter |
| `focus` | reference | Search by the request being actioned |
| `group-identifier` | token | Search by requisition or grouper id |
| `identifier` | token | Search by task instance identifier |
| `intent` | token | Search by task intent |
| `modified` | date | Search by last modification date |
| `owner` | reference | Search by responsible party |
| `part-of` | reference | Search by composite task |
| `patient` | reference | Search by patient |
| `performer` | token | Search by recommended type of performer |
| `period` | date | Search by execution period |
| `priority` | token | Search by task priority |
| `requester` | reference | Search by task creator |
| `status` | token | Search by task status |
| `subject` | reference | Search by task subject |

### Usage Examples

```
# Custom search parameters
GET [base]/Task?business-status=in-progress
GET [base]/Task?workflow-step=questionnaire
GET [base]/Task?form-reference=Questionnaire/patient-intake

# Standard search parameters
GET [base]/Task?status=ready
GET [base]/Task?subject=Patient/123
GET [base]/Task?requester=Practitioner/456
GET [base]/Task?based-on=ServiceRequest/789
```

## Implementation Notes

### Workflow Management
This profile manages individual steps in the eForms workflow:
- **basedOn**: References the originating ServiceRequest
- **code**: Specifies the workflow step type (from task-code ValueSet)
- **input**: May reference the Questionnaire to be completed
- **output**: May reference the completed QuestionnaireResponse

### Business Status Extension
Use the `businessStatus` extension to track workflow state beyond standard FHIR status:
- `pending` - Task created but not yet started
- `in-progress` - Task actively being worked on
- `completed` - Task successfully finished
- `failed` - Task could not be completed

### Task Chaining
Tasks may be chained using `partOf` to create complex workflows where one task triggers another.