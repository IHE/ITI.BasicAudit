
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
* category = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #R
* code = http://hl7.org/fhir/restful-interaction#read "read"
//* severity = #Informational
* recorded = 2020-04-29T09:49:00.000Z
* outcome.code = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site.display = "server.example.com"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[server].type = DCM#110153 "Source Role ID"
* agent[server].requestor = false
* agent[server].who = Reference(Device/ex-device)
* agent[server].networkUri = "http://server.example.com/fhir"

* agent[client].type = DCM#110152 "Destination Role ID"
* agent[client].requestor = false
* agent[client].who.display = "myMachine.example.org"
* agent[client].networkUri = "http://2001:0db8:85a3:0000:0000:8a2e:0370:7334"

* agent[user].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP "information recipient"
* agent[user].who.display = "John Smith" // just a display name pulled from the OAuth token
* agent[user].requestor = true

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
* category = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #R
* code = http://hl7.org/fhir/restful-interaction#read "read"
//* severity = #Informational
* recorded = 2020-04-29T09:49:00.000Z
* outcome.code = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site.display = "server.example.com"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[server].type = DCM#110153 "Source Role ID"
* agent[server].requestor = false
* agent[server].who = Reference(Device/ex-device)
* agent[server].networkUri = "http://server.example.com/fhir"

* agent[client].type = DCM#110152 "Destination Role ID"
* agent[client].requestor = false
* agent[client].who.display = "myMachine.example.org"
* agent[client].networkUri = "http://2001:0db8:85a3:0000:0000:8a2e:0370:7334"

* agent[user].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP "information recipient"
* agent[user].who.display = "John Smith" // just a display name pulled from the OAuth token
* agent[user].requestor = true

* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what = Reference(Patient/ex-patient)

* entity[data].role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
* entity[data].what = Reference(List/ex-list)

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
* category = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #R
* code = http://hl7.org/fhir/restful-interaction#read "read"
//* severity = #Informational
* recorded = 2020-04-29T09:49:00.000Z
* outcome.code = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.observer.display = "myMachine.example.org"
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#1 "User Device"
* agent[server].type = DCM#110153 "Source Role ID"
* agent[server].requestor = false
* agent[server].who = Reference(Device/ex-device)
* agent[server].networkUri = "http://server.example.com/fhir"

* agent[client].type = DCM#110152 "Destination Role ID"
* agent[client].requestor = false
* agent[client].who.display = "myMachine.example.org"
* agent[client].networkUri = "http://2001:0db8:85a3:0000:0000:8a2e:0370:7334"

* agent[user].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP "information recipient"
* agent[user].who.display = "John Smith" // just a display name pulled from the OAuth token
* agent[user].requestor = true

* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what = Reference(Patient/ex-patient)

* entity[data].role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
* entity[data].what = Reference(List/ex-list)

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
* category = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #R
* code = http://hl7.org/fhir/restful-interaction#read "read"
//* severity = #Informational
* recorded = 2020-04-29T09:49:00.000Z
* outcome.code = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site.display = "server.example.com"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[server].type = DCM#110153 "Source Role ID"
* agent[server].requestor = false
* agent[server].who = Reference(Device/ex-device)
* agent[server].networkUri = "http://server.example.com/fhir"

* agent[client].type = DCM#110152 "Destination Role ID"
* agent[client].requestor = false
* agent[client].who.display = "myMachine.example.org"
* agent[client].networkUri = "http://2001:0db8:85a3:0000:0000:8a2e:0370:7334"


* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what = Reference(Patient/ex-patient)

* entity[data].role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
* entity[data].what = Reference(List/ex-list)

* entity[transaction].what.identifier.value = "c07cf648-f068-4dd9-9411-8e69ca07d525"


/////////////////////////////////////////////////////////////////////////////////////////
Instance: ex-auditBasicReadOClient
InstanceOf: OAUTHaccessTokenUseOpaque
Title: "oAuth Client - Audit Example of a basic patient identifiable read"
Description: """
Audit Example for a oAuth authorized RESTful read of a resource with a patient subject

- This example is otherwise the same as [client](AuditEvent-ex-auditBasicReadClient.html) 
- client logs using the OAUTHaccessTokenUseOpaque profile as it doesn't have access to the details
"""
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* category = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #R
* code = http://hl7.org/fhir/restful-interaction#read "read"
//* severity = #Informational
* recorded = 2020-04-29T09:49:00.000Z
* outcome.code = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.observer.display = "myMachine.example.org"
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#1 "User Device"
* agent[oUser].type = UserAgentTypes#UserOauthAgent
* agent[oUser].who.display = "JohnSmith" // just a display name pulled from the OAuth token
* agent[oUser].requestor = true
* agent[oUser].policy = "C187CC480FAC40A0936902D8BC324F5F"
// TODO sushi hack to use one index number, then +=
* agent[+].type = DCM#110153 "Source Role ID"
* agent[=].requestor = false
* agent[=].who = Reference(Device/ex-device)
* agent[=].networkUri = "http://server.example.com/fhir"

* agent[+].type = DCM#110152 "Destination Role ID"
* agent[=].requestor = false
* agent[=].who.display = "myMachine.example.org"
* agent[=].networkUri = "http://2001:0db8:85a3:0000:0000:8a2e:0370:7334"


* entity[+].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[=].what = Reference(Patient/ex-patient)

* entity[+].role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
* entity[=].what = Reference(List/ex-list)

* entity[+].what.identifier.value = "76d148b6-586d-11ec-bf63-0242ac130002"

/////////////////////////////////////////////////////////////////////////////////////////
Instance: ex-auditBasicReadOServer
InstanceOf: OAUTHaccessTokenUseComprehensive
Title: "oAuth Server - Audit Example of a basic patient identifiable read"
Description: """
Audit Example for a oAuth authorized RESTful read of a resource with a patient subject

- This example is otherwise the same as [server](AuditEvent-ex-auditBasicReadServer.html)
- server has access to the oAuth token details so uses IUAaccessOAUTHaccessTokenUseComprehensiveTokenUse profile
- TODO. Sushi has issues that prevent me from including all the agent entries, so this just has the agent entries for the oAuth profile and not the Read profile
  - should also be a Destination and Source agent
"""
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* category = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #R
* code = http://hl7.org/fhir/restful-interaction#read "read"
//* severity = #Informational
* recorded = 2020-04-29T09:49:00.000Z
* outcome.code = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site.display = "server.example.com"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[oClient].type = http://dicom.nema.org/resources/ontology/DCM#110150 "Application"
* agent[oClient].who.identifier.value = "SampleApp"
* agent[oClient].networkUri = "http://2001:0db8:85a3:0000:0000:8a2e:0370:7334"

* agent[oClient].requestor = false
* agent[oUser].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP "information recipient"
* agent[oUser].who.display = "JohnSmith" // just a display name pulled from the OAuth token
* agent[oUser].who.identifier.system = "http://localhost:5100"
* agent[oUser].who.identifier.value = "35fb1058-7f36-415b-b862-677a37c95f35"
* agent[oUser].requestor = true
* agent[oUser].policy = "C187CC480FAC40A0936902D8BC324F5F"
// TODO sushi hack to use one index number, then +=
* agent[+].type = DCM#110152 "Destination Role ID"
* agent[=].requestor = false
* agent[=].who.display = "myMachine.example.org"
* agent[=].networkUri = "http://2001:0db8:85a3:0000:0000:8a2e:0370:7334"

* agent[+].type = DCM#110153 "Source Role ID"
* agent[=].requestor = false
* agent[=].who = Reference(Device/ex-device)
* agent[=].networkUri = "http://server.example.com/fhir"


* entity[+].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[=].what = Reference(Patient/ex-patient)

* entity[+].role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
* entity[=].what = Reference(List/ex-list)

* entity[+].what.identifier.value = "76d148b6-586d-11ec-bf63-0242ac130002"

/////////////////////////////////////////////////////////////////////////////////////////
Instance: ex-auditBasicReadOServerMin
InstanceOf: OAUTHaccessTokenUseMinimal
Title: "oAuth Server Minimal - Audit Example of a basic patient identifiable read"
Description: """
Audit Example for minimally recorded oAuth authorized RESTful read of a resource with a patient subject

- This example is otherwise the same as [server](AuditEvent-ex-auditBasicReadServer.html)
- server has access to the oAuth token details but policy requests minimal recorded so uses IUAaccessOAUTHaccessTokenUseMinimalTokenUse profile
- TODO. Sushi has issues that prevent me from including all the agent entries, so this just has the agent entries for the oAuth profile and not the Read profile
  - should also be a Destination and Source agent
"""
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* category = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #R
* code = http://hl7.org/fhir/restful-interaction#read "read"
//* severity = #Informational
* recorded = 2020-04-29T09:49:00.000Z
* outcome.code = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site.display = "server.example.com"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[oUser].type = UserAgentTypes#UserOauthAgent
* agent[oUser].requestor = true
* agent[oUser].who.display = "User"
* agent[oUser].policy = "C187CC480FAC40A0936902D8BC324F5F"
// TODO sushi hack to use one index number, then +=
* agent[+].type = DCM#110153 "Source Role ID"
* agent[=].requestor = false
* agent[=].who = Reference(Device/ex-device)
* agent[=].networkUri = "http://server.example.com/fhir"

* agent[+].type = DCM#110152 "Destination Role ID"
* agent[=].requestor = false
* agent[=].who.display = "myMachine.example.org"
* agent[=].networkUri = "http://2001:0db8:85a3:0000:0000:8a2e:0370:7334"


* entity[+].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[=].what = Reference(Patient/ex-patient)

* entity[+].role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
* entity[=].what = Reference(List/ex-list)

* entity[+].what.identifier.value = "76d148b6-586d-11ec-bf63-0242ac130002"



