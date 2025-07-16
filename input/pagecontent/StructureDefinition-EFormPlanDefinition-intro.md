## Search Parameters

### Standard FHIR Search Parameters

This profile supports all standard PlanDefinition search parameters:

| Name | Type | Description |
|------|------|-------------|
| `composed-of` | reference | What resource is being referenced |
| `context` | token | A use context assigned to the plan definition |
| `context-quantity` | quantity | A quantity- or range-valued use context assigned to the plan definition |
| `context-type` | token | A type of use context assigned to the plan definition |
| `context-type-quantity` | composite | A use context type and quantity- or range-based value assigned to the plan definition |
| `context-type-value` | composite | A use context type and value assigned to the plan definition |
| `date` | date | The plan definition publication date |
| `definition` | reference | Activity or plan definitions used by plan definition |
| `depends-on` | reference | What resource is being referenced |
| `derived-from` | reference | What resource is being referenced |
| `description` | string | The description of the plan definition |
| `effective` | date | The time during which the plan definition is intended to be in use |
| `identifier` | token | External identifier for the plan definition |
| `jurisdiction` | token | Intended jurisdiction for the plan definition |
| `name` | string | Computationally friendly name of the plan definition |
| `predecessor` | reference | What resource is being referenced |
| `publisher` | string | Name of the publisher of the plan definition |
| `status` | token | The current status of the plan definition |
| `successor` | reference | What resource is being referenced |
| `title` | string | The human-friendly name of the plan definition |
| `topic` | token | Topics associated with the module |
| `type` | token | The type of artifact the plan (e.g. order-set, eca-rule, protocol) |
| `url` | uri | The uri that identifies the plan definition |
| `version` | token | The business version of the plan definition |

### Usage Examples

```
GET [base]/PlanDefinition?status=active
GET [base]/PlanDefinition?type=workflow-definition
GET [base]/PlanDefinition?context=form-workflow
GET [base]/PlanDefinition?name=patient-intake-workflow
GET [base]/PlanDefinition?publisher=Ontario Health
```

## Implementation Notes

### eForms PlanDefinition Context
- Defines reusable workflow templates for form processes
- May specify the sequence of tasks required for form completion
- Can define decision logic for conditional form routing

### Workflow Automation
- Should include appropriate action definitions for Task creation
- Use context to specify when the plan applies (e.g., specific patient populations)
- Consider triggers and conditions for automated workflow execution