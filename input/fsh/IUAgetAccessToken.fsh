
Profile:        AuditIUAgetAccessToken
Parent:         AuditEvent
Id:             IHE.IUA.71
Title:          "IHE IUA ITI-71 AuditEvent for a successful Get Access Token"
Description:    """
Defines constraints on the AuditEvent Resource to record when a ITI-71 - Get Access Token succeeds

This AuditEvent is recorded by Authorization Client and/or Authorization Server that are grouped with ATNA Secure Node or Secure Application.
- User Authenticated event
- ITI-71 subtype
- 2 or 3 agents
  - client - 
  - auth-server
  - user user
- 1 entity  
  - the access token request
"""
* type = http://dicom.nema.org/resources/ontology/DCM#110114 // "User Authentication"
* type 1..
* subtype 1..1
* subtype = urn:ihe:event-type-code#ITI-71 // "Get Access Token"
* action = #E
* recorded 1..1
// failures are recorded differently
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 // "Success"
* outcome 1..
* agent ^slicing.discriminator.type = #value
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #closed
* agent 2..3
* agent contains 
    client 1..1 and 
    auth-server 1..1 and 
    user 0..1
* agent[client].type = http://dicom.nema.org/resources/ontology/DCM#110150 // "Application"
* agent[client].type 1..1
* agent[client].who 1..1 // client identifier, May be an Device Resource, but more likely an identifier given the App identified in the OAuth token 
* agent[client].network 1..1 // as known by TCP connection information
* agent[client].media 0..0 
* agent[auth-server].type = UserAgentTypes#AuthzOauthService
* agent[auth-server].type 1..1
* agent[auth-server].who 1..1 // server identifier. May be a Device Resource, but likely just an identifier of the domain name
* agent[auth-server].network 1..1 // as known by TCP connection information
* agent[auth-server].media 0..0 
* agent[user].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP // "information recipient"
* agent[user].type 1..1
* agent[user].who 1..1 // May be a Resource, but likely just an identifier from the OAuth token
* agent[user].requestor = true
* agent[user].role MS // if the OAuth token includes any roles, they are recorded here
* agent[user].altId 0..0 // discouraged
* agent[user].name MS // might also be in .who.text but here is searchable
* agent[user].media 0..0 // media is physical storage media identification
* agent[user].network 0..0 // users are not network devices
* agent[user].purposeOfUse MS // if the OAuth token includes a PurposeOfUse it is recorded here
* source MS // what agent recorded the event. Likely the client or server but might be an intermediary
* entity ^slicing.discriminator.type = #value
* entity ^slicing.discriminator.path = "role"
* entity ^slicing.rules = #closed
* entity 1..1
* entity contains 
    token-request 1..1 and
    token-response 0..1	
* entity[token-request].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 // "System Object"
* entity[token-request].type 1..1
* entity[token-request].role = http://terminology.hl7.org/CodeSystem/object-role#24 // "Query"
* entity[token-request].role 1..
* entity[token-request].what 0..0
* entity[token-request].query 1..1
* entity[token-request].query ^short = "contains the http request in raw form, without the code_verifier value"


* entity[token-response].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 // "System Object"
* entity[token-response].type 1..1
* entity[token-response].role = http://terminology.hl7.org/CodeSystem/object-role#13 // "Security Resource"
* entity[token-response].role 1..
* entity[token-response].what 1..1
* entity[token-response].what ^short = "holds the token id issued" 
* entity[token-response].detail 1..*
* entity[token-response].detail ^short = "holds the key values from the response"

// might use the 4 examples from IUA
// Figure 3.71.4.1.2.2-2: Example Authorization Request
