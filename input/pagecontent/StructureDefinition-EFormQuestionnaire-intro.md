## Search Parameters

### eForms Custom Search Parameters

This profile defines the following custom search parameters:

| Name | Type | Description | Resource Link |
|------|------|-------------|---------------|
| `assemble-expectation` | token | Search by assembly expectation | [SearchParameter](SearchParameter-questionnaire-assemble-expectation.html) |
| `workflow-context` | string | Search by workflow context | [SearchParameter](SearchParameter-questionnaire-workflow-context.html) |

### Standard FHIR Search Parameters

This profile also supports all standard Questionnaire search parameters:

| Name | Type | Description |
|------|------|-------------|
| `code` | token | A code that corresponds to one of its items in the questionnaire |
| `context` | token | A use context assigned to the questionnaire |
| `context-quantity` | quantity | A quantity- or range-valued use context assigned to the questionnaire |
| `context-type` | token | A type of use context assigned to the questionnaire |
| `context-type-quantity` | composite | A use context type and quantity- or range-based value assigned to the questionnaire |
| `context-type-value` | composite | A use context type and value assigned to the questionnaire |
| `date` | date | The questionnaire publication date |
| `description` | string | The description of the questionnaire |
| `effective` | date | The time during which the questionnaire is intended to be in use |
| `identifier` | token | External identifier for the questionnaire |
| `jurisdiction` | token | Intended jurisdiction for the questionnaire |
| `name` | string | Computationally friendly name of the questionnaire |
| `publisher` | string | Name of the publisher of the questionnaire |
| `status` | token | The current status of the questionnaire |
| `subject-type` | token | Resource that can be subject of QuestionnaireResponse |
| `title` | string | The human-friendly name of the questionnaire |
| `url` | uri | The uri that identifies the questionnaire |
| `version` | token | The business version of the questionnaire |

### Usage Examples

```
# Custom search parameters
GET [base]/Questionnaire?assemble-expectation=independent-root-or-child
GET [base]/Questionnaire?workflow-context=patient-intake

# Standard search parameters
GET [base]/Questionnaire?status=active
GET [base]/Questionnaire?subject-type=Patient
GET [base]/Questionnaire?publisher=Ontario Health
GET [base]/Questionnaire?date=2025-07-16
```

## Implementation Notes

### Modular Forms Pattern
This profile supports the SDC modular forms pattern using:
- `assemble-expectation` extension to control assembly behavior
- `sdc-questionnaire-subQuestionnaire` extension to reference child questionnaires

### Assembly Expectations
- **Root questionnaires**: Use `independent-root-or-child`
- **Child questionnaires**: Use `independent-child`

### Workflow Integration
- Should be referenced by Task resources for workflow management
- May be embedded in ServiceRequest.code for form type identification