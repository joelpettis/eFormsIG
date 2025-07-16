# Changes

## Version 0.1.0 (Current)

**Date**: July 2025  
**Status**: Draft / CI Build

### Added
**Profiles**
- EFormQuestionnaire - Base questionnaire profile with SDC support
- EFormQuestionnaireResponse - Response capture profile  
- EFormsTaskProfile - Task-based workflow management
- EFormsServiceRequest - Form request management
- EFormPatient - Patient profile for eForms
- EFormOrganization - Organization profile
- EFormPractitionerRole - Practitioner role profile

**Extensions**
- businessStatus - Custom workflow status tracking

**Value Sets**
- business-status - Business status codes for workflow tracking
- task-code - Task type codes for eForms workflows

**Code Systems**
- business-status - Local codes for business status
- task-code - Local codes for task types

**Operations**
- InstantiateFormWorkflow - Create new form workflow
- TransitionWorkflow - Transition workflow status

**Examples**
- Questionnaire1-Root - Root questionnaire with sub-questionnaire references
- ChildPatientInfo - Patient information child questionnaire
- ChildConsent - Consent child questionnaire  
- Questionnaire1-Child - Basic child questionnaire example

### Dependencies
- HL7 FHIR R4.0.1 - Base FHIR specification
- SDC 3.0.0 - Structured Data Capture implementation guide

### Known Issues
- Some profiles lack examples (will be added in future versions)
- Postman collection in development

## Future Versions

### Version 0.2.0 (Planned)
- Additional examples for all profiles
- Postman collection for API testing
- Implementation guidance documentation
- Additional workflow patterns

### Version 1.0.0 (Planned)
- Production-ready release
- Complete example set
- Full workflow implementation examples
- Performance testing results

## Migration Notes

### From SDC 4.0.0-ballot to SDC 3.0.0
This IG was originally developed using SDC 4.0.0-ballot but migrated to SDC 3.0.0 for stability:
- Removed `versionAlgorithm` extension (not available in 3.0.0)
- Removed `copyrightLabel` extension (not available in 3.0.0)  
- Removed `hidden` and `answerConstraint` item extensions (not available in 3.0.0)
- Maintained core modular forms functionality
- Preserved task-based workflow patterns