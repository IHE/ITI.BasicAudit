<div markdown="1" class="stu-note">
This section modifies other IHE profiles, and is not a part of the BasicAudit profile. The content here will be incorporated into the target narrative at a future time, usually when BasicAudit goes normative.
</div>

## IHE Technical Frameworks General Introduction Appendix A – Actor Summary Definitions

|------------------------------------------------|
| Editor, Add the following new or modified Actors definition in the [IHE Technical Frameworks General Introduction Appendix A](https://profiles.ihe.net/GeneralIntro/ch-A.html): |
{:.grid .bg-info}

| Actor                         | Definition                                                                                |
| ----------------------------- | ------------------------------------------------------------------------------------------|
| none | . |
{:.grid .table-striped}

TODO: Not likely there are new Actors as this depends on ATNA for the actors and transactions

## IHE Technical Frameworks General Introduction Appendix B – Transaction Summary Definitions

|------------------------------------------------|
| Editor, Add the following new or modified transactions to the [IHE Technical Frameworks General Introduction Appendix B](https://profiles.ihe.net/GeneralIntro/ch-B.html): |
{:.grid .bg-info}


| Transaction                              | Definition                                                                              |
| ---------------------------------------- | --------------------------------------------------------------------------------------- |
| none | . |
{:.grid .table-striped}

TODO: Not likely there are new Transactions as this depends on ATNA for actors and transactions


## AuditEvent use in IHE Implementation Guides

In general IHE Profiles should have "Security Considerations" sections in both Volume 1 and in Volume 2. In Volume 2 the Security Considerations section should have a definition of how the AuditEvent is filled out when the given transaction happens. This definition usually includes one specification of an AuditEvent to be created by each of the Actors involved in the Transaction.

All of the AuditEvent (AuditMessage) encodings can be found on [Gazelle AuditTrail section](https://gazelle.ihe.net/gss/audit-messages/list.seam;jsessionid=O8kPo08QmPxFgrWZQbhfzfTr). These specifications usually use a table format. These are in the format of DICOM AuditMessage, but the mapping to FHIR AuditEvent is defined in the [FHIR AuditEvent mapping to DICOM](http://hl7.org/fhir/auditevent-mappings.html#dicom).

The IHE ITI-18 transaction has prototyped the documentation change to use the gazelle method rather than using a table. See the (XDS) Registry Stored Query Transaction [2:3.18.5 Security Considerations](https://profiles.ihe.net/ITI/TF/Volume2/ITI-18.html#3.18.5).

### IG Publisher

Some of the IHE Profiles are being converted to using the IG Publisher. When this is done the AuditEvent is "profiled" using the FHIR StructureDefinition, and Examples are provided for each.

#### MHD

The [MHD](https://profiles.ihe.net/ITI/MHD/index.html) Implementation Guide has the following AuditEvent profiles:
- [Provide Document Bundle \[ITI-65\]](https://profiles.ihe.net/ITI/MHD/ITI-65.html)
  - Document Source 
    - [profile](https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.ProvideBundle.Audit.Source.html)
	- [examples](https://profiles.ihe.net/ITI/MHD/AuditEvent-ex-auditProvideBundle-source.html)
  - Document Recipient 
    - [profile](https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.ProvideBundle.Audit.Recipient.html)
	- [examples](https://profiles.ihe.net/ITI/MHD/AuditEvent-ex-auditProvideBundle-recipient.html)
- [Find Document Lists \[ITI-66\]](https://profiles.ihe.net/ITI/MHD/ITI-66.html)
  - Document Consumer
    - [profile](https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.FindDocumentLists.Audit.Consumer.html)
	- [examples](https://profiles.ihe.net/ITI/MHD/AuditEvent-ex-auditFindDocumentLists-consumer.html)
	- [BasicAudit adjusted example](AuditEvent-ex-auditFindDocumentLists-consumer.html)
	  - changed the .type to REST
	  - added an additional .subtype for REST query
  - Document Responder
    - [profile](https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.FindDocumentLists.Audit.Responder.html)
	- [examples](https://profiles.ihe.net/ITI/MHD/AuditEvent-ex-auditFindDocumentLists-responder.html)
	- [BasicAudit adjusted example](AuditEvent-ex-auditFindDocumentLists-responder.html)
	  - changed the .type to REST
	  - added an additional .subtype for REST query
- [Find Document References \[ITI-67\]](https://profiles.ihe.net/ITI/MHD/ITI-67.html)
  - Document Consumer
    - [profile](https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.FindDocumentReferences.Audit.Consumer.html)
	- [examples](https://profiles.ihe.net/ITI/MHD/AuditEvent-ex-auditFindDocumentReferences-consumer.html)
	- [BasicAudit adjusted examples](AuditEvent-ex-auditFindDocumentReferences-consumer.html)
	  - changed the .type to REST
	  - added an additional .subtype for REST query
  - Document Responder
    - [profile](https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.FindDocumentReferences.Audit.Responder.html)
	- [examples](https://profiles.ihe.net/ITI/MHD/AuditEvent-ex-auditFindDocumentReferences-responder.html)
	- [BasicAudit adjusted examples](AuditEvent-ex-auditFindDocumentReferences-responder.html)
	  - changed the .type to REST
	  - added an additional .subtype for REST query
- [Retrieve Document \[ITI-68\]](https://profiles.ihe.net/ITI/MHD/ITI-68.html)  
  - Document Consumer
    - [profile](https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.RetrieveDocument.Audit.Consumer.html)
	- [examples](https://profiles.ihe.net/ITI/MHD/AuditEvent-ex-auditRetrieveDocument-consumer.html)
	- [BasicAudit adjusted examples](AuditEvent-ex-auditRetrieveDocument-consumer.html)
	  - changed the type to REST
	  - added an additional .subtype for REST read
	  - moved Export to a .subtype
	  - changed from Create to Read
  - Document Responder
    - [profile](https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.RetrieveDocument.Audit.Responder.html)
	- [examples](https://profiles.ihe.net/ITI/MHD/AuditEvent-ex-auditRetrieveDocument-responder.html)
	- [BasicAudit adjusted examples](AuditEvent-ex-auditRetrieveDocument-responder.html)
	  - changed the type to REST
	  - added an additional .subtype for REST read
	  - moved Export to a .subtype
	  - changed from Create to Read
	
#### PDQm

The [PDQm](https://profiles.ihe.net/ITI/PDQm/index.html) Implementation Guide has the following AuditEvent profiles:
- [Mobile Patient Demographics Query \[ITI-78\]](https://profiles.ihe.net/ITI/PDQm/ITI-78.html)
  - Patient Demographics Consumer
    - [profile](https://profiles.ihe.net/ITI/PDQm/StructureDefinition-IHE.PDQm.Query.Audit.Consumer.html)
    - [example](https://profiles.ihe.net/ITI/PDQm/AuditEvent-ex-auditPdqmQuery-consumer.html)
    - [BasicAudit adjusted example](AuditEvent-ex-auditPdqmQuery-consumer.html)
	  - changed the .type to REST
	  - added an additional .subtype for REST query  
  - Patient Demographics Supplier
    - [profile](https://profiles.ihe.net/ITI/PDQm/StructureDefinition-IHE.PDQm.Query.Audit.Supplier.html)
    - [example](https://profiles.ihe.net/ITI/PDQm/AuditEvent-ex-auditPdqmQuery-supplier.html)
    - [BasicAudit adjusted example](AuditEvent-ex-auditPdqmQuery-supplier.html)
	  - changed the .type to REST
	  - added an additional .subtype for REST query
	  
#### PIXm

The [PIXm](https://profiles.ihe.net/ITI/PIXm/index.html) Implementation Guide has the following AuditEvent profiles:
- [Patient Identity Cross-reference Query \[ITI-83\]](https://profiles.ihe.net/ITI/PIXm/ITI-83.html)
  - Patient Identifier Cross-reference Consumer
    - [profile](https://profiles.ihe.net/ITI/PIXm/StructureDefinition-IHE.PIXm.Query.Audit.Consumer.html)
    - [example](https://profiles.ihe.net/ITI/PIXm/AuditEvent-ex-auditPixmQuery-consumer.html)
    - [BasicAudit adjusted example](AuditEvent-ex-auditPixmQuery-consumer.html)
	  - changed the .type to REST
	  - added an additional .subtype for REST query  
  - Patient Identifier Cross-reference Manager
    - [profile](https://profiles.ihe.net/StructureDefinition-IHE.PIXm.Query.Audit.Manager.html)
    - [example](https://profiles.ihe.net/ITI/PIXm/AuditEvent-ex-auditPixmQuery-manager.html)
    - [BasicAudit adjusted example](AuditEvent-ex-auditPixmQuery-manager.html)
	  - changed the .type to REST
	  - added an additional .subtype for REST query
- [Patient Identitifier Cross-reference Feed \[ITI-104\]](https://profiles.ihe.net/ITI/PIXm/ITI-104.html)
  - Patient Identifier Cross-reference Consumer
    - [profile](https://profiles.ihe.net/ITI/PIXm/StructureDefinition-IHE.PIXm.Feed.Audit.Source.html)
    - [example](https://profiles.ihe.net/ITI/PIXm/AuditEvent-ex-auditPixmFeed-source.html)
  - Patient Identifier Cross-reference Manager
    - [profile](https://profiles.ihe.net/StructureDefinition-IHE.PIXm.Feed.Audit.Manager.html)
    - [example](https://profiles.ihe.net/ITI/PIXm/AuditEvent-ex-auditPixmFeed-manager.html)

#### QEDm

The [QEDm]() Implementation Guide has not yet defined AuditEvent profiles. So it should derive off the [Patient Query](StructureDefinition-IHE.BasicAudit.PatientQuery.html) profile, likely with an [OAuth use](tbd.html) profile.

## Possible changes to IUA

|------------------------------------------------|
| Editor, Add the following to IUA |
| Given that IUA did not fully defined hte AuditEvents, the following is proposed as potential improvements to IUA. |
{:.grid .bg-info}

<div markdown="1" class="stu-note">

TODO: I notice that IUA did not define the audit event to be recorded when getting the token, just a minimal method to update an activity audit event with a username string. This model might be considered the miniest of minimal, where as here the minimal will be more reliant on ability to lookup token details.
- Get Authenticated - See IUA ITI-71
- Get Access Token - See IUA ITI-72
</div>

Given that IHE has the [IUA profile](https://profiles.ihe.net/ITI/IUA/index.html), the AuditEvent specification here will focus on IUA interactions. The profiling AuditEvent

<div>
{%include IUA-processflow.svg%}
</div>
<br clear="all">

**Figure: OAuth Basic Processing (from IUA Figure 34.4.2.2-1)**

The figure above will be used to understand the following AuditEvent constraints. The Figure is first shown in [IUA as Figure 34.4.2.2-1](https://profiles.ihe.net/ITI/IUA/index.html#34422-process-flow). This is used as a general flow here.

### Get Access Token (ITI-71)

Defined here is the AuditEvent that the Authorization Server could record when successfully (Permit) processing of [IUA](https://profiles.ihe.net/ITI/IUA/index.html) [ITI TF-2: 3.71 Get Access Token \[ITI-71\]](https://profiles.ihe.net/ITI/IUA/index.html#371-get-access-token-iti-71). Which is made up of
- Client Credential grant type - see [ITI TF-2: 3.71.4.1.2.1](https://profiles.ihe.net/ITI/IUA/index.html#3714121-client-credential-grant-type) and [3.71.4.1.3.1](https://profiles.ihe.net/ITI/IUA/index.html#3714131-client-credential-grant-type)
- Authorization Code grant type - see [ITI TF-2: 3.71.4.1.2.2](https://profiles.ihe.net/ITI/IUA/index.html#3714122-authorization-code-grant-type) and [3.71.4.1.3.2](https://profiles.ihe.net/ITI/IUA/index.html#3714132-authorization-code-grant-type)

There is an AuditEvent defined in IUA [3.71.5.1](https://profiles.ihe.net/ITI/IUA/index.html#37151-security-audit-considerations). This [AuditEvent is profiled](StructureDefinition-IHE.IUA.71.html)

TODO: consider defining more AuditEvent profiles for each message in ITI-71.

TODO: consider further refinement of the ITI-71 AuditEvent profile.

### ITI-71 mapping to AuditEvent

TODO: refinement?

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


