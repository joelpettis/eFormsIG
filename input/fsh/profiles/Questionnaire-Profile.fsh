//**********************************************************************************/
// Questionnaire profile
//**********************************************************************************/
Profile:   EFormsQuestionnaire
Parent:    $SDCQuestionnaireCanonical   // sdc-task
Id: EFormQuestionnaire
Title:     "Questionnaire Profile"
Description: """
Questionnaire Profile for OH eForms which extends sdc-questionnaire.

Requires the assemble-expectation extensions wiith the expectation that all will beindependent. 
The assemble-expectation SHALL either be `independent-root-or-child` to indicate it is a root Questionnaires, 
or `independent-child` for all child Questionnaires

One or more Questionnaires comprise the template itself, containing all the questions, 
answer options, and structure. Questionnaires may be assembled from other sub-Questionnaires 
utilizing FHIR’s Structured Data Capture’s Modular Forms.

The `sub-questionnaire` is utilized to indicate that the display item on which this 
extension appears should be replaced with the referenced Questionnaire

"""
* ^version = "1.0.0"
* ^status  = #active

// require assemble-expectation
* extension[assemble-expectation] 1..1 MS
* extension[assemble-expectation] ^short = "For eForms, all forms must be independent.  Use independent-root-or-child to indicate it is a root Questionnaires, and independent-child for all child Questionnaires"
 
// hide extensions we won't use (only those available in SDC 3.0.0)
// * extension[copyrightLabel] 0..0  // Not available in SDC 3.0.0
* extension[performerType] 0..0
// * extension[versionAlgorithm] 0..0  // Commented out to allow versioning per SDC-2 constraint
// * item.extension[hidden] 0..0  // Not available in SDC 3.0.0
// * item.extension[answerConstraint] 0..0  // Not available in SDC 3.0.0

// add Sub Questionnaire Sub
* item.extension contains $QuestionnaireSubExtCanonical named subQuestionnaire 0..1 MS