
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
{:.grid}

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
| ~subject:subject-id          | agent[user].extension[otherId].identifier.value
| ~subject:npi                 | agent[user].extension[otherId].identifier.value
| ~subject:provider-identifier | agent[user].extension[otherId].identifier.value
| ~subject:organization        | agent[org].who.display
| ~subject:organization-id     | agent[org].who.identifier.value
| ~bppc:2007:docid             | entity[consent].what.identifier.value 
| ~xua:2012:acp                | entity[consent].detail.valueString 
| ~homeCommunityId             | entity[consent].what.identifier.assigner.identifier.value 
| ~resource:resource-id        | entity[consent-patient].what.identifier.value 
{:.grid}
"""
// Defined in minimal [user]
// * agent[user].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP "information recipient"
* agent[user].extension contains OtherId named otherId 0..*
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
* entity[consent].what 1..1 // consent identifier
* entity[consent].what ^short = "consent" 
//TODO not sure how to put the consent-patient in such that it doesn't conflict with the patient


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
* #SAML-subject-id "SAML subject-id"

ValueSet: OtherIdentifierTypesVS
Title: "Other Id Types ValueSet"
Description: "ValueSet of the Other Id Types allowed"
* OtherIdentifierTypes#SAML-subject-id
* http://terminology.hl7.org/CodeSystem/v2-0203#NPI
* http://terminology.hl7.org/CodeSystem/v2-0203#PRN