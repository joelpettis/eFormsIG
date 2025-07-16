## Search Parameters

### Standard FHIR Search Parameters

This profile supports all standard Communication search parameters:

| Name | Type | Description |
|------|------|-------------|
| `based-on` | reference | Request fulfilled by this communication |
| `category` | token | Message category |
| `encounter` | reference | Encounter created as part of |
| `identifier` | token | Unique identifier |
| `instantiates-canonical` | reference | Instantiates FHIR protocol or definition |
| `instantiates-uri` | uri | Instantiates external protocol or definition |
| `medium` | token | A channel of communication |
| `part-of` | reference | Part of this action |
| `patient` | reference | Focus of message |
| `received` | date | When received |
| `recipient` | reference | Message recipient |
| `sender` | reference | Message sender |
| `sent` | date | When sent |
| `status` | token | preparation | in-progress | not-done | on-hold | stopped | completed | entered-in-error | unknown |
| `subject` | reference | Focus of message |

### Usage Examples

```
GET [base]/Communication?subject=Patient/123
GET [base]/Communication?status=completed
GET [base]/Communication?category=notification
GET [base]/Communication?sent=2025-07-16
GET [base]/Communication?sender=Practitioner/456
GET [base]/Communication?based-on=ServiceRequest/789
```

## Implementation Notes

### eForms Communication Context
- Used for notifications related to form workflows
- May notify patients of form assignments or completions
- Can communicate status updates to healthcare providers

### Workflow Integration
- Should reference the originating ServiceRequest or Task when applicable
- Use appropriate category codes for different notification types
- Consider delivery preferences and contact methods