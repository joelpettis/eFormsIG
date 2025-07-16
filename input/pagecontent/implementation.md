# Implementation

## Overview

The Ontario Health eForms Implementation Guide defines FHIR profiles, extensions, and workflows for managing electronic forms in Ontario's healthcare system. This IG is based on the HL7 FHIR Structured Data Capture (SDC) specification.

## Architecture

### Workflow Model
The eForms system uses a task-based workflow pattern:

1. **ServiceRequest** - Represents the overall form request
2. **Task** - Manages individual workflow steps and tracks progress
3. **Questionnaire** - Defines the form structure and questions
4. **QuestionnaireResponse** - Captures completed form data

### Modular Forms
The IG implements SDC's modular forms capability:
- **Root Questionnaires** - Parent forms that can include child questionnaires
- **Child Questionnaires** - Reusable form components
- **Assembly Expectation** - All forms use `independent` assembly pattern

## Core Profiles

### Questionnaire Profiles
- [EFormQuestionnaire](StructureDefinition-EFormQuestionnaire.html) - Base profile for all eForms questionnaires
  - Requires `assemble-expectation` extension
  - Supports modular forms via `sdc-questionnaire-subQuestionnaire`

### Workflow Profiles
- [EFormsTaskProfile](StructureDefinition-EFormsTaskProfile.html) - Task management for form workflows
- [EFormsServiceRequest](StructureDefinition-EFormsServiceRequest.html) - Form request management

### Response Profile
- [EFormQuestionnaireResponse](StructureDefinition-EFormQuestionnaireResponse.html) - Captures completed form data

## Key Extensions

- [businessStatus](StructureDefinition-businessStatus.html) - Tracks workflow state beyond FHIR status
- [business-status ValueSet](ValueSet-business-status.html) - Allowed business status values

## Implementation Steps

### 1. Set Up FHIR Server
Ensure your FHIR R4 server supports:
- Questionnaire and QuestionnaireResponse resources
- Task and ServiceRequest resources
- SDC operations (if using adaptive forms)

### 2. Install IG Package
```bash
# Download and install the IG package
npm install fhir.ca.on.eforms
```

### 3. Create Forms
Use the [EFormQuestionnaire](StructureDefinition-EFormQuestionnaire.html) profile:
- Set `assemble-expectation` to `independent-root-or-child` for root forms
- Set `assemble-expectation` to `independent-child` for child forms
- Use `sdc-questionnaire-subQuestionnaire` to reference child forms

### 4. Implement Workflow
Use the task-based workflow pattern:
1. Create ServiceRequest for form request
2. Create Task(s) to manage workflow steps
3. Update Task status and business status as workflow progresses

## Validation

All resources must validate against their respective profiles. Use the FHIR validator with this IG package:

```bash
java -jar validator.jar -ig fhir.ca.on.eforms [resource-file]
```

## Dependencies

This IG depends on:
- **HL7 FHIR R4** (4.0.1)
- **SDC Implementation Guide** (3.0.0)

## Conformance

Systems claiming conformance to this IG must:
1. Support the core profiles defined in this IG
2. Implement the task-based workflow pattern
3. Support modular forms using SDC patterns
4. Validate all resources against the defined profiles