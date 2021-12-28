// Imported these from PDQm: Changed the InstanceOf to the BasicAudit profiles (thus needed to change the slice names)
// needed to change the .type and add an additional .subtype

Instance: ex-auditPdqmQuery-consumer
InstanceOf: IHE.BasicAudit.Query
Title: "Audit Example of ITI-78 at Consumer"
Description: """
Audit Event for PDQm Query Transaction by the Patient Identifier Cross-reference Consumer

where the Query was executed with a GET as follows:

```
GET https://server.example.com/fhir/Patient?family=MOHR&given=ALICE&active=true&gender=female
Accept: application/fhir+json; fhirVersion=4.0
```
"""
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
// BasicAudt - 1 - type and subtype
//* type = http://dicom.nema.org/resources/ontology/DCM#110112 "Query"
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #E
* subtype[+] = http://hl7.org/fhir/restful-interaction#search "search"
* subtype[+] = urn:ihe:event-type-code#ITI-78 "Mobile Patient Demographics Query"
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
* entity[query].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[query].role = http://terminology.hl7.org/CodeSystem/object-role#24 "Query"
* entity[query].query = "R0VUIGh0dHBzOi8vc2VydmVyLmV4YW1wbGUuY29tL2ZoaXIvUGF0aWVudD9mYW1pbHk9TU9IUiZnaXZlbj1BTElDRSZhY3RpdmU9dHJ1ZSZnZW5kZXI9ZmVtYWxlCkFjY2VwdDogYXBwbGljYXRpb24vZmhpcitqc29uOyBmaGlyVmVyc2lvbj00LjA="



Instance: ex-auditPdqmQuery-supplier
InstanceOf: IHE.BasicAudit.PatientQuery
Title: "Audit Example of ITI-78 at Supplier"
Description: """
Audit Event for PDQm Query Transaction by the Patient Identifier Cross-reference Supplier

where the Query was executed with a GET as follows:

```
GET https://server.example.com/fhir/Patient?family=MOHR&given=ALICE&active=true&gender=female
Accept: application/fhir+json; fhirVersion=4.0
```

Note the Supplier may choose to record patient identities found, but is not required to.

Given the Supplier chooses to record a patient in the AuditEvent 
When the search finds multiple Patients, 
Then the Supplier would create an AuditEvent for each of those Patients. 

This example shows where ex-patient is returned. This single result does not affect the response returned on the ITI-78 that would include all results.
"""
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
// BasicAudt - 1 - type and subtype
//* type = http://dicom.nema.org/resources/ontology/DCM#110112 "Query"
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #E
* subtype[+] = http://hl7.org/fhir/restful-interaction#search "search"
* subtype[+] = urn:ihe:event-type-code#ITI-78 "Mobile Patient Demographics Query"
//* severity = #Informational
* recorded = 2021-07-13T19:17:32Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site = "HIE PDQm api example"
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
* entity[patient].what = Reference(Patient/ex-patient)
* entity[query].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[query].role = http://terminology.hl7.org/CodeSystem/object-role#24 "Query"
* entity[query].query = "R0VUIGh0dHBzOi8vc2VydmVyLmV4YW1wbGUuY29tL2ZoaXIvUGF0aWVudD9mYW1pbHk9TU9IUiZnaXZlbj1BTElDRSZhY3RpdmU9dHJ1ZSZnZW5kZXI9ZmVtYWxlCkFjY2VwdDogYXBwbGljYXRpb24vZmhpcitqc29uOyBmaGlyVmVyc2lvbj00LjA="

