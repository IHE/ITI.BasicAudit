// Imported these from PIXm: Changed the InstanceOf to the BasicAudit profiles (thus needed to change the slice names)
// needed to change the .type and add an additional .subtype

Instance: ex-auditPixmQuery-consumer
InstanceOf: IHE.BasicAudit.PatientQuery
Title: "Audit Example of ITI-83 at Consumer"
Description: "Audit Event for PIXm Query Transaction ITI-83 by the Patient Identifier Cross-reference Consumer"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
// BasicAudt - 1 - type and subtype
//* type = http://dicom.nema.org/resources/ontology/DCM#110112 "Query"
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #E
* subtype[+] = http://hl7.org/fhir/restful-interaction#search "search"
* subtype[+] = urn:ihe:event-type-code#ITI-83 "Mobile Patient Identifier Cross-reference Query"
//* severity = #Informational
* recorded = 2021-07-13T19:17:32Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site = "fancy mobile app"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#1 "User Device"
* agent[+].type = DCM#110153 "Source Role ID"
* agent[=].who = Reference(Device/ex-device)
* agent[=].requestor = false
* agent[=].network.address = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* agent[=].network.type = http://hl7.org/fhir/network-type#2 "IP Address"
// not clear how a server uses the IUA Oauth token here
* agent[+].type = DCM#110152 "Destination Role ID"
* agent[=].who.display = "http://server.example.com/fhir"
* agent[=].requestor = false
* agent[=].network.address = "http://server.example.com/fhir"
* agent[=].network.type = http://hl7.org/fhir/network-type#5 "URI"
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what.identifier.system = "urn:oid:1.3.6.1.4.1.21367.13.20.1000"
* entity[patient].what.identifier.value = "IHERED-994"
* entity[query].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[query].role = http://terminology.hl7.org/CodeSystem/object-role#24 "Query"
* entity[query].query = "aHR0cHM6Ly9zZXJ2ZXIuZXhhbXBsZS5jb20vZmhpci9QYXRpZW50LyRpaGUtcGl4P3NvdXJjZUlkZW50aWZpZXI9dXJuOm9pZDoxLjMuNi4xLjQuMS4yMTM2Ny4xMy4yMC4xMDAwfElIRVJFRC05OTQmdGFyZ2V0U3lzdGVtPXVybjpvaWQ6MS4zLjYuMS40LjEuMjEzNjcuMTMuMjAuMzAwMA=="
// https://server.example.com/fhir/Patient/$ihe-pix?sourceIdentifier=urn:oid:1.3.6.1.4.1.21367.13.20.1000|IHERED-994&targetSystem=urn:oid:1.3.6.1.4.1.21367.13.20.3000

Instance: ex-auditPixmQuery-manager
InstanceOf: IHE.BasicAudit.PatientQuery
Title: "Audit Example of ITI-83 at Manager"
Description: "Audit Event for PIXm Query Transaction ITI-83 by the Patient Identifier Cross-reference Manager"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
// BasicAudt - 1 - type and subtype
//* type = http://dicom.nema.org/resources/ontology/DCM#110112 "Query"
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #E
* subtype[+] = http://hl7.org/fhir/restful-interaction#search "search"
* subtype[+] = urn:ihe:event-type-code#ITI-83 "Mobile Patient Identifier Cross-reference Query"
//* severity = #Informational
* recorded = 2021-07-13T19:17:32Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site = "HIE PIXm api example"
* source.observer.display = "http://server.example.com/fhir"
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[+].type = DCM#110153 "Source Role ID"
* agent[=].who = Reference(Device/ex-device)
* agent[=].requestor = false
* agent[=].network.address = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* agent[=].network.type = http://hl7.org/fhir/network-type#2 "IP Address"
// not clear how a server uses the IUA Oauth token here
* agent[+].type = DCM#110152 "Destination Role ID"
* agent[=].who.display = "http://server.example.com/fhir"
* agent[=].requestor = false
* agent[=].network.address = "http://server.example.com/fhir"
* agent[=].network.type = http://hl7.org/fhir/network-type#5 "URI"
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what.identifier.system = "urn:oid:1.3.6.1.4.1.21367.13.20.1000"
* entity[patient].what.identifier.value = "IHERED-994"
* entity[query].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[query].role = http://terminology.hl7.org/CodeSystem/object-role#24 "Query"
* entity[query].query = "aHR0cHM6Ly9zZXJ2ZXIuZXhhbXBsZS5jb20vZmhpci9QYXRpZW50LyRpaGUtcGl4P3NvdXJjZUlkZW50aWZpZXI9dXJuOm9pZDoxLjMuNi4xLjQuMS4yMTM2Ny4xMy4yMC4xMDAwfElIRVJFRC05OTQmdGFyZ2V0U3lzdGVtPXVybjpvaWQ6MS4zLjYuMS40LjEuMjEzNjcuMTMuMjAuMzAwMA=="
// https://server.example.com/fhir/Patient/$ihe-pix?sourceIdentifier=urn:oid:1.3.6.1.4.1.21367.13.20.1000|IHERED-994&targetSystem=urn:oid:1.3.6.1.4.1.21367.13.20.3000
