//**********************************************************************************/
// Plan Definition profile
//**********************************************************************************/
Profile:   EFormsPlanDefinition
Parent:    PlanDefinition
Id: EFormPlanDefinition
Title:     "Plan Definition Profile"
Description: """
Plan Definition Profile for OH eForms, based on the R4 version.

The Plan Definition represents the Form and Workflow Template. 
It defines a multi-step process in a shareable and executable way
that represents a standard definition for the workflow and composite forms, 
if applicable.  It acts as a manifest, listing all the modular components such as
(Questionnaires, Tasks and Organizaiton  
"""
* ^version = "1.0.0"
* ^status  = #active