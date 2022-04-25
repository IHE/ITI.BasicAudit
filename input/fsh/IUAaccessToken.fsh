
Profile: OAUTHaccessTokenUseOpaque
Parent: AuditEvent
Id: IHE.BasicAudit.OAUTHaccessTokenUse.Opaque
Title: "Basic AuditEvent pattern for oAuth Opaque"
Description: """
Used when only have an opaque oAuth token.
"""
* agent ^slicing.discriminator.type = #pattern
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #open
* agent contains 
    user 1..
* agent[user].type = UserAgentTypes#UserOauthAgent
* agent[user] ^short = "other elements may be filled in as needed."
* agent[user].requestor = true
* agent[user].policy 1..1 MS
* agent[user].policy ^short = "last 32 characters of the oAuth token."
* agent[user].policy ^definition = "do NOT include the whole opaque token. The last 32 characters should be enough and would be the most entropy."
* agent[user].purposeOfUse MS 
* agent[user].purposeOfUse ^short = "SAML subject:purposeofuse"

Profile: OAUTHaccessTokenUseMinimal
Parent: AuditEvent
Id: IHE.BasicAudit.OAUTHaccessTokenUse.Minimal
Title: "Basic AuditEvent pattern for oAuth Minimal"
Description: """
Used when only have access to the oAuth token details (JWT).
"""
* agent ^slicing.discriminator.type = #pattern
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #open
* agent 1..2
* agent contains 
    client 1..1 and 
    user 0..1
* agent[client].type = http://dicom.nema.org/resources/ontology/DCM#110150 "Application"
* agent[client].who 1..1 // client identifier, May be an Device Resource, but more likely an identifier given the App identified in the OAuth token 
* agent[client].network 0..1 MS // as known by TCP connection information
* agent[client].media 0..0 
* agent[user].type = UserAgentTypes#UserOauthAgent
* agent[user].who 1..1 // May be a Resource, but likely just an identifier from the OAuth token
* agent[user].requestor = true
* agent[user].role MS // if the OAuth token includes any roles, they are recorded here
* agent[user].name MS // might also be in .who.text but here is searchable
* agent[user].policy 1..1 
* agent[user].policy ^short = "jti (JWT ID)"
* agent[user].media 0..0 // media is physical storage media identification
* agent[user].network 0..0 // users are not network devices
* agent[user].purposeOfUse MS // if the OAuth token includes a PurposeOfUse it is recorded here

Profile: OAUTHaccessTokenUseComprehensive
Parent: OAUTHaccessTokenUseMinimal
Id: IHE.BasicAudit.OAUTHaccessTokenUse.Comprehensive
Title: "Basic AuditEvent pattern for oAuth Comprehensive"
Description: """
Used when only have access to the oAuth token details (JWT).
"""
// TODO fill the oauth comprehensive with the deeper requirements.


Profile:        IUAaccessTokenUse
Parent:         AuditEvent
Id:             IHE.BasicAudit.IUAaccessTokenUse
Title:          "Basic AuditEvent pattern for when an activity was authorized by an IUA access token"
Description:    """
A basic AuditEvent profile for when an activity was authorized by an IUA access token. This profile is expected to be used with some other detail that explains the activity. This profile only covers the IUA access token.

* Given an activity has occured
* And OAuth is used to authorize (both app and user)
* And the given activity is using http with authorization: bearer mechanism 
  * IUA - [3.72 Incorporate Access Token \[ITI-72\]](https://profiles.ihe.net/ITI/IUA/index.html#372-incorporate-access-token-iti-72)
  * Bulk Data Access - [11. Presenting an Access Token to FHIR API](https://hl7.org/fhir/uv/bulkdata/authorization/index.html#presenting-an-access-token-to-fhir-api)
  * SMART-app-launch - [7.1.5 Step 4: App accesses clinical data via FHIR API](http://hl7.org/fhir/smart-app-launch/index.html#step-4-app-accesses-clinical-data-via-fhir-api)
  * [HL7 Security for Scalable Registration, Authentication, and Authorization (aka UDAP) ](http://hl7.org/fhir/us/udap-security/history.html) when it gets published 
* When an AuditEvent is recorded for the activity
* Then that AuditEvent would follow this profile regarding recording the IUA access token details
* note: this profile records minimal information from the IUA access token, which presumes that use of the AuditEvent at a later time will be able to resolve the given information.
"""
* agent ^slicing.discriminator.type = #pattern
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #open
* agent 1..2
* agent contains 
    client 1..1 and 
    user 0..1
* agent[client].type = http://dicom.nema.org/resources/ontology/DCM#110150 "Application"
* agent[client].who 1..1 // client identifier, May be an Device Resource, but more likely an identifier given the App identified in the OAuth token 
* agent[client].network 1..1 // as known by TCP connection information
* agent[client].media 0..0 
* agent[user].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP "information recipient"
* agent[user].who 1..1 // May be a Resource, but likely just an identifier from the OAuth token
* agent[user].requestor = true
* agent[user].role MS // if the OAuth token includes any roles, they are recorded here
* agent[user].name MS // might also be in .who.text but here is searchable
* agent[user].media 0..0 // media is physical storage media identification
* agent[user].network 0..0 // users are not network devices
* agent[user].purposeOfUse MS // if the OAuth token includes a PurposeOfUse it is recorded here

