## Search Parameters

### Standard FHIR Search Parameters

This profile supports all standard ServiceRequest search parameters:

| Name | Type | Description |
|------|------|-------------|
| `authored` | date | Date request signed |
| `based-on` | reference | What request fulfills |
| `body-site` | token | Where procedure is going to be done |
| `category` | token | Classification of service |
| `code` | token | What is being requested/ordered |
| `encounter` | reference | An encounter in which this request is made |
| `identifier` | token | Identifiers assigned to this order |
| `instantiates-canonical` | reference | Instantiates FHIR protocol or definition |
| `instantiates-uri` | uri | Instantiates external protocol or definition |
| `intent` | token | proposal | plan | directive | order | original-order | reflex-order | filler-order | instance-order | option |
| `occurrence` | date | When service should occur |
| `patient` | reference | Search by subject - a patient |
| `performer` | reference | Requested performer |
| `performer-type` | token | Performer role |
| `priority` | token | Indicates how quickly the ServiceRequest should be addressed |
| `replaces` | reference | What request replaces |
| `requester` | reference | Who/what is requesting service |
| `requisition` | token | Composite Request ID |
| `specimen` | reference | Specimen to be tested |
| `status` | token | draft | active | on-hold | revoked | completed | entered-in-error | unknown |
| `subject` | reference | Search by subject |

### Usage Examples

```
GET [base]/ServiceRequest?status=active
GET [base]/ServiceRequest?subject=Patient/123
GET [base]/ServiceRequest?code=questionnaire
GET [base]/ServiceRequest?category=form-request
GET [base]/ServiceRequest?requester=Practitioner/456
GET [base]/ServiceRequest?priority=routine
```

## Implementation Notes

### Form Request Initiation
- **code**: Should specify the type of form being requested
- **subject**: Identifies who should complete the form (typically Patient)
- **requester**: The practitioner or system requesting the form
- **category**: Use appropriate category codes for form requests

### Workflow Integration
- ServiceRequest creates the overall request for form completion
- Task resources should reference this via Task.basedOn
- Status progression: `draft` → `active` → `completed`

### Scheduling and Priority
- Use `occurrenceDateTime` or `occurrencePeriod` to specify when form should be completed
- Set appropriate `priority` based on clinical urgency

## Implementation Notes

### Form Request Workflow
- ServiceRequest represents the overall request for a form to be completed
- Should include appropriate `code` values for the type of form requested
- Use `subject` to specify who should complete the form
- Link to Task resources via Task.basedOn reference
- Status should progress through: `draft` → `active` → `completed`