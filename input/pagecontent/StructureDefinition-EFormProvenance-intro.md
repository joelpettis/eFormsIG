## Search Parameters

### Standard FHIR Search Parameters

This profile supports all standard Provenance search parameters:

| Name | Type | Description |
|------|------|-------------|
| `agent` | reference | Who participated |
| `agent-role` | token | What the agents role was |
| `agent-type` | token | How the agent participated |
| `entity` | reference | Identity of entity |
| `location` | reference | Where the activity occurred, if relevant |
| `patient` | reference | Target Reference(s) (usually version specific) |
| `recorded` | date | When the activity was recorded / updated |
| `signature-type` | token | Indication of the reason the entity signed the object(s) |
| `target` | reference | Target Reference(s) (usually version specific) |
| `when` | date | When the activity occurred |

### Usage Examples

```
GET [base]/Provenance?target=QuestionnaireResponse/123
GET [base]/Provenance?patient=Patient/456
GET [base]/Provenance?agent=Practitioner/789
GET [base]/Provenance?recorded=2025-07-16
GET [base]/Provenance?agent-role=author
```

## Implementation Notes

### eForms Provenance Context
- Tracks the lifecycle and authorship of form-related resources
- Should reference form submissions (QuestionnaireResponse) as targets
- Records who created, modified, or attested to form data

### Audit and Compliance
- Provides audit trail for regulatory compliance
- May include digital signatures for forms requiring attestation
- Use appropriate agent roles and activity codes