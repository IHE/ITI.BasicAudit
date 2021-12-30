
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
* type = http://dicom.nema.org/resources/ontology/DCM#110114 "User Authentication"
* subtype 1..1
* subtype = urn:ihe:event-type-code#ITI-71 "Get Access Token"
* action = #E
* recorded 1..1
// failures are recorded differently
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* agent ^slicing.discriminator.type = #pattern
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #closed
* agent 2..3
* agent contains 
    client 1..1 and 
    auth-server 1..1 and 
    user 0..1
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
// TODO: need a specific code for auth-server agent
* agent[auth-server].type = http://dicom.nema.org/resources/ontology/DCM#110152 "Destination Role ID"
* agent[auth-server].who 1..1 // server identifier. May be a Device Resource, but likely just an identifier of the domain name
* agent[auth-server].network 1..1 // as known by TCP connection information
* agent[auth-server].role 0..0 
* agent[auth-server].altId 0..0
* agent[auth-server].name 0..0 
* agent[auth-server].location 0..0 
* agent[auth-server].policy 0..0 
* agent[auth-server].media 0..0 
* agent[auth-server].purposeOfUse 0..0 
* agent[user].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP "information recipient"
* agent[user].who 1..1 // May be a Resource, but likely just an identifier from the OAuth token
* agent[user].requestor = true
* agent[user].role MS // if the OAuth token includes any roles, they are recorded here
* agent[user].altId 0..0 // discouraged
* agent[user].name MS // might also be in .who.text but here is searchable
* agent[user].location 0..0 // discouraged as unlikely to be known in this scenario
* agent[user].policy 0..0 // discouraged as unlikely to be known in this scenario
* agent[user].media 0..0 // media is physical storage media identification
* agent[user].network 0..0 // users are not network devices
* agent[user].purposeOfUse MS // if the OAuth token includes a PurposeOfUse it is recorded here
* source MS // what agent recorded the event. Likely the client or server but might be an intermediary
* entity ^slicing.discriminator.type = #pattern
* entity ^slicing.discriminator.path = "role"
* entity ^slicing.rules = #closed
* entity 1..1
* entity contains 
    token-request 1..1 and
    token-response 0..1	
* entity[token-request].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[token-request].role = http://terminology.hl7.org/CodeSystem/object-role#24 "Query"
* entity[token-request].what 0..0
* entity[token-request].lifecycle 0..0 
* entity[token-request].securityLabel 0..0
* entity[token-request].name 0..0
* entity[token-request].query 1..1
// query contains the http request in raw form
* entity[token-request].detail 0..0
// detail contains key parts of the request 

* entity[token-response].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[token-response].role = http://terminology.hl7.org/CodeSystem/object-role#13 "Security Resource"
* entity[token-response].what 1..1
// what holds the token id issued
* entity[token-response].lifecycle 0..0 
* entity[token-response].securityLabel 0..0
* entity[token-response].name 0..0
* entity[token-response].query 0..0
// query contains the http request, without the code_verifier value 
* entity[token-response].detail 1..*
// detail holds the key values from the response

//TODO - use the 4 examples from IUA
// Figure 3.71.4.1.2.2-2: Example Authorization Request
