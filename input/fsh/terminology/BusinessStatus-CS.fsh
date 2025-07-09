// ──────────────────────────────────────────────────────────────────────────────
// CodeSystem: eForms Business Status
// ──────────────────────────────────────────────────────────────────────────────
CodeSystem: EFormsBusinessStatusCS
Id: business-status-cs
Title: "eForms Business Status CodeSystem"
Description: """
Codes representing the eForms workflow states that appear in the
`businessStatus` extension on ServiceRequest and Task.
"""
* ^url = $EFormsBusinessStatusCS
* ^status = #active
* ^content = #complete

* #draft           "Draft"                     "The form is being prepared and is not yet submitted."
* #submitted       "Submitted"                 "The form package has been delivered for processing."
* #request-info    "Request for Information"   "Additional data has been requested."
* #processed       "Processed"                 "The submission has been accepted and processed."
* #completed       "Completed"                 "All steps are finished; no further action required."
* #revoked         "Revoked"                   "The request has been cancelled or withdrawn."
* #error           "Error"                     "Processing failed or an unrecoverable error occurred."