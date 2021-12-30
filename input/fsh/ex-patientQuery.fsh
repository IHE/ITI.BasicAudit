////   REMEMBER to update the -intro.md files in pagecontent   ////
/////////////////////////////////////////////////////////////////////////////////////////
Instance: ex-auditBasicQueryGetNoPatient
InstanceOf: Query
Title: "Server - Audit Example of a basic Query (GET)"
Description: """
Audit Example for a RESTful Query using GET with NO patient subject, recorded by the Server.
- recorded by the server
- server is FHIR application server defined by ex-device
- client is a computer at myMachine.example.org
- user is John Smith
- query is for a MeasureReport
- X-Request-Id is specified 
"""
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #E
* subtype = http://hl7.org/fhir/restful-interaction#search "search"
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
* agent[user].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP "information recipient"
* agent[user].who.display = "John Smith" // just a display name pulled from the OAuth token
* agent[user].requestor = true
* entity[query].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[query].role = http://terminology.hl7.org/CodeSystem/object-role#24 "Query"
* entity[query].description = """
GET test.fhir.org/r4/MeasureReport?_lastUpdated=gt2020-11-06T21:52:30.300Z&_sort=_lastUpdated&_count=10
Accept: application/fhir+json; fhirVersion=4.0
X-Request-Id: 4a8dca3c-2205-4dc7-90e1-db877781d7cc
"""
* entity[query].query = "R0VUIHRlc3QuZmhpci5vcmcvcjQvTWVhc3VyZVJlcG9ydD9fbGFzdFVwZGF0ZWQ9Z3QyMDIwLTExLTA2VDIxOjUyOjMwLjMwMFomX3NvcnQ9X2xhc3RVcGRhdGVkJl9jb3VudD0xMApBY2NlcHQ6IGFwcGxpY2F0aW9uL2ZoaXIranNvbjsgZmhpclZlcnNpb249NC4wClgtUmVxdWVzdC1JZDogNGE4ZGNhM2MtMjIwNS00ZGM3LTkwZTEtZGI4Nzc3ODFkN2Nj"
* entity[transaction].type = BasicAuditEntityType#XrequestId
* entity[transaction].what.identifier.value = "4a8dca3c-2205-4dc7-90e1-db877781d7cc"



/////////////////////////////////////////////////////////////////////////////////////////
Instance: ex-auditBasicQueryGetServer
InstanceOf: PatientQuery
Title: "Server - Audit Example of a basic patient identifiable Query (GET)"
Description: """
Audit Example for a RESTful Query using GET with a patient subject, recorded by the Server
- recorded by the server 
  - see same event as recorded by the [client](AuditEvent-ex-auditBasicQueryGetClient.html)
- server is FHIR application server defined by ex-device
- client is a computer at myMachine.example.org
- user is John Smith
- query is for an Observation for given patient
- patient is specified
- X-Request-Id is specified 
"""
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #E
* subtype = http://hl7.org/fhir/restful-interaction#search "search"
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
* agent[user].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP "information recipient"
* agent[user].who.display = "John Smith" // just a display name pulled from the OAuth token
* agent[user].requestor = true
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what = Reference(Patient/ex-patient)
* entity[query].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[query].role = http://terminology.hl7.org/CodeSystem/object-role#24 "Query"
* entity[query].description = """
GET test.fhir.org/r4/Observation?patient=ex-patient&_lastUpdated=gt2020-11-06T21:52:30.300Z&_sort=_lastUpdated&_count=10
Accept: application/fhir+json; fhirVersion=4.0
X-Request-Id: cc6d168e-5871-11ec-bf63-0242ac130002
"""
* entity[query].query = "R0VUIHRlc3QuZmhpci5vcmcvcjQvT2JzZXJ2YXRpb24/cGF0aWVudD1leC1wYXRpZW50Jl9sYXN0VXBkYXRlZD1ndDIwMjAtMTEtMDZUMjE6NTI6MzAuMzAwWiZfc29ydD1fbGFzdFVwZGF0ZWQmX2NvdW50PTEwCkFjY2VwdDogYXBwbGljYXRpb24vZmhpcitqc29uOyBmaGlyVmVyc2lvbj00LjAKWC1SZXF1ZXN0LUlkOiBjYzZkMTY4ZS01ODcxLTExZWMtYmY2My0wMjQyYWMxMzAwMDI="
* entity[transaction].type = BasicAuditEntityType#XrequestId
* entity[transaction].what.identifier.value = "cc6d168e-5871-11ec-bf63-0242ac130002"




/////////////////////////////////////////////////////////////////////////////////////////
Instance: ex-auditBasicQueryGetClient
InstanceOf: PatientQuery
Title: "Client - Audit Example of a basic patient identifiable Query (GET)"
Description: """
Audit Example for a RESTful Query using GET with a patient subject, recorded by the Client
- recorded by the client
  -  see same event as recorded by the [server](AuditEvent-ex-auditBasicQueryGetServer.html)
- server is FHIR application server defined by ex-device
- client is a computer at myMachine.example.org
- user is John Smith
- query is for an Observation for given patient
- patient is specified
- X-Request-Id is specified 
"""
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #E
* subtype = http://hl7.org/fhir/restful-interaction#search "search"
//* severity = #Informational
* recorded = 2020-04-29T09:49:00.000Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.observer.display = "myMachine.example.org"
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#1 "User Device"
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
* agent[user].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP "information recipient"
* agent[user].who.display = "John Smith" // just a display name pulled from the OAuth token
* agent[user].requestor = true
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what = Reference(Patient/ex-patient)
* entity[query].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[query].role = http://terminology.hl7.org/CodeSystem/object-role#24 "Query"
* entity[query].description = """
GET test.fhir.org/r4/Observation?patient=ex-patient&_lastUpdated=gt2020-11-06T21:52:30.300Z&_sort=_lastUpdated&_count=10
Accept: application/fhir+json; fhirVersion=4.0
X-Request-Id: cc6d168e-5871-11ec-bf63-0242ac130002
"""
* entity[query].query = "R0VUIHRlc3QuZmhpci5vcmcvcjQvT2JzZXJ2YXRpb24/cGF0aWVudD1leC1wYXRpZW50Jl9sYXN0VXBkYXRlZD1ndDIwMjAtMTEtMDZUMjE6NTI6MzAuMzAwWiZfc29ydD1fbGFzdFVwZGF0ZWQmX2NvdW50PTEwCkFjY2VwdDogYXBwbGljYXRpb24vZmhpcitqc29uOyBmaGlyVmVyc2lvbj00LjAKWC1SZXF1ZXN0LUlkOiBjYzZkMTY4ZS01ODcxLTExZWMtYmY2My0wMjQyYWMxMzAwMDI="
* entity[transaction].type = BasicAuditEntityType#XrequestId
* entity[transaction].what.identifier.value = "cc6d168e-5871-11ec-bf63-0242ac130002"







/////////////////////////////////////////////////////////////////////////////////////////
Instance: ex-auditBasicQueryPost
InstanceOf: PatientQuery
Title: "Server - Audit Example of a basic patient identifiable Query (POST)"
Description: """
Audit Example for a RESTful Query using POST with a patient subject, recorded by the server
- recorded by the server
- server is FHIR application server defined by ex-device
- client is a computer at myMachine.example.org
- user is John Smith
- query is for an Observation for given patient
- patient is specified
"""
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #E
* subtype = http://hl7.org/fhir/restful-interaction#search-type "search-type"
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
* agent[user].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP "information recipient"
* agent[user].who.display = "John Smith" // just a display name pulled from the OAuth token
* agent[user].requestor = true
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what = Reference(Patient/ex-patient)
* entity[query].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[query].role = http://terminology.hl7.org/CodeSystem/object-role#24 "Query"
* entity[query].description = """
POST /r4/Observation/_search HTTP/1.1
Host: test.fhir.org
Content-Type: application/x-www-form-urlencoded
Accept: application/fhir+json; fhirVersion=4.0
Content-Length: 87

patient=ex-patient&_lastUpdated=gt2020-11-06T21:52:30.300Z&_sort=_lastUpdated&_count=10
"""
* entity[query].query = "UE9TVCAvcjQvT2JzZXJ2YXRpb24vX3NlYXJjaCBIVFRQLzEuMQpIb3N0OiB0ZXN0LmZoaXIub3JnCkNvbnRlbnQtVHlwZTogYXBwbGljYXRpb24veC13d3ctZm9ybS11cmxlbmNvZGVkCkFjY2VwdDogYXBwbGljYXRpb24vZmhpcitqc29uOyBmaGlyVmVyc2lvbj00LjAKQ29udGVudC1MZW5ndGg6IDg3CgpwYXRpZW50PWV4LXBhdGllbnQmX2xhc3RVcGRhdGVkPWd0MjAyMC0xMS0wNlQyMTo1MjozMC4zMDBaJl9zb3J0PV9sYXN0VXBkYXRlZCZfY291bnQ9MTAKCgoK"



