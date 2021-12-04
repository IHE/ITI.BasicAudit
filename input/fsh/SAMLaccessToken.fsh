
Profile:        SAMLaccessTokenUseMinimal
Parent:         AuditEvent
Id:             ITI.BasicAudit.SAMLaccessTokenUse.Minimal
Title:          "Basic AuditEvent pattern for when an activity was authorized by an SAML access token Minimal"
Description:    """
A basic AuditEvent profile for when an activity was authorized by an SAML access token. This profile is expected to be used with some other detail that explains the activity. This profile only covers the SAML access token.

* Given an activity has occurred
* And SAML is used to authorize a transaction
* And the given activity is using the SAML
  * XUA 
  * SAML requires ID and Issuer, so this profile of AuditEvent will work with any SAML token.
  * usually SOAP, but not limited to SOAP
* When an AuditEvent is recorded for the activity
* Presumes that the consent and server have been identified in agent elements, best case with certificate identities
* Then that AuditEvent would follow this profile regarding recording the SAML access token details

| SAML attribute        | FHIR AuditEvent Minimal
|-----------------------|----------------------|
| ID                    | agent[user].policy
| Issuer                | agent[user].who.identifier.system
| Subject.NameID        | agent[user].who.identifier.value
| ~subject:role         | agent[user].role
| ~subject:purposeofuse | agent[user].purposeOfUse

note: this profile records minimal information from the SAML access token, which presumes that use of the AuditEvent at a later time will be able to resolve the given information.
"""
* agent ^slicing.discriminator.type = #pattern
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #open
* agent contains 
    user 1..
* agent[user].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP "information recipient"
* agent[user].who 1..1 
* agent[user].who.identifier.system 1..1 MS
* agent[user].who.identifier.system ^short = "SAML Issuer"
* agent[user].who.identifier.value 1..1 MS
* agent[user].who.identifier.value ^short = "SAML Subject.NameID"
* agent[user].requestor = true
* agent[user].role MS 
* agent[user].role ^short = "SAML subject:role(s)"
* agent[user].altId 0..0 // discouraged
* agent[user].name 0..1 // not sure where you would get it from
* agent[user].location 0..0 // discouraged as unlikely to be known in this scenario
* agent[user].policy MS
* agent[user].policy ^short = "SAML token ID"
* agent[user].media 0..0 // media is physical storage media identification
* agent[user].network 0..0 // users are not network devices
* agent[user].purposeOfUse MS 
* agent[user].purposeOfUse ^short = "SAML subject:purposeofuse"


Instance: ex-auditPoke-SAML-Min
InstanceOf: ITI.BasicAudit.SAMLaccessTokenUse.Minimal
Title: "Audit Example of a basic SAML access token of minimal"
Description: """
Example AuditEvent showing just the minimal SAML access token. The event being recorded is a theoretical **poke** (not intended to represent anything useful).

Minimal only records the SAML assertion id, issuer, and subject. Minimal may record roles and purposeOfUse if known. Minimal presumes you have access to the SAML Identity Provider (IDP) to reverse lookup given this information.

SAML | example value |
-----|-----|
Subject.NameID  | "05086900124" 
Issuer | "https://sts.sykehuspartner.no" 
ID | "XC4WdYS0W5bjsMGc5Ue6tClD_5U" 
"""
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = DCM#110100 "Application Activity"
* action = #R
* subtype = urn:ietf:rfc:1438#poke "Boredom poke"
//* severity = #Informational
* recorded = 2021-12-03T09:49:00.000Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site = "server.example.com"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[user].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP "information recipient"
* agent[user].who.identifier.value = "05086900124"
* agent[user].who.identifier.system = "https://sts.sykehuspartner.no"
* agent[user].policy = "XC4WdYS0W5bjsMGc5Ue6tClD_5U"




Profile:        SAMLaccessTokenUseComprehensive
Parent:         SAMLaccessTokenUseMinimal
Id:             ITI.BasicAudit.SAMLaccessTokenUse.Comprehensive
Title:          "Basic AuditEvent pattern for when an activity was authorized by an SAML access token Comprehensive"
Description:    """
A basic AuditEvent profile for when an activity was authorized by an SAML access token. This profile is expected to be used with some other detail that explains the activity. This profile only covers the SAML access token.

* Builds upon the Minimal

| SAML attribute               | FHIR AuditEvent Comprehensive 
|------------------------------|-----------------------------------|
| ...  | ...
| ~subject:subject-id          | agent[user].extension[otherId][subject-id].identifier.value
| ~subject:npi                 | agent[user].extension[otherId][npi].identifier.value
| ~subject:provider-identifier | agent[user].extension[otherId][provider-id].identifier.value
| ~subject:organization        | agent[org].who.display
| ~subject:organization-id     | agent[org].who.identifier.value
| ~bppc:2007:docid             | entity[consent].what.identifier.value 
| ~homeCommunityId             | entity[consent].what.identifier.assigner.identifier.value 
| ~xua:2012:acp                | entity[consent].detail.valueString 
| ~resource:resource-id        | entity[consent-patient].what.identifier.value 
"""
// Defined in minimal [user]
// * agent[user].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP "information recipient"
* agent.extension contains OtherId named otherId 0..*
* agent[user].extension[otherId] ^slicing.discriminator.type = #pattern
* agent[user].extension[otherId] ^slicing.discriminator.path = "valueReference.identifier.type"
* agent[user].extension[otherId] ^slicing.rules = #open
* agent[user].extension[otherId] contains 
	subject-id 0..1 and
	npi 0..1 and
	provider-id 0..1
* agent[user].extension[otherId][subject-id].valueReference.identifier.type = OtherIdentifierTypes#SAML-subject-id
* agent[user].extension[otherId][subject-id].valueReference.identifier.value 1..1 MS
* agent[user].extension[otherId][subject-id].valueReference.identifier.value ^short = "SAML Attribute subject-id"
* agent[user].extension[otherId][npi].valueReference.identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#NPI
* agent[user].extension[otherId][npi].valueReference.identifier.value 1..1 MS
* agent[user].extension[otherId][npi].valueReference.identifier.value ^short = "SAML Attribute npi"
* agent[user].extension[otherId][provider-id].valueReference.identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#PRN
* agent[user].extension[otherId][provider-id].valueReference.identifier.value 1..1 MS
* agent[user].extension[otherId][provider-id].valueReference.identifier.value ^short = "SAML Attribute provider-identifier"
* agent ^slicing.discriminator.type = #pattern
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #open
* agent contains 
	org 0..1
* agent[org].type = http://terminology.hl7.org/CodeSystem/v3-RoleClass#PROV "healthcare provider"
// note that there might need to be different types when other organation types get involved, but somehow the SAML would need to indicate it is not a healthcare provider org.
* agent[org].who.display 1..1 MS
* agent[org].who.display ^short = "SAML Attribute urn:oasis:names:tc:xspa:1.0:subject:organization"
* agent[org].who.identifier.value 1..1 MS
* agent[org].who.identifier.value ^short = "SAML Attribute urn:oasis:names:tc:xspa:1.0:subject:organization-id"
* agent[org].requestor = false
* agent[org].role 0..0
* agent[org].altId 0..0 // discouraged
* agent[org].name 0..0 
* agent[org].location 0..0 // discouraged as unlikely to be known in this scenario
* agent[org].policy 0..0
* agent[org].media 0..0 // media is physical storage media identification
* agent[org].network 0..0 // users are not network devices
* agent[org].purposeOfUse 0..0
* entity ^slicing.discriminator.type = #pattern
* entity ^slicing.discriminator.path = "type"
* entity ^slicing.rules = #open
* entity contains 
	consent 0..1
* entity[consent].type = http://hl7.org/fhir/resource-types#Consent "Consent"
* entity[consent].what.identifier 0..1 MS // consent identifier
* entity[consent].what.identifier ^short = "BPPC Patient Privacy Policy Acknowledgement Document unique id" 
* entity[consent].what.identifier.assigner.identifier.value 0..1 MS
* entity[consent].what.identifier.assigner.identifier.value ^short = "homeCommunityId of the Consent"

* entity[consent].detail ^slicing.discriminator.type = #value
* entity[consent].detail ^slicing.discriminator.path = "type"
* entity[consent].detail ^slicing.rules = #open
* entity[consent].detail contains 
	acp 0..1 and
	patient-id 0..1
* entity[consent].detail[acp].type = "urn:ihe:iti:xua:2012:acp"
* entity[consent].detail[acp].valueString 1..1 MS
* entity[consent].detail[acp].valueString ^short = "Home Community ID where the Consent is."
* entity[consent].detail[patient-id].type = "urn:oasis:names:tc:xacml:2.0:resource:resource-id"
* entity[consent].detail[patient-id].valueString 1..1 MS
* entity[consent].detail[patient-id].valueString ^short = "The Patient Identity where the Consent is."



Instance: ex-auditPoke-SAML-Comp
InstanceOf: ITI.BasicAudit.SAMLaccessTokenUse.Comprehensive
Title: "Audit Example of a basic SAML access token of comprehensive"
Description: """
Example AuditEvent showing just the comprehensive SAML access token. The event being recorded is a theoretical **poke** (not intended to represent anything useful).

Comprehensive is different than Minimal in that it presumes that when the AuditEvent is used, the appropriate use of the AuditEvent does not have access to the SAML Idenity Provider (IDP), or that the IDP may have forgotten about the issued ID.

* Builds upon the Minimal

SAML | example value |
-----|-----|
Subject.NameID  | "05086900124" 
Issuer | "https://sts.sykehuspartner.no" 
ID | "XC4WdYS0W5bjsMGc5Ue6tClD_5U" 
purposeOfUse | "http://terminology.hl7.org/CodeSystem/v3-ActReason#PATRQT"
~subject:subject-id          | "JohnDoe"
~subject:npi                 | "1234567@myNPIregistry.example.org"
~subject:provider-identifier | "JohnD"
~subject:organization        | "St. Mary of Examples"
~subject:organization-id     | "1234567@myOrganizationRegistry.example.org"
~bppc:2007:docid             | "urn:uuid:a4b1d27e-5493-11ec-bf63-0242ac130002" 
~xua:2012:acp                | "urn:uuid:b8aa8eec-5493-11ec-bf63-0242ac130002"
~homeCommunityId             | "urn:uuid:cadbf8d0-5493-11ec-bf63-0242ac130002" 
~resource:resource-id        | "urn:uuid:d7391e5a-5493-11ec-bf63-0242ac130002"
"""
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = DCM#110100 "Application Activity"
* action = #R
* subtype = urn:ietf:rfc:1438#poke "Boredom poke"
//* severity = #Informational
* recorded = 2021-12-03T09:49:00.000Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site = "server.example.com"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[user].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP "information recipient"
* agent[user].who.identifier.value = "05086900124"
* agent[user].who.identifier.system = "https://sts.sykehuspartner.no"
* agent[user].policy = "XC4WdYS0W5bjsMGc5Ue6tClD_5U"
* agent[user].purposeOfUse = http://terminology.hl7.org/CodeSystem/v3-ActReason#PATRQT
* agent[user].extension[otherId][subject-id].valueReference.identifier.type = OtherIdentifierTypes#SAML-subject-id
* agent[user].extension[otherId][subject-id].valueReference.identifier.value = "JohnDoe"
* agent[user].extension[otherId][npi].valueReference.identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#NPI
* agent[user].extension[otherId][npi].valueReference.identifier.value = "1234567@myNPIregistry.example.org"
* agent[user].extension[otherId][provider-id].valueReference.identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#PRN
* agent[user].extension[otherId][provider-id].valueReference.identifier.value = "JohnD"
* agent[org].type = http://terminology.hl7.org/CodeSystem/v3-RoleClass#PROV "healthcare provider"
* agent[org].who.display = "St. Mary of Examples"
* agent[org].who.identifier.value = "1234567@myOrganizationRegistry.example.org"
* agent[org].requestor = false
* entity[consent].type = http://hl7.org/fhir/resource-types#Consent "Consent"
* entity[consent].what.identifier.value = "urn:uuid:a4b1d27e-5493-11ec-bf63-0242ac130002"
* entity[consent].what.identifier.assigner.identifier.value = "urn:uuid:cadbf8d0-5493-11ec-bf63-0242ac130002"
* entity[consent].detail[+].type = "urn:ihe:iti:xua:2012:acp"
* entity[consent].detail[=].valueString = "urn:uuid:b8aa8eec-5493-11ec-bf63-0242ac130002"
* entity[consent].detail[+].type = "urn:oasis:names:tc:xacml:2.0:resource:resource-id"
* entity[consent].detail[=].valueString = "urn:uuid:d7391e5a-5493-11ec-bf63-0242ac130002"







Profile:        SAMLaccessTokenUseComprehensiveNorway
Parent:         SAMLaccessTokenUseComprehensive
Id:             ITI.BasicAudit.SAMLaccessTokenUse.Comprehensive.Norway
Title:          "Basic AuditEvent pattern for when an activity was authorized by an SAML access token Comprehensive Norway"
Description:    """
A basic AuditEvent profile for when an activity was authorized by an SAML access token. This profile is expected to be used with some other detail that explains the activity. This profile only covers the SAML access token.

* Builds upon the Comprehensive

Norway SAML attributes | AuditEvent element 
----|---- 
**subject** | **user**
subject:id | AuditEvent.agent[user].who.identifier.value
Subject:name | AuditEvent.agent[user].who.display
subject:system | AuditEvent.agent[user].who.identifier.system
subject:assigner | AuditEvent.agent[user].who.identifier.assigner
**qualifications** | 
subject:qualification:id | AuditEvent.agent[user].alt-userid[qualification].identifier.value
subject:qualification:name | AuditEvent.agent[user].alt-userid[qualification].name
subject:qualification:system | AuditEvent.agent[user].alt-userid[qualification].identifier.system
subject:qualification:assigner | AuditEvent.agent[user].alt-userid[qualification].identifier.assigner

"""
// Defined in minimal [user]
// * agent[user].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP 
// Defined in comprehensive [org]
// * agent[org].type = http://terminology.hl7.org/CodeSystem/v3-RoleClass#PROV "healthcare provider"




Extension: OtherId
Id: ihe-otherId
Title: "AuditEvent.agent other identifiers"
Description: "Carries other identifiers are known for an agent."
* value[x] only Reference


CodeSystem:  OtherIdentifierTypes 
Title: "OtherId Identifier Types"
Description:  "OtherId Types beyond those in the FHIR core"
* ^caseSensitive = true
* #SAML-subject-id "SAML subject-id"

ValueSet: OtherIdentifierTypesVS
Title: "Other Id Types ValueSet"
Description: "ValueSet of the Other Id Types allowed"
* OtherIdentifierTypes#SAML-subject-id
* http://terminology.hl7.org/CodeSystem/v2-0203#NPI
* http://terminology.hl7.org/CodeSystem/v2-0203#PRN