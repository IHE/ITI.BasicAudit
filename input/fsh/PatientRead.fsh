
Profile:        Read
Parent:         AuditEvent
Id:             IHE.BasicAudit.Read
Title:          "Basic AuditEvent for a successful Read"
Description:    """
A basic AuditEvent profile for when a RESTful Read action happens successfully.

* Given a Resource has no Patient subject
* And OAuth is used to authorize both app and user
* When an App requests a RESTful Read to retrieve that Resource
* Then an AuditEvent following this profile is recorded
"""
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* subtype ^slicing.discriminator.type = #value
* subtype ^slicing.discriminator.path = "$this"
* subtype ^slicing.rules = #open // allow other codes
* subtype 1..
//* subtype contains anyRead 1..1 
//* subtype[anyRead] from Reads (required)
* subtype contains anyRead 0..1 and anyVread 0..1
* subtype[anyRead] = http://hl7.org/fhir/restful-interaction#read "read" (exactly)
* subtype[anyVread] = http://hl7.org/fhir/restful-interaction#vread "vread" (exactly)
* action = #R
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
* agent[client].type = http://dicom.nema.org/resources/ontology/DCM#110152 "Destination Role ID"
* agent[client].who 1..1 // client identifier, May be an Device Resource, but more likely an identifier given the App identified in the OAuth token 
* agent[client].network 1..1 // as known by TCP connection information
* agent[client].role 0..0 
* agent[client].altId 0..0
* agent[client].name 0..0 
* agent[client].location 0..0 
* agent[client].policy 0..0 
* agent[client].media 0..0 
* agent[client].purposeOfUse 0..0 
* agent[server].type = http://dicom.nema.org/resources/ontology/DCM#110153 "Source Role ID"
* agent[server].who 1..1 // server identifier. May be a Device Resource, but likely just an identifier of the domain name
* agent[server].network 1..1 // as known by TCP connection information
* agent[server].role 0..0 
* agent[server].altId 0..0
* agent[server].name 0..0 
* agent[server].location 0..0 
* agent[server].policy 0..0 
* agent[server].media 0..0 
* agent[server].purposeOfUse 0..0 
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




Profile:        PatientRead
Parent:         Read
Id:             IHE.BasicAudit.PatientRead
Title:          "Basic AuditEvent for a successful Read with a Patient"
Description:    """
A basic AuditEvent profile for when a RESTful Read action happens successfully, and where there is an identifiable Patient subject associated with the read Resource.

* Given a Resource has a Patient subject
* And OAuth is used to authorize both app and user
* When an App requests a RESTful Read to retrieve that Resource
* Then an AuditEvent following this profile is recorded
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





// not used anymore
//ValueSet: Reads
//Title: "subtypes for RESTful reads"
//Description: "read operators that are in REST"
//* http://hl7.org/fhir/restful-interaction#read "read"
//* http://hl7.org/fhir/restful-interaction#vread "vread"

ValueSet: RestObjectRoles
Title: "RESTful objects role in the event"
Description: "The role that the given Object played in the Audit Event recorded"
// I expect "Domain Resource" most of the time, but the other two are acceptable
* http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
* http://terminology.hl7.org/CodeSystem/object-role#3 "Report"
* http://terminology.hl7.org/CodeSystem/object-role#20 "Job"


