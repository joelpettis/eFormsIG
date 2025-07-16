## Search Parameters

### Standard FHIR Search Parameters

This profile supports all standard QuestionnaireResponse search parameters:

| Name | Type | Description |
|------|------|-------------|
| `authored` | date | When the questionnaire response was authored |
| `author` | reference | The author of the questionnaire response |
| `based-on` | reference | Plan/proposal/order fulfilled by this questionnaire response |
| `encounter` | reference | Encounter associated with the questionnaire response |
| `identifier` | token | The unique identifier for the questionnaire response |
| `part-of` | reference | Procedure or observation this questionnaire response was performed as part of |
| `patient` | reference | The patient that is the subject of the questionnaire response |
| `questionnaire` | reference | The questionnaire the responses are provided for |
| `source` | reference | The individual providing the information reflected in the questionnaire response |
| `status` | token | The status of the questionnaire response |
| `subject` | reference | The subject of the questionnaire response |

### Usage Examples

```
GET [base]/QuestionnaireResponse?questionnaire=Questionnaire/patient-intake
GET [base]/QuestionnaireResponse?subject=Patient/123
GET [base]/QuestionnaireResponse?status=completed
GET [base]/QuestionnaireResponse?authored=2025-07-16
GET [base]/QuestionnaireResponse?author=Practitioner/456
```

## Implementation Notes

### Form Completion Workflow
- **questionnaire**: Must reference the specific Questionnaire version used
- **subject**: Typically references a Patient resource
- **authored**: Should be set when the response is first created
- **source**: The person who provided the answers (may differ from author)

### Status Progression
QuestionnaireResponse status should follow this typical flow:
- `in-progress` → `completed` (successful completion)
- `in-progress` → `stopped` (abandoned before completion)

### Integration Points
- May be referenced as Task.output when the form completion task is done
- Should reference the originating ServiceRequest via basedOn when applicable

## Implementation Notes

### Form Submission Workflow
- QuestionnaireResponse instances should reference the specific questionnaire version used
- All responses must include a subject (typically a Patient)
- Status should progress from `in-progress` to `completed` or `stopped`
- Consider using `based-on` to link to the originating ServiceRequest