
Profile:        SAMLaccessTokenUseComprehensiveNorway
Parent:         SAMLaccessTokenUseComprehensive
Id:             ITI.BasicAudit.SAMLaccessTokenUse.Comprehensive.Norway
Title:          "Basic AuditEvent pattern for when an activity was authorized by an SAML access token Comprehensive Norway"
Description:    """
A basic AuditEvent profile for when an activity was authorized by an SAML access token. This profile is expected to be used with some other detail that explains the activity. This profile only covers the SAML access token.

**Builds upon the Comprehensive**

Norway SAML attributes | AuditEvent element 
----|---- 
**subject** | **user**
subject:id | AuditEvent.agent[user].who.identifier.value
Subject:name | AuditEvent.agent[user].who.display
subject:system | AuditEvent.agent[user].who.identifier.system
subject:assigner | AuditEvent.agent[user].who.identifier.assigner
**PurposeOfEvent** | **AuditEvent.purposeOfEvent**
purpose:id | AuditEvent.purposeOfEvent.coding.code
purpose:name | AuditEvent.purposeOfEvent.coding.display
purpose:system | AuditEvent.purposeOfEvent.coding.system
purpose:assigner | N/A eller ekstensjon
purpose:description | AuditEvent.purposeOfEvent.text
purpose:reason | ????
**PurposeOfEvent-local** | **AuditEvent.agent[user].purposeOfUse**
purpose-local:id | AuditEvent.agent[user].purposeOUse.coding.code
purpose-local:name | AuditEvent.agent[user].purposeOfUse.coding.display
purpose-local:system | AuditEvent.agent[user].purposeOfUse.coding.system
purpose-local:assigner | N/A eller ekstensjon
purpose-local:description | ?
purpose-local:reason | ?
purpose-local:userSelected | AuditEvent.agent.purposeOfUse.coding.userSelected
**qualifications** | **hso:subject:qualification:id**
subject:qualification:id | AuditEvent.agent[user].extension[otherId][qualification].identifier.value
subject:qualification:name | AuditEvent.agent[user].extension[otherId][qualification].name
subject:qualification:system | AuditEvent.agent[user].extension[otherId][qualification].identifier.system
subject:qualification:assigner | AuditEvent.agent[user].extension[otherId][qualification].identifier.assigner
**nationalidentifiers** | **hso:subject:national-identifier:id**
subject:national-identifier:id | AuditEvent.agent[user].extension[otherId][personal].identifier.value
subject:national-identifier:name | AuditEvent.agent[user].extension[otherId][personal].name
subject:national-identifier:system | AuditEvent.agent[user].extension[otherId][personal].identifier.system
subject:national-identifier:assigner | AuditEvent.agent[user].extension[otherId][personal].identifier.assigner

"""
* purposeOfEvent 1..* MS
* purposeOfEvent ^short = "saml hso:purpose"
* purposeOfEvent.text ^short = "SAML hso:purpose:description"
* purposeOfEvent.coding.code ^short = "SAML hso:purpose:id"
* purposeOfEvent.coding.display ^short = "SAML hso:purpose:name"
* purposeOfEvent.coding.system ^short = "SAML hso:purpose:system"
* agent[user].who.display MS
* agent[user].who.display ^short = "subject:name"
* agent[user].purposeOfUse 1..* MS
* agent[user].purposeOfUse ^short = "saml hso:purpose-local"
* agent[user].purposeOfUse.text ^short = "SAML hso:purpose-local:description"
* agent[user].purposeOfUse.coding.code ^short = "SAML hso:purpose-local:id"
* agent[user].purposeOfUse.coding.display ^short = "SAML hso:purpose-local:name"
* agent[user].purposeOfUse.coding.system ^short = "SAML hso:purpose-local:system"
// setup slice for qualifications
* agent[user].extension[otherId] ^slicing.discriminator.type = #pattern
* agent[user].extension[otherId] ^slicing.discriminator.path = "valueReference.identifier.type"
* agent[user].extension[otherId] ^slicing.rules = #open
* agent[user].extension[otherId] contains 
	qualifications 0..1 and
	personal 0..1 
* agent[user].extension[otherId][qualifications].valueReference.identifier.type = NorwayIdentifierTypes#qualification
* agent[user].extension[otherId][qualifications].valueReference.identifier.system 1..1 MS
* agent[user].extension[otherId][qualifications].valueReference.identifier.system ^short = "subject:qualification:system"
* agent[user].extension[otherId][qualifications].valueReference.identifier.value 1..1 MS
* agent[user].extension[otherId][qualifications].valueReference.identifier.value ^short = "subject:qualification:id"
* agent[user].extension[otherId][qualifications].valueReference.display 1..1 MS
* agent[user].extension[otherId][qualifications].valueReference.display ^short = "subject:qualification:name"
* agent[user].extension[otherId][qualifications].valueReference.identifier.assigner.identifier.system 1..1 MS
* agent[user].extension[otherId][qualifications].valueReference.identifier.assigner.identifier.system ^short = "subject:qualification:assigner"
* agent[user].extension[otherId][personal].valueReference.identifier.type = NorwayIdentifierTypes#national-identifier
* agent[user].extension[otherId][personal].valueReference.identifier.system 1..1 MS
* agent[user].extension[otherId][personal].valueReference.identifier.system ^short = "subject:national-identifier:system"
* agent[user].extension[otherId][personal].valueReference.identifier.value 1..1 MS
* agent[user].extension[otherId][personal].valueReference.identifier.value ^short = "subject:national-identifier:id"
* agent[user].extension[otherId][personal].valueReference.display 1..1 MS
* agent[user].extension[otherId][personal].valueReference.display ^short = "subject:national-identifier:name"
* agent[user].extension[otherId][personal].valueReference.identifier.assigner.identifier.system 1..1 MS
* agent[user].extension[otherId][personal].valueReference.identifier.assigner.identifier.system ^short = "subject:national-identifier:assigner"



CodeSystem: NorwayIdentifierTypes
Title: "OtherId types for Norway Identifiers"
Description: "mostly derived off of the SAML attribute name. The code display name is the SAML attribute name."
* ^caseSensitive = false
* #qualification "urn:hso:subject:qualification:id"
* #national-identifier "urn:hso:subject:national-identifier:id"







Instance: ex-auditPoke-Norway
InstanceOf: ITI.BasicAudit.SAMLaccessTokenUse.Comprehensive.Norway
Title: "Audit Example of a Norway SAML access token of comprehensive"
Description: """
Example AuditEvent showing just the Norway comprehensive SAML access token. The event being recorded is a theoretical **poke** (not intended to represent anything useful).

Comprehensive is different than Minimal in that it presumes that when the AuditEvent is used, the appropriate use of the AuditEvent does not have access to the SAML Idenity Provider (IDP), or that the IDP may have forgotten about the issued ID.

**Builds upon the Minimal**

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
hso:purpose:id | "1"
hso:purpose:name | N/A
hso:purpose:system | "1.0.14265.1"
hso:purpose:descrption | "Oppslag via kjernejournal, helsehjelp"
hso:purpose:assigner | "http://dips.com"
hso:purpose-local:id | "KONSSERIE"
hso:purpose-local:name | "Åpen konsultasjonsserie"
hso:purpose-local:system | "http://dips.com/beslutningsmal"
hso:purpose-local:descrption | "Åpen konsultasjonsserie til Barn og unges psykiske helse på sykehus, Barn og unges psykiske helse på sykehus, serie starttidspunkt 28.10.2014"
hso:purpose-local:assigner | "https://www.iso.org/standard/54547.html"
hso:purpose-local:userSelected | False
subject:qualification:id | "222200068"
subject:qualification:name | "BEN PSA REDDIK"
subject:qualification:system | "2.16.578.1.12.4.1.4.4"
subject:qualification:assigner | "https://register.helsedirektoratet.no/hpr"
**nationalidentifiers** | 
subject:national-identifier:id | "05086900124"
subject:national-identifier:name | "BEN PSA REDDIK"
subject:national-identifier:system | "urn:oid:2.16.578.1.12.4.1.4.1"
subject:national-identifier:assigner | "https://www.skatteetaten.no/person/folkeregister/"

Note: does not include IHE-XUA attributes for BPPC/ACP/homeCommunitId/resource-id
"""
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = DCM#110100 "Application Activity"
* action = #R
* subtype = urn:ietf:rfc:1438#poke "Boredom poke"
//* severity = #Informational
* recorded = 2021-12-03T09:49:00.000Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* purposeOfEvent.coding.code = urn:oid:1.0.14265.1#1
* purposeOfEvent.text = "Oppslag via kjernejournal, helsehjelp"
* source.site = "server.example.com"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[user].type.coding[+] = UserAgentTypes#UserSamlAgent
* agent[user].type.coding[+] = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP "information recipient"
* agent[user].who.identifier.value = "05086900124"
* agent[user].who.identifier.system = "https://sts.sykehuspartner.no"
* agent[user].policy = "XC4WdYS0W5bjsMGc5Ue6tClD_5U"
* agent[user].purposeOfUse = http://terminology.hl7.org/CodeSystem/v3-ActReason#PATRQT
* agent[user].purposeOfUse = http://dips.com/beslutningsmal#KONSSERIE "Åpen konsultasjonsserie"
* agent[user].purposeOfUse.text = "Åpen konsultasjonsserie til Barn og unges psykiske helse på sykehus, Barn og unges psykiske helse på sykehus, serie starttidspunkt 28.10.2014"
* agent[user].purposeOfUse.coding.userSelected = false
//TODO This throws an error in validation that I can't figure out https://chat.fhir.org/#narrow/stream/215610-shorthand/topic/slicing.20an.20extension.20on.20a.20slice
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

* agent[user].extension[otherId][qualifications].valueReference.identifier.type = NorwayIdentifierTypes#qualification
* agent[user].extension[otherId][qualifications].valueReference.identifier.system = "urn:oid:2.16.578.1.12.4.1.4.4"
* agent[user].extension[otherId][qualifications].valueReference.identifier.value = "222200068"
* agent[user].extension[otherId][qualifications].valueReference.display = "BEN PSA REDDIK"
* agent[user].extension[otherId][qualifications].valueReference.identifier.assigner.identifier.system = "https://register.helsedirektoratet.no/hpr"
* agent[user].extension[otherId][personal].valueReference.identifier.type = NorwayIdentifierTypes#national-identifier
* agent[user].extension[otherId][personal].valueReference.identifier.system = "urn:oid:2.16.578.1.12.4.1.4.1"
* agent[user].extension[otherId][personal].valueReference.identifier.value = "05086900124"
* agent[user].extension[otherId][personal].valueReference.display = "BEN PSA REDDIK"
* agent[user].extension[otherId][personal].valueReference.identifier.assigner.identifier.system = "https://www.skatteetaten.no/person/folkeregister/"





