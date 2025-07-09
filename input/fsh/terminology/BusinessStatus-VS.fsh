// ──────────────────────────────────────────────────────────────────────────────
// ValueSet: eForms Business Status
// ──────────────────────────────────────────────────────────────────────────────
ValueSet: EFormsBusinessStatusVS
Id: business-status
Title: "eForms Business Status ValueSet"
Description: """
Permitted values for the `businessStatus` extension on eForms ServiceRequest
and Task resources.
"""
* ^url = $EFormsBusinessStatusVS
* ^status = #active

// eForms codes
* include codes from system $EFormsBusinessStatusCS