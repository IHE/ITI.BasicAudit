
/////////////////////////////////////////////////////////////////////////////////////////
Instance: ex-auditBasicReadNoPatient
InstanceOf: Read
Title: "Server - Audit Example of a basic patient identifiable read"
Description: """
Audit Example for a RESTful read of a resource with no patient subject

- recorded by the server
- server is FHIR application server defined by ex-device
- client is an app on myMachine on myMachine
- user is John Smith
- read resource is ex-measurereport
"""
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #R
* subtype[anyRead] = http://hl7.org/fhir/restful-interaction#read "read"
//* severity = #Informational
* recorded = 2020-04-29T09:49:00.000Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site = "server.example.com"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[server].type = DCM#110153 "Source Role ID"
* agent[server].requestor = false
* agent[server].who = Reference(Device/ex-device)
* agent[server].network.address = "http://server.example.com/fhir"
* agent[server].network.type = http://hl7.org/fhir/network-type#5 "URI"
* agent[client].type = DCM#110152 "Destination Role ID"
* agent[client].requestor = false
* agent[client].who.display = "myMachine.example.org"
* agent[client].network.address = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* agent[client].network.type = http://hl7.org/fhir/network-type#2 "IP Address"
* agent[user].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP "information recipient"
* agent[user].who.display = "John Smith" // just a display name pulled from the OAuth token
* agent[user].requestor = true
* entity[data].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[data].role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
* entity[data].what = Reference(MeasureReport/ex-measurereport)



/////////////////////////////////////////////////////////////////////////////////////////
Instance: ex-auditBasicReadServer
InstanceOf: PatientRead
Title: "Server - Audit Example of a basic patient identifiable read"
Description: """
Audit Example for a RESTful read of a resource with a patient subject

- recorded by the server peer [client](AuditEvent-ex-auditBasicReadClient.html)
- server is FHIR application server defined by ex-device
- client is an app on myMachine on myMachine
- user is John Smith
- patient is ex-patient
- read resource is ex-list
- x-request-id is 76d148b6-586d-11ec-bf63-0242ac130002
"""
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #R
* subtype[anyRead] = http://hl7.org/fhir/restful-interaction#read "read"
//* severity = #Informational
* recorded = 2020-04-29T09:49:00.000Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site = "server.example.com"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[server].type = DCM#110153 "Source Role ID"
* agent[server].requestor = false
* agent[server].who = Reference(Device/ex-device)
* agent[server].network.address = "http://server.example.com/fhir"
* agent[server].network.type = http://hl7.org/fhir/network-type#5 "URI"
* agent[client].type = DCM#110152 "Destination Role ID"
* agent[client].requestor = false
* agent[client].who.display = "myMachine.example.org"
* agent[client].network.address = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* agent[client].network.type = http://hl7.org/fhir/network-type#2 "IP Address"
* agent[user].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP "information recipient"
* agent[user].who.display = "John Smith" // just a display name pulled from the OAuth token
* agent[user].requestor = true
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what = Reference(Patient/ex-patient)
* entity[data].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[data].role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
* entity[data].what = Reference(List/ex-list)
* entity[transaction].type = BasicAuditEntityType#XrequestId
* entity[transaction].what.identifier.value = "76d148b6-586d-11ec-bf63-0242ac130002"


/////////////////////////////////////////////////////////////////////////////////////////
Instance: ex-auditBasicReadClient
InstanceOf: PatientRead
Title: "Client - Audit Example of a basic patient identifiable read"
Description: """
Audit Example for a RESTful read of a resource with a patient subject

- recorded by the client peer [server](AuditEvent-ex-auditBasicReadServer.html)
- server is FHIR application server defined by ex-device
- client is an app on myMachine on myMachine
- user is John Smith
- patient is ex-patient
- read resource is ex-list
- x-request-id is 76d148b6-586d-11ec-bf63-0242ac130002
"""
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #R
* subtype[anyRead] = http://hl7.org/fhir/restful-interaction#read "read"
//* severity = #Informational
* recorded = 2020-04-29T09:49:00.000Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.observer.display = "myMachine.example.org"
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#1 "User Device"
* agent[server].type = DCM#110153 "Source Role ID"
* agent[server].requestor = false
* agent[server].who = Reference(Device/ex-device)
* agent[server].network.address = "http://server.example.com/fhir"
* agent[server].network.type = http://hl7.org/fhir/network-type#5 "URI"
* agent[client].type = DCM#110152 "Destination Role ID"
* agent[client].requestor = false
* agent[client].who.display = "myMachine.example.org"
* agent[client].network.address = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* agent[client].network.type = http://hl7.org/fhir/network-type#2 "IP Address"
* agent[user].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP "information recipient"
* agent[user].who.display = "John Smith" // just a display name pulled from the OAuth token
* agent[user].requestor = true
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what = Reference(Patient/ex-patient)
* entity[data].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[data].role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
* entity[data].what = Reference(List/ex-list)
* entity[transaction].type = BasicAuditEntityType#XrequestId
* entity[transaction].what.identifier.value = "76d148b6-586d-11ec-bf63-0242ac130002"






/////////////////////////////////////////////////////////////////////////////////////////
Instance: ex-auditBasicReadNoUser
InstanceOf: PatientRead
Title: "Server - Audit Example of a basic patient identifiable read with no user"
Description: """
Audit Example for a RESTful read of a resource with a patient subject with no user. This might be a B2B exchange where the OAuth token just identifies the requesting organization.

- recorded by the server
- server is FHIR application server defined by ex-device
- client is an app on myMachine on myMachine
- user is John Smith
- patient is ex-patient
- read resource is ex-list
- x-request-id is c07cf648-f068-4dd9-9411-8e69ca07d525
"""
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #R
* subtype[anyRead] = http://hl7.org/fhir/restful-interaction#read "read"
//* severity = #Informational
* recorded = 2020-04-29T09:49:00.000Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site = "server.example.com"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[server].type = DCM#110153 "Source Role ID"
* agent[server].requestor = false
* agent[server].who = Reference(Device/ex-device)
* agent[server].network.address = "http://server.example.com/fhir"
* agent[server].network.type = http://hl7.org/fhir/network-type#5 "URI"
* agent[client].type = DCM#110152 "Destination Role ID"
* agent[client].requestor = false
* agent[client].who.display = "myMachine.example.org"
* agent[client].network.address = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* agent[client].network.type = http://hl7.org/fhir/network-type#2 "IP Address"
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what = Reference(Patient/ex-patient)
* entity[data].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[data].role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
* entity[data].what = Reference(List/ex-list)
* entity[transaction].type = BasicAuditEntityType#XrequestId
* entity[transaction].what.identifier.value = "c07cf648-f068-4dd9-9411-8e69ca07d525"
