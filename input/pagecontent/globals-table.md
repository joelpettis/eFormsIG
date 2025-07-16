# Globals

This page provides an overview of global configurations, profiles, and patterns used throughout the Ontario Health eForms Implementation Guide.

## Global Profile Assignments

The following table shows which profiles are applied globally to specific FHIR resource types:

| Resource Type | Global Profile | Must Support | Description |
|---------------|---------------|--------------|-------------|
| **Questionnaire** | EFormQuestionnaire | Yes | All questionnaires must use eForms profile |
| **QuestionnaireResponse** | EFormQuestionnaireResponse | Yes | All responses must use eForms profile |
| **Task** | EFormsTaskProfile | Yes | All workflow tasks must use eForms profile |
| **ServiceRequest** | EFormsServiceRequest | Yes | All form requests must use eForms profile |

## Global Extensions

### Required Extensions
| Extension | Scope | Usage | Cardinality |
|-----------|-------|-------|-------------|
| **assemble-expectation** | Questionnaire | Assembly behavior | 1..1 |
| **businessStatus** | Task | Workflow tracking | 0..1 |

### Optional Extensions  
| Extension | Scope | Usage | Cardinality |
|-----------|-------|-------|-------------|
| **sdc-questionnaire-subQuestionnaire** | Questionnaire.item | Modular forms | 0..1 |

## Global Patterns

### Naming Conventions
| Element | Pattern | Example |
|---------|---------|---------|
| **Profile Names** | EForm[ResourceType] | EFormQuestionnaire |
| **Instance Names** | [Purpose][Type] | ChildPatientInfo |
| **Extension Names** | [name]-Ext | businessStatus-Ext |
| **ValueSet Names** | [name]-VS | business-status-VS |
| **CodeSystem Names** | [name]-CS | business-status-CS |

### URL Patterns
| Resource Type | URL Pattern | Example |
|---------------|-------------|---------|
| **Profiles** | http://ontario.ca/fhir/eforms/StructureDefinition/[name] | http://ontario.ca/fhir/eforms/StructureDefinition/EFormQuestionnaire |
| **Extensions** | http://ontario.ca/fhir/eforms/StructureDefinition/[name] | http://ontario.ca/fhir/eforms/StructureDefinition/businessStatus |
| **ValueSets** | http://ontario.ca/fhir/eforms/ValueSet/[name] | http://ontario.ca/fhir/eforms/ValueSet/business-status |
| **CodeSystems** | http://ontario.ca/fhir/eforms/CodeSystem/[name] | http://ontario.ca/fhir/eforms/CodeSystem/business-status |
| **Examples** | http://ontario.ca/fhir/eforms/[ResourceType]/[name] | http://ontario.ca/fhir/eforms/Questionnaire/Questionnaire1-Root |

## Global Constraints

### Questionnaire Constraints
- **Assembly Expectation**: All questionnaires MUST have `assemble-expectation` extension
- **Status**: All questionnaires MUST have status of `active` or `draft`
- **URL**: All questionnaires MUST have a unique canonical URL

### Task Constraints  
- **Business Status**: Tasks SHOULD include `businessStatus` extension
- **Code**: Tasks MUST use codes from the `task-code` ValueSet
- **Intent**: Tasks MUST have intent of `order`

### General Constraints
- **Jurisdiction**: Resources SHOULD specify jurisdiction as Ontario (`CA-ON`)
- **Language**: Resources SHOULD specify language as English (`en-CA`)

## Global Value Sets

### Workflow Status
| ValueSet | Usage | Binding |
|----------|-------|---------|
| **business-status** | Task.extension[businessStatus] | Extensible |
| **task-code** | Task.code | Required |

### Standard FHIR
| ValueSet | Usage | Binding |
|----------|-------|---------|
| **questionnaire-status** | Questionnaire.status | Required |
| **task-status** | Task.status | Required |
| **request-status** | ServiceRequest.status | Required |

## Global Code Systems

### Local Code Systems
| CodeSystem | Purpose | Concepts |
|------------|---------|----------|
| **business-status** | Workflow tracking | pending, in-progress, completed, failed |
| **task-code** | Task classification | questionnaire, complete-questionnaire |

### External Code Systems
| CodeSystem | Usage | Alias |
|------------|-------|-------|
| **ISO 3166-2** | Jurisdictions | Used for CA-ON |
| **SDC Temp** | SDC concepts | $temp |

## Global Implementation Rules

### Must Support
Elements marked as "Must Support" (MS) mean:
- **Senders**: MUST populate if data is available
- **Receivers**: MUST be able to process and store
- **Display**: MUST be able to display to users if relevant

### Cardinality Rules
- **1..1**: Required, exactly one
- **0..1**: Optional, at most one  
- **1..***: Required, one or more
- **0..***: Optional, zero or more

### Data Type Rules
- **Dates**: Use FHIR date format (YYYY-MM-DD)
- **URLs**: Must be absolute, valid URLs
- **Codes**: Must be from specified ValueSets
- **Identifiers**: Should include system and value

## Global Configuration Parameters

### IG Publisher Parameters
| Parameter | Value | Purpose |
|-----------|-------|---------|
| **excludettl** | true | Exclude Turtle format |
| **excludexml** | true | Exclude XML format |
| **pin-canonicals** | pin-multiples | Pin version references |

### Validation Parameters
| Parameter | Value | Purpose |
|-----------|-------|---------|
| **jurisdiction** | CA-ON | Ontario jurisdiction |
| **fhirVersion** | 4.0.1 | FHIR R4 version |

---

*This table reflects global patterns and constraints applied throughout the eForms Implementation Guide.*