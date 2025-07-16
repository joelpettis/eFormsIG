# Downloads

This page provides downloadable resources for the Ontario Health eForms Implementation Guide.

## Individual Resources

### Questionnaires
- [Questionnaire1-Root.json](Questionnaire-Questionnaire1-Root.json) - Root questionnaire example
- [ChildPatientInfo.json](Questionnaire-ChildPatientInfo.json) - Patient information questionnaire
- [ChildConsent.json](Questionnaire-ChildConsent.json) - Consent questionnaire
- [Questionnaire1-Child.json](Questionnaire-Questionnaire1-Child.json) - Child questionnaire example

### Profiles
- [EFormQuestionnaire.json](StructureDefinition-EFormQuestionnaire.json) - Questionnaire profile
- [EFormQuestionnaireResponse.json](StructureDefinition-EFormQuestionnaireResponse.json) - QuestionnaireResponse profile
- [EFormsTaskProfile.json](StructureDefinition-EFormsTaskProfile.json) - Task profile
- [EFormsServiceRequest.json](StructureDefinition-EFormsServiceRequest.json) - ServiceRequest profile

### Value Sets and Code Systems
- [business-status ValueSet](ValueSet-business-status.json)
- [task-code ValueSet](ValueSet-task-code.json)
- [business-status CodeSystem](CodeSystem-business-status.json)
- [task-code CodeSystem](CodeSystem-task-code.json)

## Collections

### Complete IG Package
- **[Package](package.tgz)** - Complete FHIR package with all resources

### Bundles
- **[Examples Bundle](examples-bundle.json)** - All example resources in a single bundle
- **[Profiles Bundle](profiles-bundle.json)** - All profiles and extensions in a single bundle

## API Testing

### Postman Collection
- **[EForms Postman Collection](eforms-postman-collection.json)** - Ready-to-use Postman collection with:
  - FHIR server endpoints for all resources
  - Example requests for CRUD operations
  - Validation examples
  - Workflow scenarios

### FHIR Implementation Guide JSON
- **[ImplementationGuide](ImplementationGuide-fhir.ca.on.eforms.json)** - Complete IG definition

## Source Code
- **[FSH Source Files](https://github.com/joelpettis/eFormsIG)** - GitHub repository with all FSH source files

## Validation
- **[Validation Results](qa.html)** - Current validation report
- **[QA Report](qa.txt)** - Text format validation summary

---

**Note**: JSON files are formatted and validated against FHIR R4.0.1. All resources conform to their respective profiles defined in this Implementation Guide.