

### 3:5.7.1 Scope

All but Delete are following a similar pattern of the initiator (client) of the RESTful interaction is identified as the Source Role ID, where the responder (server) is the Destination Role ID. This pattern is found in DICOM and XDS. This may not be as clear as would be favored. It is possible to deviate from that pattern and use Application and Custodian. This deviation should be carefully considered.

### 3:5.7.2 Content

The following AuditEvent patterns are defined.

### 3:5.7.3 RESTful activities

When a FHIR RESTful interaction happens, the following AuditEvent patterns can be used. These AuditEvent patterns will typically be combined with the Security Token Use pattern to record one AuditEvent that contains the details of the security context and the FHIR RESTful context.

* [Create (create)](StructureDefinition-ITI.BasicAudit.PatientCreate.html)
  * [examples](StructureDefinition-ITI.BasicAudit.PatientCreate-examples.html)
* [Read (read and vread)](StructureDefinition-ITI.BasicAudit.PatientRead.html)
  * [examples](StructureDefinition-ITI.BasicAudit.PatientRead-examples.html)
* [Update (update, patch)](StructureDefinition-ITI.BasicAudit.PatientUpdate.html)
  * [examples](StructureDefinition-ITI.BasicAudit.PatientUpdate-examples.html)
* [Delete (delete)](StructureDefinition-ITI.BasicAudit.PatientDelete.html)
  * [examples](StructureDefinition-ITI.BasicAudit.PatientDelete-examples.html)
* [Execute (search and query)](StructureDefinition-ITI.BasicAudit.PatientQuery.html)
  * [examples](StructureDefinition-ITI.BasicAudit.PatientQuery-examples.html)

### 3:5.7.4 Security Token

In this section we use the term "Security Token" in a general sense to refer to either (a) a XUA SAML token being used in an [ITI-40](https://profiles.ihe.net/ITI/TF/Volume2/ITI-40.html#3.40), (b) an IUA OAuth Access Token being used in an [ITI-72](https://profiles.ihe.net/ITI/IUA/index.html#372-incorporate-access-token-iti-72), or (c) any other SAML or OAuth Access Token used to secure an Interoperability transaction (e.g. [SMART Backend Services](https://hl7.org/fhir/uv/bulkdata/authorization/index.html#presenting-an-access-token-to-fhir-api), or [SMART App Launch Framework](http://hl7.org/fhir/smart-app-launch/index.html#step-4-app-accesses-clinical-data-via-fhir-api), or other)

This specification presumes that the interactions to obtain the "Security Token" were themselves auditable events and properly recorded in the audit log. 

<div markdown="1" class="stu-note">

TODO: I notice that XUA and IUA did not define the audit event to be recorded when getting the token, just a minimal method to update an activity audit event with a username string. This model might be considered the miniest of minimal, where as here the minimal will be more reliant on ability to lookup token details.
- Get Authenticated - See IUA ITI-71
- Get Access Token - See IUA ITI-72
- XUA does not profile the Get X-User Assertion transaction at all
</div>

There are two patterns defined: minimal, and comprehensive. Where minimal presumes that when the audit log is used, the system using the AuditEvent has access to the security infrastructure registry and logs to lookup the identifiers, thus the details taht could be looked up later are not replicated in the AuditEvent. Comprehensive presumes that there is no access to lookup these details, thus preserving as much of the Security Token into the AuditEvent as is reasonable and useful.

<div markdown="1" class="stu-note">
TODO: Should there be any difference to the server .agent when https is used vs http?
</div>

#### 3:5.7.4.1 SAML 

The [IHE-XUA](https://profiles.ihe.net/ITI/TF/Volume1/ch-13.html) profile defines a SAML Security Token that is used to secure transactions.

##### 3:5.7.4.1.1 SAML Minimal

Follow [XUA](https://profiles.ihe.net/ITI/TF/Volume1/ch-13.html) recommendation to encode a [UserName string](https://profiles.ihe.net/ITI/TF/Volume2/ITI-40.html#3.40.4.2), and place that the ATNA Audit message `UserName` element; and [preserve the PurposeOfUse](https://profiles.ihe.net/ITI/TF/Volume2/ITI-40.html#3.40.4.1.2.3.1). The [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html) specification in use at the writing of [XUA](https://profiles.ihe.net/ITI/TF/Volume1/ch-13.html) was limited to the DICOM AuditMessage. Now that IHE ATNA includes a FHIR AuditEvent model these attributes can be preserved more fully in the .agent.who.identifier element. The XUA specification indicated that the [Subject-Role](https://profiles.ihe.net/ITI/TF/Volume2/ITI-40.html#3.40.4.1.3.1) may be used to populate the Audit Message. (Note also that XUA recommends alias be filled with SPProvidedID which is not defined in XUA andis found to be deprecated in many specifiations)

The Minimal AuditEvent pattern defined here is not the same as the one defined in XUA, mostly due to the more expressive and coded nature of the FHIR AuditEvent.

* [StructureDefinition profile of Basic AuditEvent pattern for when activity was authorized by an SAML access token](StructureDefinition-ITI.BasicAudit.SAMLaccessTokenUse.Minimal.html)
  * [examples](StructureDefinition-ITI.BasicAudit.SAMLaccessTokenUse.Minimal-examples.html)

#### 3:5.7.4.1.2 SAML Comprehensive

This pattern preserves most SAML attributes in the AuditEvent. Not all are preserved as some attributes are proven during the SAML token validation and thus carry no further informtion useful in an AuditEvent (e.g. not before). 

Local policy may choose to record less than are defined here, or may choose to record more. 

For those using SAML beyond XUA, there is no specific guidance here.

* [StructureDefinition profile of Basic AuditEvent pattern for Comprehensive](StructureDefinition-ITI.BasicAudit.SAMLaccessTokenUse.Comprehensive.html)
  * [examples](StructureDefinition-ITI.BasicAudit.SAMLaccessTokenUse.Comprehensive-examples.html)

##### 3:5.7.4.1.3 SAML mapping to AuditEvent

The following table uses a short-hand to keep the table compact. It is presumed the reader can understand the SAML attribute describing and the FHIR AuditEvent describing. (TODO, check this theory)

| SAML attribute               | FHIR AuditEvent Comprehensive     | FHIR AuditEvent Minimal           |
|------------------------------|-----------------------------------|-----------------------------------|
| ID                           | agent[user].policy | agent[user].policy |
| Issuer                       | agent[user].who.identifier.system | agent[user].who.identifier.system |
| SignedInfo                   |   |
| KeyInfo                      |   |
| KeyValue                     |   |
| Subject.NameID               | agent[user].who.identifier.value  | agent[user].who.identifier.value  |
| SubjectConfirmation          |   |
| NotBefore                    |   |
| NotOnOrAfter                 |   |
| AudienceRestrictions         |   |
| ProxyRestrictions            |   |
| OneTimeUser                  |   |
| AuthnContextClassRef         |   |
| AuthnContextDeclRef          |   |
| ~subject:subject-id          | somewhere ? |
| ~subject:organization        | somewhere ? |
| ~subject:organization-id     | somewhere ? |
| ~subject:npi                 | somewhere ? |
| ~subject:provider-identifier | somewhere ? |
| ~subject:role                | agent[user].role | agent[user].role
| ~subject:purposeofuse        | agent[user].purposeOfUse | agent[user].purposeOfUse
| ~bppc:2007:docid             | entity[consent].what.identifier.value |
| ~xua:2012:acp                | entity[consent].detail.valueString |
| ~resource:resource-id        | entity[consent-patient].what.identifier.value |
| ~homeCommunityId             | entity[consent].what.identifier.assigner.identifier.value | 
{:.grid}

Other SAML attributes may be defined, but this specificaiton focuses on XUA attributes only.

#### 3:5.7.4.2 OAuth 

blah blah

<div markdown="1" class="stu-note">
TODO: Question. Given IUA. Why would the ITI-71 not record the token issued, and ITI-72 simply indicate to record the token (as appeared in the bearer header) in the activity audit event as the agent[source/client].who.identifier.value? Note that this is effectively what WILL happen at a web-server. Given that the access_token is a given X.Y.Z; recording just the Y is sufficient, as X and Z are the signature stuff. if you don't save the signature stuff then you are not enabling a replay.

TODO: When IUA SAML token option is used, should the results look just like the SAML AuditEvent?
</div>

##### 3:5.7.4.2.1 OAuth Minimal

Follow IUA like recommendation to create a username string, and place tha tin a .agent

also record the 

##### 3:5.7.4.2.2 OAuth Comprehensive

blah blah 

##### 3:5.7.4.2.3 mapping

IUA ITI-71 Authorization Request

| IUA attribute | AuditEvent element |
|---------------|--------------------|
| clint_id | agent[client].who.identifier.value |
| state | N/A |
| resource | ? |
| code_challenge | N/A |
| code_challenge_method | N/A |
| redirect_uri | N/A |
| scope | ? |
{:.grid}

IUA ITI-71 Access Token Response

| IUA attribute | AuditEvent element |
|---------------|--------------------|
| token_type | ? |
| access_token | ? |
| scope | ? |
| expires_in | ? |
| refresh_token | ? |
| scope | ? |
| code | ? |
{:.grid}

IUA ITI-71 JSON Web Token

| IUA attribute | Description | AuditEvent element |
|---------------|-------------|--------------------|
| iss | JWT Issuer | ? |
| sub | JWT Subject | ? |
| aud | JWT Audience | ? |
| jti | JWT ID | ? |
| exp | JWT Expiration Time | ? |
| nbf | JWT Not before | ? |
| iat | JWT Issued at | ? |
| client_id | OA2 client id | app id | ? |
| scope | OA2 token scope | ? |
| ihe_iua:subject_name 
| ihe_iua:subject_organization
| ihe_iua:subject_organization_id
| ihe_iua:subject_role 
| ihe_iua:purpose_of_use 
| ihe_iua:home_community_id
| ihe_iua:national_provider_identifier
| ihe_iua:person_id
| ihe_bppc:patient_id
| ihe_bppc:doc_id
| ihe_bppc:acp
{:.grid}

### 3:5.7.5 Privacy Disclosure Audit Message

This is transformed from the content defined today in ATNA ITI-20 [2:3.20.8 Disclosure audit message](https://profiles.ihe.net/ITI/TF/Volume2/ITI-20.html#3.20.8). It is replicated here for ease of understanding, and is presented here using the FHIR AuditEvent. There are some differences caused and enabled by the FHIR AuditEvent schema and profiling.

In some countries a Patient has the right to get an accounting of disclosures. This report includes disclosures of their data that meet regulatory criteria. Most audit events, including export events, must be post-analyzed to determine whether they describe an event that needs to be included in the accounting of disclosures. For example, in the USA these rules are defined in [HIPAA](https://www.cdc.gov/phlp/publications/topic/hipaa.html), and only a few kinds of export events meet the criteria to be included in an accounting of disclosures report. When it is known, at the time the event is recorded, that the event is indeed a disclosure, the disclosure audit message can be used to document the event.

The requirements of an accounting of disclosures are defined in [ASTM-2147](https://www.astm.org/e2147-01.html). A disclosure shall include the following, when the value is known:

- Who did the disclosure (the releasing agent), 
- When did the disclosure happen,
- Who was the data disclosed to (receiving agent machine and other parties, if known),
- What patient was involved (multiple patients would be done as multiple audit entries), 
- What data was involved, and 
- Why the disclosure was done 

There is some other information that may be available:

- Who is the custodian of the data (the official organization responsible), and
- Who authorized the release such as a guardian or relative (authorizing agent)?

The following is the layout of the Disclosure audit event. This pattern will be extended and modified by applications when appropriate.

* [Disclosure reported by the Recipient](StructureDefinition-IHE.BasicAudit.PrivacyDisclosure.Recipient.html)
  * [examples](StructureDefinition-IHE.BasicAudit.PrivacyDisclosure.Recipient-examples.html)
* [Disclosure reported by the Source](StructureDefinition-IHE.BasicAudit.PrivacyDisclosure.Source.html)
  * [examples](StructureDefinition-IHE.BasicAudit.PrivacyDisclosure.Source-examples.html)
  