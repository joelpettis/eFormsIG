//**********************************************************************************/
// Communication profile
//**********************************************************************************/
Profile:   EFormsCommunication
Parent:    Communication 
Id: EFormCommunication
Title:     "Communication Profile"
Description: """
Communication Profile for OH eForms, based on the R4 version.
	
Notifications, messages, or other communications related to the eForm workflow 
(e.g., `Form X has been assigned to you, A comment was added to Form Y`).

A new Communication resource will be generated to capture the Bi-Directional Communication requirement.  

There will be a Subscription Resource which will generate a Subscription each time
a Communication is saved in a specific state (proposal: in-progress or completed )
"""
* ^version = "1.0.0"
* ^status  = #active