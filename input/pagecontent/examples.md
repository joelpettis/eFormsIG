# Examples

This page provides examples of how to use the Ontario Health eForms profiles and resources.

## Questionnaire Examples

### Modular Forms Pattern

The eForms IG implements a modular forms pattern using SDC sub-questionnaires:

**Root Questionnaire**
- [Questionnaire1-Root](Questionnaire-Questionnaire1-Root.html) - Demonstrates a root questionnaire that references child questionnaires

**Child Questionnaires**
- [ChildPatientInfo](Questionnaire-ChildPatientInfo.html) - Patient information collection
- [ChildConsent](Questionnaire-ChildConsent.html) - Consent information collection
- [Questionnaire1-Child](Questionnaire-Questionnaire1-Child.html) - Basic child questionnaire example

## Workflow Examples

**Task-Based Workflow**  
Coming soon - examples of how to use the EFormsTaskProfile for workflow management.

**Service Requests**  
Coming soon - examples of how to use the EFormsServiceRequest for form requests.

## Download All Examples

All examples are available in the following formats:
- **JSON**: Individual files in the [Downloads](downloads.html) section
- **Bundle**: Combined bundle of all examples
- **Postman Collection**: Ready-to-use API collection for testing

## Implementation Notes

**Assembly Expectation**  
All questionnaires use the `assemble-expectation` extension:
- Root questionnaires: `independent-root-or-child`
- Child questionnaires: `independent-child`

**Sub-Questionnaire References**  
Child questionnaires are referenced using the `sdc-questionnaire-subQuestionnaire` extension on display items in the root questionnaire.