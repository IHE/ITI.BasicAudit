

Instance: ex-auditBasicQuery
InstanceOf: PatientQuery
Title: "Audit Example of a basic patient identifiable Query"
Description: "Audit Example for a RESTful Query of a resource with a patient subject"
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
* entity[query].name = "test.fhir.org/r4/AuditEvent?_lastUpdated=gt2020-11-06T21:52:30.300Z&_sort=_lastUpdated&_format=json&_count=10"
* entity[query].query = "dGVzdC5maGlyLm9yZy9yNC9BdWRpdEV2ZW50P19sYXN0VXBkYXRlZD1ndDIwMjAtMTEtMDZUMjE6NTI6MzAuMzAwWiZfc29ydD1fbGFzdFVwZGF0ZWQmX2Zvcm1hdD1qc29uJl9jb3VudD0xMA=="

Instance: ex-auditBasicQuery1
InstanceOf: PatientQuery
Title: "Audit Example of a basic patient identifiable Query"
Description: "Audit Example for a RESTful Query of a resource with a patient subject"
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
* entity[query].name = "test.fhir.org/r4/AuditEvent?_lastUpdated=gt2020-11-06T21:52:30.300Z&_sort=_lastUpdated&_format=json&_count=10"
* entity[query].query = "dGVzdC5maGlyLm9yZy9yNC9BdWRpdEV2ZW50P19sYXN0VXBkYXRlZD1ndDIwMjAtMTEtMDZUMjE6NTI6MzAuMzAwWiZfc29ydD1fbGFzdFVwZGF0ZWQmX2Zvcm1hdD1qc29uJl9jb3VudD0xMA=="

Instance: ex-auditBasicQuery2
InstanceOf: PatientQuery
Title: "Audit Example of a basic patient identifiable Query"
Description: "Audit Example for a RESTful Query of a resource with a patient subject"
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
* entity[query].name = "test.fhir.org/r4/AuditEvent?_lastUpdated=gt2020-11-06T21:52:30.300Z&_sort=_lastUpdated&_format=json&_count=10"
* entity[query].query = "dGVzdC5maGlyLm9yZy9yNC9BdWRpdEV2ZW50P19sYXN0VXBkYXRlZD1ndDIwMjAtMTEtMDZUMjE6NTI6MzAuMzAwWiZfc29ydD1fbGFzdFVwZGF0ZWQmX2Zvcm1hdD1qc29uJl9jb3VudD0xMA=="



Instance: ex-auditBasicQueryNoUser
InstanceOf: PatientQuery
Title: "Audit Example of a basic patient identifiable Query with no user"
Description: "Audit Example for a RESTful Query of a resource with a patient subject with no user. This might be a B2B exchange where the OAuth token just identifies the requesting organization."
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
* entity[query].name = "test.fhir.org/r4/AuditEvent?_lastUpdated=gt2020-11-06T21:52:30.300Z&_sort=_lastUpdated&_format=json&_count=10"
* entity[query].query = "dGVzdC5maGlyLm9yZy9yNC9BdWRpdEV2ZW50P19sYXN0VXBkYXRlZD1ndDIwMjAtMTEtMDZUMjE6NTI6MzAuMzAwWiZfc29ydD1fbGFzdFVwZGF0ZWQmX2Zvcm1hdD1qc29uJl9jb3VudD0xMA=="

