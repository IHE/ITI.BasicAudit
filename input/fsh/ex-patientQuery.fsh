

Instance: ex-auditBasicQueryGet
InstanceOf: PatientQuery
Title: "Server - Audit Example of a basic patient identifiable Query (GET)"
Description: "Audit Example for a RESTful Query (GET) of a resource with a patient subject.
- as recorded by the server
- a FHIR GET query of  
  - `test.fhir.org/r4/AuditEvent?_lastUpdated=gt2020-11-06T21:52:30.300Z&_sort=_lastUpdated&_format=json&_count=10`
- by client on an IPv6 network
- patient is specified
- user is specified
"
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
* agent[human].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP "information recipient"
* agent[human].who.display = "John Smith" // just a display name pulled from the OAuth token
* agent[human].requestor = true
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what = Reference(Patient/ex-patient)
* entity[query].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[query].role = http://terminology.hl7.org/CodeSystem/object-role#24 "Query"
* entity[query].name = "GET test.fhir.org/r4/AuditEvent?_lastUpdated=gt2020-11-06T21:52:30.300Z&_sort=_lastUpdated&_format=json&_count=10"
* entity[query].query = "R0VUIHRlc3QuZmhpci5vcmcvcjQvQXVkaXRFdmVudD9fbGFzdFVwZGF0ZWQ9Z3QyMDIwLTExLTA2VDIxOjUyOjMwLjMwMFomX3NvcnQ9X2xhc3RVcGRhdGVkJl9mb3JtYXQ9anNvbiZfY291bnQ9MTA="

Instance: ex-auditBasicQueryPost
InstanceOf: PatientQuery
Title: "Server - Audit Example of a basic patient identifiable Query (POST)"
Description: "Audit Example for a RESTful Query (POST) of a resource with a patient subject.
- as recorded by the server
- a FHIR POST query of  
  - `POST test.fhir.org/r4/AuditEvent?_lastUpdated=gt2020-11-06T21:52:30.300Z\n\n_sort=_lastUpdated&_format=json&_count=10`
- by client on an IPv6 network
- patient is specified
- user is specified
"
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
* agent[human].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP "information recipient"
* agent[human].who.display = "John Smith" // just a display name pulled from the OAuth token
* agent[human].requestor = true
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what = Reference(Patient/ex-patient)
* entity[query].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[query].role = http://terminology.hl7.org/CodeSystem/object-role#24 "Query"
* entity[query].name = """
POST test.fhir.org/r4/AuditEvent?_lastUpdated=gt2020-11-06T21:52:30.300Z

_sort=_lastUpdated&_format=json&_count=10
"""
* entity[query].query = "UE9TVCB0ZXN0LmZoaXIub3JnL3I0L0F1ZGl0RXZlbnQ/X2xhc3RVcGRhdGVkPWd0MjAyMC0xMS0wNlQyMTo1MjozMC4zMDBaCgpfc29ydD1fbGFzdFVwZGF0ZWQmX2Zvcm1hdD1qc29uJl9jb3VudD0xMA=="

Instance: ex-auditBasicQueryGetClient
InstanceOf: PatientQuery
Title: "Client - Audit Example of a basic patient identifiable Query"
Description: "Audit Example for a RESTful Query of a resource with a patient subject
- as recorded by the client
- a FHIR GET query of  
  - `test.fhir.org/r4/AuditEvent?_lastUpdated=gt2020-11-06T21:52:30.300Z&_sort=_lastUpdated&_format=json&_count=10`
- by client on an IPv6 network
- patient is specified
- user is specified
"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #E
* subtype = http://hl7.org/fhir/restful-interaction#search-system "search-system"
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
* agent[human].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP "information recipient"
* agent[human].who.display = "John Smith" // just a display name pulled from the OAuth token
* agent[human].requestor = true
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what = Reference(Patient/ex-patient)
* entity[query].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[query].role = http://terminology.hl7.org/CodeSystem/object-role#24 "Query"
* entity[query].name = "GET test.fhir.org/r4/AuditEvent?_lastUpdated=gt2020-11-06T21:52:30.300Z&_sort=_lastUpdated&_format=json&_count=10"
* entity[query].query = "R0VUIHRlc3QuZmhpci5vcmcvcjQvQXVkaXRFdmVudD9fbGFzdFVwZGF0ZWQ9Z3QyMDIwLTExLTA2VDIxOjUyOjMwLjMwMFomX3NvcnQ9X2xhc3RVcGRhdGVkJl9mb3JtYXQ9anNvbiZfY291bnQ9MTA="



Instance: ex-auditBasicQueryNoUser
InstanceOf: PatientQuery
Title: "Audit Example of a basic patient identifiable Query with no user"
Description: "Audit Example for a RESTful Query of a resource with a patient subject with no user. 
- This might be a B2B exchange where the OAuth token just identifies the requesting organization.
- as recorded by the server
- a FHIR GET query of  
  - `test.fhir.org/r4/AuditEvent?_lastUpdated=gt2020-11-06T21:52:30.300Z&_sort=_lastUpdated&_format=json&_count=10`
- by client on an IPv6 network
- patient is NOT specified
- user is specified
"
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
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what = Reference(Patient/ex-patient)
* entity[query].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[query].role = http://terminology.hl7.org/CodeSystem/object-role#24 "Query"
* entity[query].name = "GET test.fhir.org/r4/AuditEvent?_lastUpdated=gt2020-11-06T21:52:30.300Z&_sort=_lastUpdated&_format=json&_count=10"
* entity[query].query = "R0VUIHRlc3QuZmhpci5vcmcvcjQvQXVkaXRFdmVudD9fbGFzdFVwZGF0ZWQ9Z3QyMDIwLTExLTA2VDIxOjUyOjMwLjMwMFomX3NvcnQ9X2xhc3RVcGRhdGVkJl9mb3JtYXQ9anNvbiZfY291bnQ9MTA=

