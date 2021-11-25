
Profile:        IUAaccessToken
Parent:         AuditEvent
Id:             ITI.BasicAudit.IUAaccessToken
Title:          "Basic AuditEvent pattern for when an activity was authorized by an IUA access token"
Description:    """
A basic AuditEvent profile for when an activity was authorized by an IUA access token. This profile is expected to be used with some other detail that explains the activity. This profile only covers the IUA access token.

* Given an activity has occured
* And OAuth is used to authorize (both app and user)
* And the given activity is using http with authorization: bearer mechanism 
  * IUA - [3.72 Incorporate Access Token \[ITI-72\]](https://profiles.ihe.net/ITI/IUA/index.html#372-incorporate-access-token-iti-72)
  * Bulk Data Access - [11. Presenting an Access Token to FHIR API](https://hl7.org/fhir/uv/bulkdata/authorization/index.html#presenting-an-access-token-to-fhir-api)
  * SMART-app-launch - [7.1.5 Step 4: App accesses clinical data via FHIR API](http://hl7.org/fhir/smart-app-launch/index.html#step-4-app-accesses-clinical-data-via-fhir-api)
* When an AuditEvent is recorded for the activity
* Then that AuditEvent would follow this profile regarding recording the IUA access token details
* note: this profile records minimal information from the IUA access token, which presumes that use of the AuditEvent at a later time will be able to resolve the given information. 

TODO: Question. Given IUA. Why would the ITI-71 not record the token issued, and ITI-72 simply indicate to record the token (as appeared in the bearer header) in the activity audit event as the agent[source/client].who.identifier.value? Note that this is effectively what WILL happen at a web-server. Given that the access_token is a given X.Y.Z; recording just the Y is sufficient, as X and Z are the signature stuff. if you don't save the signature stuff then you are not enabling a replay.


IUA ITI-71 Authorization Request

| IUA attribute | AuditEvent element |
+---------------+--------------------+
| clint_id | agent[client].who.identifier.value |
| state | N/A |
| resource | ? |
| code_challenge | N/A |
| code_challenge_method | N/A |
| redirect_uri | N/A |
| scope | ? |

IUA ITI-71 Access Token Response

| IUA attribute | AuditEvent element |
+---------------+--------------------+
| token_type | ? |
| access_token | ? |
| scope | ? |
| expires_in | ? |
| refresh_token | ? |
| scope | ? |
| code | ? |

IUA ITI-71 JSON Web Token
| IUA attribute | Description | AuditEvent element |
+---------------+-------------+--------------------+
| iss | JWT Issuer | ? |
| sub | JWT Subject | ? |
| aud | JWT Audience | ? |
| jti | JWT ID | ? |
| exp | JWT Expiration Time | ? |
| nbf | JWT Not before | ? |
| iat | JWT Issued at | ? |
| client_id | OA2 client id | app id | ? |
| scope | OA2 token scope | ? |
| ihe_iua:subject_name 
| ihe_iua:subject_organization
| ihe_iua:subject_organization_id
| ihe_iua:subject_role 
| ihe_iua:purpose_of_use 
| ihe_iua:home_community_id
| ihe_iua:national_provider_identifier
| ihe_iua:person_id
| ihe_bppc:patient_id
| ihe_bppc:doc_id
| ihe_bppc:acp



"""
* agent ^slicing.discriminator.type = #pattern
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #open
* agent 1..2
* agent contains 
    client 1..1 and 
    human 0..1
* agent[client].type = http://dicom.nema.org/resources/ontology/DCM#110150 "Application"
* agent[client].who 1..1 // client identifier, May be an Device Resource, but more likely an identifier given the App identified in the OAuth token 
* agent[client].network 1..1 // as known by TCP connection information
* agent[client].role 0..0 
* agent[client].altId 0..0
* agent[client].name 0..0 
* agent[client].location 0..0 
* agent[client].policy 0..0 
* agent[client].media 0..0 
* agent[client].purposeOfUse 0..0 
* agent[human].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP "information recipient"
* agent[human].who 1..1 // May be a Resource, but likely just an identifier from the OAuth token
* agent[human].requestor = true
* agent[human].role MS // if the OAuth token includes any roles, they are recorded here
* agent[human].altId 0..0 // discouraged
* agent[human].name MS // might also be in .who.text but here is searchable
* agent[human].location 0..0 // discouraged as unlikely to be known in this scenario
* agent[human].policy 0..0 // discouraged as unlikely to be known in this scenario
* agent[human].media 0..0 // media is physical storage media identification
* agent[human].network 0..0 // humans are not network devices
* agent[human].purposeOfUse MS // if the OAuth token includes a PurposeOfUse it is recorded here

