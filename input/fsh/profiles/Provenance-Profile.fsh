//**********************************************************************************/
// Provenance profile
//**********************************************************************************/
Profile:   EFormsProvenance
Parent:    Provenance 
Id: EFormProvenance
Title:     "Provenance Profile"
Description: """
Provenance Profile for OH eForms, based on the R4 version.

The Provenance resource is the immutable audit trail of significant events. 
A new Provenance resource must be created for every significant business action 
(e.g., form creation, submission, revision, status change, revocation). 
It meticulously records who did what, when they did it, and to which specific version
 of a resource the action was applied.
"""
* ^version = "1.0.0"
* ^status  = #active