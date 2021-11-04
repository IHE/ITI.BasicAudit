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




# background


#### Data using Client

Requesting application in a REST relationship with the Server.

Note that the Client may also record the appropriate AuditEvent into the Audit-Repository. For security use-cases it is very helpful for the client to record the AuditEvent too, as this sets up a pattern of normal operation that can be watched for deviations. Deviations such as the client stopping audit logging should be investigated, a possible cause is that the client credentials have been stolen and are being used by another application than the one authorized.

#### Data Server

Responding server that holds the data the Client is requesting thru REST. Server records the appropriate AuditEvent into the Audit-Repository.

#### Audit Repository

FHIR repository holding the AuditEvents created, and provides access to the AuditEvents to Audit-Clients. The Audit-Repository would typically not allow Update or Delete of any AuditEvent previously recorded. Thus only allowing Create, and Read of AuditEvents.

Note that the Audit-Repository may be the same system as the Server.

#### Audit using Client

A Client that retrieves AuditEvents for some functionality. Where the functionality is not constrained or defined here. The Audit-Client queries AuditEvents for a given Patient.

### Activities to be recorded

REST Activities

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

### Use-Case

#### Data access requests produce an AuditEvent

<div>
{%include usecase1-processflow.svg%}
</div>
<br clear="all">

**Figure: Audit log event creation**

#### AuditEvents are available to authorized clients

<div>
{%include usecase2-processflow.svg%}
</div>
<br clear="all">

**Figure: Audit Use**


### Test Plan
Overall test plan leverages the Profiles, and Examples shown on the [Artifacts Summary](artifacts.html). The [Profiles](artifacts.html#structures-resource-profiles) listed are describing the constraints that would be adhered to by Actors claiming conformance to this implementation guide. Thus any Resources that are known to have been published by an app MUST be conformant to these profiles.

The Examples listed in [Example Instances](artifacts.html#example-example-instances) are example instances. Some are conformant to the profiles. Other examples that either assist with the structure of the examples (e.g. Patient and Encounter) or are examples that  should be able to handle in various ways. 

See the Test Plan for each Profile to understand the specific expectations for each good, odd, and bad example.

### Cucumber Actions
The following Actions are defined for use in the Cucumber scripts

TODO....

#### Initialized

**Preconditions**

Service is operational and has no known defects that would affect the test.

Test-Patient is created or known to have no data that would affect the test.

#### Load X into Server

This action is used to initialize a test, it is not expected to fail. So a failure is a fundamental failure, not an indication of the system-under-test.

GIVEN FHIR Resource X from this Implementation Guide

ACTION:

1. load X into the test tool
1. update the patient to the Test-Patient id under test
1. update the effectiveDateTime to **now**
1. POST the resource into the Server
1. continue if successful, if error then break out of test plan

## AuditEvent use documentation in products


### Fire.Ly

https://docs.fire.ly/firelyserver/features/auditing.html

[Fire.Ly Sandbox with audit logging on](https://server.fire.ly/r4/AuditEvent)

### Grahame's Server

http://test.fhir.org/r4/AuditEvent

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
  - Document Responder
    - [profile](https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.FindDocumentLists.Audit.Responder.html)
	- [examples](https://profiles.ihe.net/ITI/MHD/AuditEvent-ex-auditFindDocumentLists-responder.html)
- [Find Document References \[ITI-67\]](https://profiles.ihe.net/ITI/MHD/ITI-67.html)
  - Document Consumer
    - [profile](https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.FindDocumentReferences.Audit.Consumer.html)
	- [examples](https://profiles.ihe.net/ITI/MHD/AuditEvent-ex-auditFindDocumentReferences-consumer.html)
  - Document Responder
    - [profile](https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.FindDocumentReferences.Audit.Responder.html)
	- [examples](https://profiles.ihe.net/ITI/MHD/AuditEvent-ex-auditFindDocumentReferences-responder.html)
- [Retrieve Document \[ITI-68\]](https://profiles.ihe.net/ITI/MHD/ITI-68.html)  
  - Document Consumer
    - [profile](https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.RetrieveDocument.Audit.Consumer.html)
	- [examples](https://profiles.ihe.net/ITI/MHD/AuditEvent-ex-auditRetrieveDocument-consumer.html)
  - Document Responder
    - [profile](https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.RetrieveDocument.Audit.Responder.html)
	- [examples](https://profiles.ihe.net/ITI/MHD/AuditEvent-ex-auditRetrieveDocument-responder.html)
	
#### PDQm

The [PDQm](https://profiles.ihe.net/ITI/PDQm/index.html) Implementation Guide has the following AuditEvent profiles:
- [Mobile Patient Demographics Query \[ITI-78\]](https://profiles.ihe.net/ITI/PDQm/ITI-78.html)
  - Patient Demographics Consumer
    - [profile](https://profiles.ihe.net/ITI/PDQm/StructureDefinition-IHE.PDQm.Query.Audit.Consumer.html)
    - [example](https://profiles.ihe.net/ITI/PDQm/AuditEvent-ex-auditPdqmQuery-consumer.html)
  - Patient Demographics Supplier
    - [profile](https://profiles.ihe.net/ITI/PDQm/StructureDefinition-IHE.PDQm.Query.Audit.Supplier.html)
    - [example](https://profiles.ihe.net/ITI/PDQm/AuditEvent-ex-auditPdqmQuery-supplier.html)

#### PIXm

The [PIXm](https://profiles.ihe.net/ITI/PIXm/index.html) Implementation Guide has the following AuditEvent profiles:
- [Patient Identity Cross-reference Query \[ITI-83\]](https://profiles.ihe.net/ITI/PIXm/ITI-83.html)
  - Patient Identifier Cross-reference Consumer
    - [profile](https://profiles.ihe.net/ITI/PIXm/StructureDefinition-IHE.PIXm.Query.Audit.Consumer.html)
    - [example](https://profiles.ihe.net/ITI/PIXm/AuditEvent-ex-auditPixmQuery-consumer.html)
  - Patient Identifier Cross-reference Manager
    - [profile](https://profiles.ihe.net/StructureDefinition-IHE.PIXm.Query.Audit.Manager.html)
    - [example](https://profiles.ihe.net/ITI/PIXm/AuditEvent-ex-auditPixmQuery-manager.html)
- [Patient Identitifier Cross-reference Feed \[ITI-104\]](https://profiles.ihe.net/ITI/PIXm/ITI-104.html)
  - Patient Identifier Cross-reference Consumer
    - [profile](https://profiles.ihe.net/ITI/PIXm/StructureDefinition-IHE.PIXm.Feed.Audit.Source.html)
    - [example](https://profiles.ihe.net/ITI/PIXm/AuditEvent-ex-auditPixmFeed-source.html)
  - Patient Identifier Cross-reference Manager
    - [profile](https://profiles.ihe.net/StructureDefinition-IHE.PIXm.Feed.Audit.Manager.html)
    - [example](https://profiles.ihe.net/ITI/PIXm/AuditEvent-ex-auditPixmFeed-manager.html)
