## Search Parameters

### Standard FHIR Search Parameters

This profile supports all standard Organization search parameters:

| Name | Type | Description |
|------|------|-------------|
| `active` | token | Is the Organization record active |
| `address` | string | A server defined search that may match any of the string fields in the Address |
| `address-city` | string | A city specified in an address |
| `address-country` | string | A country specified in an address |
| `address-postalcode` | string | A postal code specified in an address |
| `address-state` | string | A state specified in an address |
| `address-use` | token | A use code specified in an address |
| `endpoint` | reference | Technical endpoints providing access to services operated for the organization |
| `identifier` | token | Any identifier for the organization |
| `name` | string | A portion of the organization's name or alias |
| `partof` | reference | An organization of which this organization forms a part |
| `phonetic` | string | A portion of the organization's name using some kind of phonetic matching algorithm |
| `type` | token | A code for the type of organization |

### Usage Examples

```
GET [base]/Organization?identifier=12345
GET [base]/Organization?name=Ontario Health
GET [base]/Organization?type=govt
GET [base]/Organization?active=true
GET [base]/Organization?address-city=Toronto
GET [base]/Organization?partof=Organization/ministry-health
```

## Implementation Notes

### eForms Organization Context
- Represents healthcare facilities, departments, or administrative entities
- May be referenced as the managing organization for patients
- Can be the requester or performer in ServiceRequest workflows

### Integration Requirements
- Should include appropriate identifiers for system integration
- Use `type` to classify different kinds of organizations (hospital, clinic, government)
- Consider hierarchical relationships using `partOf`

## Implementation Notes

### eForms Organization Context
- Organizations represent healthcare facilities, departments, or administrative entities
- May be referenced as the managing organization for patients
- Can be the requester or performer in ServiceRequest workflows
- Should include appropriate identifiers for system integration
- Use `type` to classify different kinds of organizations (hospital, clinic, government, etc.)