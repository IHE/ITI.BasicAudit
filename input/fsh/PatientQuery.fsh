
////////////////////////////////////////////////////////////// Query Profile ////////////////////////
Profile:        Query
Parent:         AuditEvent
Id:             IHE.BasicAudit.Query
Title:          "Basic AuditEvent for a successful Query"
Description:    """
A basic AuditEvent profile for when a RESTful Query / Search action happens successfully.

- Given a RESTful Query 
- And there is no known Patient subject. 
  - The requestor logging the event would potentially not know a patient identity
  - The data objects may not be patient specific kind of objects
- And OAuth is used to authorize both app and user
- When an App requests a RESTful Query to retrieve Resource(s) 
- Then the search request is recorded  
  - The raw search request is base64 encoded and placed in the .entity[query].query element. The base64 encoding of the raw search request enables preserving exactly what was requested, including possibly malicious patterns. This enables detection of malicious or malformed requests.
  - The cleaned search may be recorded (not base64) in the .entity[query].description. The cleaned search request would have removed parameters that were not understood/supported. The cleaned search request in the .description element enables more efficient processing.

Note: the pattern defined in DICOM and IHE have the client is identified as the Source Role ID, and the server is identified as the Destination Role ID. This represents the query parameters are flowing from the client to the server. This may not be so obvious, as the data actually flows the opposite direction. This pattern is established and thus followed here.
"""
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* subtype 1..
* subtype from Querys (extensible)
* action = #E
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
* agent[client].type = http://dicom.nema.org/resources/ontology/DCM#110153 "Source Role ID"
* agent[client].who 1..1 // client identifier, May be an Device Resource, but more likely an identifier given the App identified in the OAuth token 
* agent[client].network 1..1 // as known by TCP connection information
* agent[client].role 0..0 
* agent[client].altId 0..0
* agent[client].name 0..0 
* agent[client].location 0..0 
* agent[client].policy 0..0 
* agent[client].media 0..0 
* agent[client].purposeOfUse 0..0 
* agent[server].type = http://dicom.nema.org/resources/ontology/DCM#110152 "Destination Role ID"
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
    query 1..1
* entity[transaction].type = BasicAuditEntityType#XrequestId
* entity[transaction].what.identifier.value 1..1
* entity[transaction].what.identifier.value ^short = "the value of X-Request-Id"
* entity[transaction].lifecycle 0..0 
* entity[transaction].securityLabel 0..0 
* entity[transaction].name 0..0
* entity[transaction].query 0..0
* entity[transaction].detail 0..0
* entity[query].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[query].role = http://terminology.hl7.org/CodeSystem/object-role#24 "Query"
* entity[query].what 0..0
* entity[query].lifecycle 0..0 
* entity[query].securityLabel 0..* // may contain the securityLabels on the Bundle search set returned
* entity[query].description 0..1 // allow the query string to exist in description in non base64Binary format
* entity[query].query 1..1
* entity[query].detail 0..0

////////////////////////////////////////////////////////////// Patient Query Profile ////////////////////////
Profile:        PatientQuery
Parent:         Query
Id:             IHE.BasicAudit.PatientQuery
Title:          "Basic AuditEvent for a successful Query with Patient"
Description:    """
A basic AuditEvent profile for when a RESTful Query action happens successfully, and where there is an identifiable Patient subject associated with the read Resource(s).

- Given a RESTful Query 
- And there is a known Patient subject. 
  - The query parameters may have identified a specific patient, or 
  - The data resulting from a query do have a patient subject
- And OAuth is used to authorize both app and user
- When an App requests a RESTful Query to retrieve Resource(s) 
- Then the search request is recorded  
  - The raw search request is base64 encoded and placed in the .entity[query].query element. The base64 encoding of the raw search request enables preserving exactly what was requested, including possibly malicious patterns. This enables detection of malicious or malformed requests.
  - The cleaned search may be recorded (not base64) in the .entity[query].description. The cleaned search request would have removed parameters that were not understood/supported. The cleaned search request in the .description element enables more efficient processing.

no results returned
- Given no Resource(s) are available for a given Patient identity
- And OAuth is used to authorize both app and user
- When an App requests a RESTful Query to retrieve Resources(s) for a given single Patient
- When policy indicates success with an empty bundle should be returned
- Then an AuditEvent following this profile is recorded for the requested given Patient

multiple patient results are returned. Note that one AuditEvent is created for every Patient identified in the resulting search set. Note this is true when the search set bundle includes any number of resources that collectively reference multiple Patients. This includes one Resource with multiple subject values, or many Resources with single subject values that are different.
- Given Resource(s) are known associated with multiple subjects 
- And OAuth is used to authorize both app and user
- When an App requests a RESTful Query to retrieve Resource(s) 
- And when the query resulting search set contains Resources associated with more than one Patient
- Then an AuditEvent following this profile is recorded for the Patient identified in the search set returned

Note: the pattern defined in DICOM and IHE have that the client is identified as the Source Role ID, and the server is identified as the Destination Role ID. This may not be so obvious, as the data actually flows the opposite direction. This pattern is established and thus followed here.
"""
* entity ^slicing.discriminator.type = #pattern
* entity ^slicing.discriminator.path = "type"
* entity ^slicing.rules = #open
* entity 1..
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



ValueSet: Querys
Title: "subtypes for RESTful search/query"
Description: "Search/query operators that are in REST"
* http://hl7.org/fhir/restful-interaction#search "search"
* http://hl7.org/fhir/restful-interaction#search-type "search-type"
* http://hl7.org/fhir/restful-interaction#search-system "search-system"


