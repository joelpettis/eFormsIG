## Search Parameters

### Standard FHIR Search Parameters

This profile supports all standard Patient search parameters:

| Name | Type | Description |
|------|------|-------------|
| `active` | token | Whether this patient record is in active use |
| `address` | string | A server defined search that may match any of the string fields in the Address |
| `address-city` | string | A city specified in an address |
| `address-country` | string | A country specified in an address |
| `address-postalcode` | string | A postal code specified in an address |
| `address-state` | string | A state specified in an address |
| `address-use` | token | A use code specified in an address |
| `birthdate` | date | The patient's date of birth |
| `death-date` | date | The date of death has been provided and satisfies this search value |
| `deceased` | token | This patient has been marked as deceased, or has a death date entered |
| `email` | token | A value in an email contact |
| `family` | string | A portion of the family name of the patient |
| `gender` | token | Gender of the patient |
| `general-practitioner` | reference | Patient's nominated general practitioner |
| `given` | string | A portion of the given name of the patient |
| `identifier` | token | A patient identifier |
| `language` | token | Language code (irrespective of use value) |
| `link` | reference | All patients linked to the given patient |
| `name` | string | A server defined search that may match any of the string fields in the HumanName |
| `organization` | reference | The organization that is the custodian of the patient record |
| `phone` | token | A value in a phone contact |
| `phonetic` | string | A portion of either family or given name using some kind of phonetic matching algorithm |
| `telecom` | token | The value in any kind of telecom details of the patient |

### Usage Examples

```
GET [base]/Patient?identifier=12345
GET [base]/Patient?family=Smith&given=John
GET [base]/Patient?birthdate=1990-01-01
GET [base]/Patient?gender=male
GET [base]/Patient?active=true
GET [base]/Patient?address-postalcode=M5V3A8
GET [base]/Patient?email=john.smith@example.com
```

## Implementation Notes

### eForms Patient Context
- Serves as the subject for most eForms workflows
- Referenced by ServiceRequest, Task, and QuestionnaireResponse resources
- Should include sufficient identifiers for healthcare system integration

### Required Elements
- At least one identifier should be provided for system integration
- Name and basic demographics support workflow routing
- Consider privacy requirements when storing patient information

### Integration Points
- May be linked to Organization via managingOrganization
- Contact information enables form delivery notifications

## Implementation Notes

### eForms Patient Context
- Patient resources serve as the subject for most eForms workflows
- Should include sufficient identifiers for healthcare system integration
- Consider privacy requirements when storing patient information
- May be referenced by ServiceRequest, Task, and QuestionnaireResponse resources