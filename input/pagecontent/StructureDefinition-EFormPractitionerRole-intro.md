## Search Parameters

### Standard FHIR Search Parameters

This profile supports all standard PractitionerRole search parameters:

| Name | Type | Description |
|------|------|-------------|
| `active` | token | Whether this practitioner role record is in active use |
| `date` | date | The period during which the practitioner is authorized to perform in these role(s) |
| `email` | token | A value in an email contact |
| `endpoint` | reference | Technical endpoints providing access to services operated for the practitioner |
| `identifier` | token | A practitioner's Identifier |
| `location` | reference | One of the locations at which this practitioner provides care |
| `organization` | reference | The identity of the organization the practitioner represents / acts on behalf of |
| `phone` | token | A value in a phone contact |
| `practitioner` | reference | Practitioner that is able to provide the defined services for the organization |
| `role` | token | The practitioner can perform this role at for the organization |
| `service` | reference | The list of healthcare services that this worker provides for this role's Organization/Location(s) |
| `specialty` | token | The practitioner has this specialty at an organization |
| `telecom` | token | The value in any kind of telecom details of the practitioner |

### Usage Examples

```
GET [base]/PractitionerRole?practitioner=Practitioner/123
GET [base]/PractitionerRole?organization=Organization/456
GET [base]/PractitionerRole?role=physician
GET [base]/PractitionerRole?specialty=family-medicine
GET [base]/PractitionerRole?active=true
GET [base]/PractitionerRole?location=Location/emergency-dept
```

## Implementation Notes

### eForms PractitionerRole Context
- Represents practitioners in their specific roles within healthcare organizations
- May be referenced as the requester in ServiceRequest workflows
- Can be assigned as the owner of Task resources

### Required Relationships
- Should link to both Practitioner and Organization resources
- Use appropriate role and specialty codes for workflow routing
- Consider location context for form assignment

## Implementation Notes

### eForms PractitionerRole Context
- Represents practitioners in their specific roles within healthcare organizations
- May be referenced as the requester in ServiceRequest workflows
- Can be assigned as the owner of Task resources
- Should link to both Practitioner and Organization resources
- Use appropriate role and specialty codes for workflow routing