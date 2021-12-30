////////////////////////////////////////////////////////////// Non-Patient Delete Profile ////////////////////
Profile:        Delete
Parent:         AuditEvent
Id:             IHE.BasicAudit.Delete
Title:          "Basic AuditEvent for a successful Delete"
Description:    """
A basic AuditEvent profile for when a RESTful Delete action happens successfully.

* Given a Resource has no Patient subject 
* And OAuth is used to authorize both app and user
* When an App requests a RESTful Delete of a target Resource
* And the target Resource is successfully Deleted thus having an id that is no longer valid
* Then an AuditEvent following this profile is recorded using the id that is no longer valid
"""
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* subtype 1..1
* subtype = http://hl7.org/fhir/restful-interaction#delete "delete"
* action = #D
* recorded 1..1
// failures are recorded differently
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* agent ^slicing.discriminator.type = #pattern
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #open
* agent 2..
* agent contains 
    client 1..1 and 
    server 1..1 and 
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
* agent[server].type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#custodian  "Custodian"
* agent[server].who 1..1 // server identifier. May be a Device Resource, but likely just an identifier of the domain name
* agent[server].network 1..1 // as known by TCP connection information
* agent[server].role 0..0 
* agent[server].altId 0..0
* agent[server].name 0..0 
* agent[server].location 0..0 
* agent[server].policy 0..0 
* agent[server].media 0..0 
* agent[server].purposeOfUse 0..0 
* agent[user].type from DataSources (required)
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
* entity ^slicing.discriminator.path = "type"
* entity ^slicing.rules = #open
* entity 1..
* entity contains 
	transaction 0..1 and
    data 1..1
* entity[transaction].type = BasicAuditEntityType#XrequestId
* entity[transaction].what.identifier.value 1..1
* entity[transaction].what.identifier.value ^short = "the value of X-Request-Id"
* entity[transaction].lifecycle 0..0 
* entity[transaction].securityLabel 0..0 
* entity[transaction].name 0..0
* entity[transaction].query 0..0
* entity[transaction].detail 0..0
* entity[data].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[data].role from RestObjectRoles (required)
* entity[data].what 1..1
* entity[data].lifecycle 0..0 
* entity[data].securityLabel 0..* // may contain the securityLabels on the resource
* entity[data].name 0..0
* entity[data].query 0..0
* entity[data].detail 0..0


////////////////////////////////////////////////////////////// Patient Delete Profile ////////////////////////
Profile:        PatientDelete
Parent:         Delete
Id:             IHE.BasicAudit.PatientDelete
Title:          "Basic AuditEvent for a successful Delete with Patient"
Description:    """
A basic AuditEvent profile for when a RESTful Delete action happens successfully, and where there is an identifiable Patient subject associated with the Resource being deleted.

* Given a Resource has a Patient subject 
* And OAuth is used to authorize both app and user
* When an App requests a RESTful Delete of a target Resource
* And the target Resource is successfully Deleted thus having an id that is no longer valid
* Then an AuditEvent following this profile is recorded using the id that is no longer valid
* Patient is specified
"""
* entity ^slicing.discriminator.type = #pattern
* entity ^slicing.discriminator.path = "type"
* entity ^slicing.rules = #open
* entity 2..
* entity contains 
    patient 1..1 
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what 1..1
* entity[patient].what only Reference(Patient)
* entity[patient].lifecycle 0..0 
* entity[patient].securityLabel 0..0
* entity[patient].name 0..0
* entity[patient].query 0..0
* entity[patient].detail 0..0