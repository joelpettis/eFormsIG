## Search Parameters

### Standard FHIR Search Parameters

This profile supports all standard DocumentReference search parameters:

| Name | Type | Description |
|------|------|-------------|
| `authenticator` | reference | Who/what authenticated the document |
| `author` | reference | Who and/or what authored the document |
| `category` | token | Categorization of document |
| `contenttype` | token | Mime type of the content, with charset etc. |
| `custodian` | reference | Organization which maintains the document |
| `date` | date | When this document reference was created |
| `description` | string | Human-readable description |
| `encounter` | reference | Context of the document content |
| `event` | token | Main clinical acts documented |
| `facility` | token | Kind of facility where patient was seen |
| `format` | token | Format/content rules for the document |
| `identifier` | token | Master Version Specific Identifier |
| `language` | token | Human language of the content (BCP-47) |
| `location` | uri | Uri where the data can be found |
| `patient` | reference | Who/what is the subject of the document |
| `period` | date | Time of service that is being documented |
| `related` | reference | Related identifiers or resources |
| `relatesto` | reference | Target of the relationship |
| `relation` | token | replaces | transforms | signs | appends |
| `security-label` | token | Document security-tags |
| `setting` | token | Additional details about where the content was created |
| `status` | token | current | superseded | entered-in-error |
| `subject` | reference | Who/what is the subject of the document |
| `type` | token | Kind of document (LOINC if possible) |

### Usage Examples

```
GET [base]/DocumentReference?subject=Patient/123
GET [base]/DocumentReference?type=questionnaire-response
GET [base]/DocumentReference?status=current
GET [base]/DocumentReference?category=form
GET [base]/DocumentReference?date=2025-07-16
GET [base]/DocumentReference?author=Practitioner/456
```

## Implementation Notes

### eForms DocumentReference Context
- May represent completed forms as documents
- Can store form attachments or supporting documentation
- Should reference the patient as subject

### Content Management
- Use appropriate type and category codes for eForms content
- Consider security labels for sensitive form data
- Link to source QuestionnaireResponse when applicable