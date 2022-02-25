
/////////////////////////////////////////////////////////////////////////////////////////
Instance: ex-auditBasicCreateNoPatient
InstanceOf: Create
Title: "Server - Audit Example of a basic Create"
Description: """
Audit Example for a RESTful Create of a resource with No patient subject. This example is a summary measure report.

- recorded by the client
- server is FHIR application server defined by ex-device
- client is an app on myMachine on myMachine
- user is John Smith
- created resource is ex-measurereport
"""
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #C
* subtype[anyCreate] = http://hl7.org/fhir/restful-interaction#create "create"
//* severity = #Informational
* recorded = 2020-04-29T09:49:00.000Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site = "server.example.com"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[server].type = DCM#110152 "Destination Role ID"
* agent[server].requestor = false
* agent[server].who = Reference(Device/ex-device)
* agent[server].network.address = "http://server.example.com/fhir"
* agent[server].network.type = http://hl7.org/fhir/network-type#5 "URI"
* agent[client].type = DCM#110153 "Source Role ID"
* agent[client].requestor = false
* agent[client].who.display = "myMachine.example.org"
* agent[client].network.address = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* agent[client].network.type = http://hl7.org/fhir/network-type#2 "IP Address"
* agent[user].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#AUT "author (originator)"
* agent[user].who.display = "John Smith" // just a display name pulled from the OAuth token
* agent[user].requestor = true
* entity[data].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[data].role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
* entity[data].what = Reference(MeasureReport/ex-measurereport)

/////////////////////////////////////////////////////////////////////////////////////////
Instance: ex-auditBasicCreateServer
InstanceOf: PatientCreate
Title: "Server - Audit Example of a basic patient identifiable Create"
Description: """
Audit Example for a RESTful Create of a resource with a patient subject

- recorded by the server with [client](AuditEvent-ex-auditBasicCreateClient.html)
- server is FHIR application server defined by ex-device
- client is an app on myMachine on myMachine
- user is John Smith
- patient is ex-patient
- created resource is ex-list
"""
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #C
* subtype[anyCreate] = http://hl7.org/fhir/restful-interaction#create "create"
//* severity = #Informational
* recorded = 2020-04-29T09:49:00.000Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.observer.display = "myMachine.example.org"
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[server].type = DCM#110152 "Destination Role ID"
* agent[server].requestor = false
* agent[server].who = Reference(Device/ex-device)
* agent[server].network.address = "http://server.example.com/fhir"
* agent[server].network.type = http://hl7.org/fhir/network-type#5 "URI"
* agent[client].type = DCM#110153 "Source Role ID"
* agent[client].requestor = false
* agent[client].who.display = "myMachine.example.org"
* agent[client].network.address = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* agent[client].network.type = http://hl7.org/fhir/network-type#2 "IP Address"
* agent[user].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#AUT "author (originator)"
* agent[user].who.display = "John Smith" // just a display name pulled from the OAuth token
* agent[user].requestor = true
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what = Reference(Patient/ex-patient)
* entity[data].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[data].role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
* entity[data].what = Reference(List/ex-list)

/////////////////////////////////////////////////////////////////////////////////////////
Instance: ex-auditBasicCreateClient
InstanceOf: PatientCreate
Title: "Client - Audit Example of a basic patient identifiable Create by the author"
Description: """
Audit Example for a RESTful Create of a resource with a patient subject created by the author

- recorded by the client with [server](AuditEvent-ex-auditBasicCreateServer.html)
- server is FHIR application server defined by ex-device
- client is an app on myMachine on myMachine
- user is the author John Smith
- patient is ex-patient
- created resource is ex-list
"""
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #C
* subtype[anyCreate] = http://hl7.org/fhir/restful-interaction#create "create"
//* severity = #Informational
* recorded = 2020-04-29T09:49:00.000Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[server].type = DCM#110152 "Destination Role ID"
* agent[server].requestor = false
* agent[server].who = Reference(Device/ex-device)
* agent[server].network.address = "http://server.example.com/fhir"
* agent[server].network.type = http://hl7.org/fhir/network-type#5 "URI"
* agent[client].type = DCM#110153 "Source Role ID"
* agent[client].requestor = false
* agent[client].who.display = "myMachine.example.org"
* agent[client].network.address = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* agent[client].network.type = http://hl7.org/fhir/network-type#2 "IP Address"
* agent[user].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#AUT "author (originator)"
* agent[user].who.display = "John Smith" // just a display name pulled from the OAuth token
* agent[user].requestor = true
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what = Reference(Patient/ex-patient)
* entity[data].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[data].role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
* entity[data].what = Reference(List/ex-list)

/////////////////////////////////////////////////////////////////////////////////////////
Instance: ex-auditBasicCreate1
InstanceOf: PatientCreate
Title: "Server - Audit Example of a basic patient identifiable Create by an informant"
Description: """
Audit Example for a RESTful Create of a resource with a patient subject by an informant

- recorded by the server
- server is FHIR application server defined by ex-device
- client is an app on myMachine on myMachine
- user is an Informant Betty Jones
- patient is ex-patient
- created resource is ex-list
"""
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #C
* subtype[anyCreate] = http://hl7.org/fhir/restful-interaction#create "create"
//* severity = #Informational
* recorded = 2020-04-29T09:49:00.000Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site = "server.example.com"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[server].type = DCM#110152 "Destination Role ID"
* agent[server].requestor = false
* agent[server].who = Reference(Device/ex-device)
* agent[server].network.address = "http://server.example.com/fhir"
* agent[server].network.type = http://hl7.org/fhir/network-type#5 "URI"
* agent[client].type = DCM#110153 "Source Role ID"
* agent[client].requestor = false
* agent[client].who.display = "myMachine.example.org"
* agent[client].network.address = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* agent[client].network.type = http://hl7.org/fhir/network-type#2 "IP Address"
* agent[user].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#INF "Informant"
* agent[user].who.display = "Betty Jones" // just a display name pulled from the OAuth token
* agent[user].requestor = true
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what = Reference(Patient/ex-patient)
* entity[data].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[data].role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
* entity[data].what = Reference(List/ex-list)

/////////////////////////////////////////////////////////////////////////////////////////
Instance: ex-auditBasicCreate2
InstanceOf: PatientCreate
Title: "Server - Audit Example of a basic patient identifiable Create by a custodian"
Description: """
Audit Example for a RESTful Create of a resource with a patient subject by a custodian

- recorded by the server
- server is FHIR application server defined by ex-device
- client is an app on myMachine on myMachine
- user is an Custodian Charley Miller
- patient is ex-patient
- created resource is ex-list
"""
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #C
* subtype[anyCreate] = http://hl7.org/fhir/restful-interaction#create "create"
//* severity = #Informational
* recorded = 2020-04-29T09:49:00.000Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site = "server.example.com"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[server].type = DCM#110152 "Destination Role ID"
* agent[server].requestor = false
* agent[server].who = Reference(Device/ex-device)
* agent[server].network.address = "http://server.example.com/fhir"
* agent[server].network.type = http://hl7.org/fhir/network-type#5 "URI"
* agent[client].type = DCM#110153 "Source Role ID"
* agent[client].requestor = false
* agent[client].who.display = "myMachine.example.org"
* agent[client].network.address = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* agent[client].network.type = http://hl7.org/fhir/network-type#2 "IP Address"
* agent[user].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#CST "Custodian"
* agent[user].who.display = "Charley Miller" // just a display name pulled from the OAuth token
* agent[user].requestor = true
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what = Reference(Patient/ex-patient)
* entity[data].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[data].role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
* entity[data].what = Reference(List/ex-list)


/////////////////////////////////////////////////////////////////////////////////////////
Instance: ex-auditBasicCreateNoUser
InstanceOf: PatientCreate
Title: "Client - Audit Example of a basic patient identifiable Create with no user"
Description: """
Audit Example for a RESTful Create of a resource with a patient subject with no user. This might be a B2B exchange where the OAuth token just identifies the requesting organization.

- recorded by the client - ex-device
- server is FHIR application server defined by ex-device
- client is an app on myMachine on myMachine
- patient is ex-patient
- created resource is ex-list
"""
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #C
* subtype[anyCreate] = http://hl7.org/fhir/restful-interaction#create "create"
//* severity = #Informational
* recorded = 2020-04-29T09:49:00.000Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site = "server.example.com"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[server].type = DCM#110152 "Destination Role ID"
* agent[server].requestor = false
* agent[server].who = Reference(Device/ex-device)
* agent[server].network.address = "http://server.example.com/fhir"
* agent[server].network.type = http://hl7.org/fhir/network-type#5 "URI"
* agent[client].type = DCM#110153 "Source Role ID"
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

/////////////////////////////////////////////////////////////////////////////////////////
Instance: ex-auditBasicCreateNoUserReport
InstanceOf: PatientCreate
Title: "Client - Audit Example of a basic patient identifiable Create of a Report with no user"
Description: """
Audit Example for a RESTful Create of a Report (document) resource with a patient subject with no user. This might be a B2B exchange where the OAuth token just identifies the requesting organization.

- recorded by the client - ex-device
- server is FHIR application server defined by ex-device
- client is an app on myMachine on myMachine
- patient is ex-patient
- created resource is ex-documentreference
"""
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #C
* subtype[anyCreate] = http://hl7.org/fhir/restful-interaction#create "create"
//* severity = #Informational
* recorded = 2020-04-29T09:49:00.000Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site = "server.example.com"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[server].type = DCM#110152 "Destination Role ID"
* agent[server].requestor = false
* agent[server].who = Reference(Device/ex-device)
* agent[server].network.address = "http://server.example.com/fhir"
* agent[server].network.type = http://hl7.org/fhir/network-type#5 "URI"
* agent[client].type = DCM#110153 "Source Role ID"
* agent[client].requestor = false
* agent[client].who.display = "myMachine.example.org"
* agent[client].network.address = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* agent[client].network.type = http://hl7.org/fhir/network-type#2 "IP Address"
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what = Reference(Patient/ex-patient)
* entity[data].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[data].role = http://terminology.hl7.org/CodeSystem/object-role#3 "Report"
* entity[data].what = Reference(DocumentReference/ex-documentreference)

/////////////////////////////////////////////////////////////////////////////////////////
Instance: ex-auditBasicCreateNoUserJob
InstanceOf: PatientCreate
Title: "Client - Audit Example of a basic patient identifiable Create of a Job with no user"
Description: """
Audit Example for a RESTful Create of a Job (document) resource with a patient subject with no user. This might be a B2B exchange where the OAuth token just identifies the requesting organization.

- recorded by the client - ex-device
- server is FHIR application server defined by ex-device
- client is an app on myMachine on myMachine
- patient is ex-patient
- created job is ex-documentreference
"""
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #C
* subtype[anyCreate] = http://hl7.org/fhir/restful-interaction#create "create"
//* severity = #Informational
* recorded = 2020-04-29T09:49:00.000Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site = "server.example.com"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[server].type = DCM#110152 "Destination Role ID"
* agent[server].requestor = false
* agent[server].who = Reference(Device/ex-device)
* agent[server].network.address = "http://server.example.com/fhir"
* agent[server].network.type = http://hl7.org/fhir/network-type#5 "URI"
* agent[client].type = DCM#110153 "Source Role ID"
* agent[client].requestor = false
* agent[client].who.display = "myMachine.example.org"
* agent[client].network.address = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* agent[client].network.type = http://hl7.org/fhir/network-type#2 "IP Address"
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what = Reference(Patient/ex-patient)
* entity[data].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[data].role = http://terminology.hl7.org/CodeSystem/object-role#20 "Job"
* entity[data].what = Reference(DocumentReference/ex-documentreference)

