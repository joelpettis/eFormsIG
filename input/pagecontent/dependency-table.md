# Dependencies

This page details all dependencies for the Ontario Health eForms Implementation Guide.

## Core Dependencies

| Dependency | Version | Type | Description |
|------------|---------|------|-------------|
| **HL7 FHIR R4** | 4.0.1 | Core Specification | Base FHIR specification |
| **SDC Implementation Guide** | 3.0.0 | Implementation Guide | Structured Data Capture patterns |

## FHIR Core Resources Used

### Primary Resources
| Resource | Usage | Profile |
|----------|-------|---------|
| **Questionnaire** | Form definitions | EFormQuestionnaire |
| **QuestionnaireResponse** | Form responses | EFormQuestionnaireResponse |
| **Task** | Workflow management | EFormsTaskProfile |
| **ServiceRequest** | Form requests | EFormsServiceRequest |

### Supporting Resources
| Resource | Usage | Profile |
|----------|-------|---------|
| **Patient** | Form subjects | EFormPatient |
| **Organization** | Healthcare orgs | EFormOrganization |
| **PractitionerRole** | Form assignees | EFormPractitionerRole |
| **Provenance** | Audit trail | EFormProvenance |
| **Communication** | Notifications | EFormCommunication |
| **Subscription** | Event handling | EFormSubscription |
| **PlanDefinition** | Workflow templates | EFormPlanDefinition |
| **DocumentReference** | Attachments | EFormDocumentReference |

## SDC Dependencies

### Required SDC Profiles
| SDC Profile | Version | Usage in eForms |
|-------------|---------|-----------------|
| **sdc-questionnaire** | 3.0.0 | Parent for EFormQuestionnaire |
| **sdc-questionnaireresponse** | 3.0.0 | Parent for EFormQuestionnaireResponse |
| **sdc-task** | 3.0.0 | Parent for EFormsTaskProfile |
| **sdc-servicerequest** | 3.0.0 | Parent for EFormsServiceRequest |

### Required SDC Extensions
| Extension | Version | Usage |
|-----------|---------|-------|
| **sdc-questionnaire-subQuestionnaire** | 3.0.0 | Modular forms |
| **assemble-expectation** | 3.0.0 | Assembly behavior |

### Required SDC CodeSystems
| CodeSystem | Version | Usage |
|------------|---------|-------|
| **sdc/CodeSystem/temp** | 3.0.0 | Task and ServiceRequest codes |

## Version Constraints

### Minimum Versions
- **FHIR Core**: 4.0.1 (required)
- **SDC**: 3.0.0 (required)

### Maximum Versions
- **FHIR Core**: < 5.0.0 (R4 only)
- **SDC**: < 4.0.0 (compatibility tested through 3.x)

## Optional Dependencies

### Development Tools
| Tool | Version | Purpose |
|------|---------|---------|
| **SUSHI** | 3.16.3+ | FSH compilation |
| **IG Publisher** | 2.0.9+ | IG generation |
| **FHIR Validator** | Latest | Resource validation |

### Runtime Dependencies
| Dependency | Version | Required | Purpose |
|------------|---------|----------|---------|
| **FHIR Server** | R4 Compatible | Yes | Resource storage/retrieval |
| **Terminology Server** | R4 Compatible | Optional | Code validation |
| **SDC Operations** | 3.0.0+ | Optional | Adaptive forms |

## Terminology Dependencies

### External Code Systems
| Code System | Usage | Notes |
|-------------|-------|-------|
| **SNOMED CT** | Clinical concepts | Optional, as needed |
| **LOINC** | Observations | Optional, as needed |
| **ISO 3166** | Jurisdictions | Used for Ontario |

### Internal Code Systems
| Code System | Purpose | Dependency |
|-------------|---------|------------|
| **business-status** | Workflow status | None (local) |
| **task-code** | Task types | None (local) |

## Dependency Graph

```
eForms IG (0.1.0)
├── FHIR R4.0.1 (required)
├── SDC 3.0.0 (required)
│   ├── sdc-questionnaire
│   ├── sdc-questionnaireresponse  
│   ├── sdc-task
│   ├── sdc-servicerequest
│   └── SDC Extensions
│       ├── sdc-questionnaire-subQuestionnaire
│       └── assemble-expectation
└── Local Resources
    ├── Custom Profiles (12)
    ├── Custom Extensions (1)
    ├── Custom ValueSets (2)
    └── Custom CodeSystems (2)
```

## Installation Requirements

### Package Manager
```bash
# Core dependencies (automatic with IG package)
npm install fhir.ca.on.eforms

# Development dependencies
npm install -g fsh-sushi
```

### FHIR Server Requirements
- **FHIR Version**: R4.0.1 or higher
- **Required Resources**: Questionnaire, QuestionnaireResponse, Task, ServiceRequest
- **Optional Features**: SDC operations, terminology services

## Compatibility Testing

### Tested Combinations
| FHIR | SDC | Status |
|------|-----|--------|
| 4.0.1 | 3.0.0 | ✅ Fully tested |
| 4.0.0 | 3.0.0 | ⚠️ Should work |
| 4.0.1 | 4.0.0-ballot | ❌ Not compatible |

### Known Issues
- **SDC 4.0.0-ballot**: Some extensions not backward compatible
- **FHIR R5**: Forward compatibility not yet tested

---

*Updated: July 2025*