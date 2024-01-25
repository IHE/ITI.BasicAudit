////////////////////////////////////////////////////////////// Non-Patient Delete Profile ////////////////////
Profile:        Delete
Parent:         AuditEvent
Id:             IHE.BasicAudit.Delete
Title:          "Basic AuditEvent for a successful Delete"
Description:    """
A basic AuditEvent profile for when a RESTful Delete action happens successfully.

- Given a Resource Delete is requested 
- And that resource has does not have a Patient subject or is otherwise associated with a Patient
  - when the resource is Patient specific then [PatientDelete](StructureDefinition-IHE.BasicAudit.PatientDelete.html) is used
- And the request is authorized
  - Authorization failures should follow [FHIR core Access Denied](http://hl7.org/fhir/security.html#AccessDenied)
- When successful
  - Note a failure AuditEvent may follow this pattern, but would not be a successful outcome and should have an OperationOutcome
- Then the AuditEvent recorded will conform
"""
* category = http://terminology.hl7.org/CodeSystem/audit-event-type#rest // "Restful Operation"
//* code ^slicing.discriminator.type = #value
//* code ^slicing.discriminator.path = "$this"
//* code ^slicing.rules = #open // allow other codes
//* code 1..
//* code contains anyDelete 1..1 
//* code[anyDelete] = http://hl7.org/fhir/restful-interaction#delete // "delete"
* code = http://hl7.org/fhir/restful-interaction#delete // "delete"
* action = #D
* recorded 1..1
// failures are recorded differently
* outcome.code = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 // "Success"
* agent ^slicing.discriminator.type = #pattern
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #open
* agent 2..
* agent contains 
    client 1..1 and 
    server 1..1 and 
    user 0..1
* agent[client].type = http://dicom.nema.org/resources/ontology/DCM#110150 // "Application"
* agent[client].who 1..1 // client identifier, May be an Device Resource, but more likely an identifier given the App identified in the OAuth token 
* agent[client].network[x] 1..1 // as known by TCP connection information

* agent[server].type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#custodian  // "Custodian"
* agent[server].who 1..1 // server identifier. May be a Device Resource, but likely just an identifier of the domain name
* agent[server].network[x] 1..1 // as known by TCP connection information

* agent[user].type from DataSources (required)
* agent[user].who 1..1 // May be a Resource, but likely just an identifier from the OAuth token
* agent[user].requestor = true
* agent[user].role MS // if the OAuth token includes any roles, they are recorded here

* agent[user].network[x] 0..0 // users are not network devices
* agent[user].authorization MS // if the OAuth token includes a PurposeOfUse it is recorded here
* source MS // what agent recorded the event. Likely the client or server but might be an intermediary
* entity ^slicing.discriminator.type = #pattern
* entity ^slicing.discriminator.path = "type"
* entity ^slicing.rules = #open
* entity 1..
* entity contains 
	transaction 0..1 and
    data 1..1

* entity[transaction].what.identifier.value 1..1
* entity[transaction].what.identifier.value ^short = "the value of X-Request-Id"

* entity[data].role from RestObjectRoles (required)
* entity[data].what 1..1
* entity[data].securityLabel 0..* // may contain the securityLabels on the resource
* entity[data].securityLabel ^short = "may be replicated from the resource .meta.security"

////////////////////////////////////////////////////////////// Patient Delete Profile ////////////////////////
Profile:        PatientDelete
Parent:         Delete
Id:             IHE.BasicAudit.PatientDelete
Title:          "Basic AuditEvent for a successful Delete with Patient"
Description:    """
A basic AuditEvent profile for when a RESTful Delete action happens successfully, and where there is an identifiable Patient subject associated with the Resource being deleted.

- Given a Resource Delete is requested 
- And that resource has a Patient subject or is otherwise associated with a Patient
- And the request is authorized
  - Authorization failures should follow [FHIR core Access Denied](http://hl7.org/fhir/security.html#AccessDenied)
- When successful
  - Note a failure AuditEvent may follow this pattern, but would not be a successful outcome and should have an OperationOutcome
- Then the AuditEvent recorded will conform
"""
//* entity ^slicing.discriminator.type = #pattern
//* entity ^slicing.discriminator.path = "type"
//* entity ^slicing.rules = #open
* entity 2..
* entity contains 
    patient 1..1 

* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 // "Patient"
* entity[patient].what 1..1
* entity[patient].what only Reference(Patient)
