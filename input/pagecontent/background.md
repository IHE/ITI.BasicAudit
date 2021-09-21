
Basic Auditing where there is a known subject of the data involved. This profile is a formal specification of the guidance given in the FHIR Core AuditEvent under [Common Scenarios](http://build.fhir.org/auditevent.html#6.4.4.4)

This guide does not cover all AuditEvents. It does not cover 
* how accesses to data where their is no subject, such as a Provider Directory. Although this is likely similar, just without the mandated Patient entity.
* how failures are recorded. Failures are recorded with the .outcome that is not success, and is thus a very large body of possibilities. Failures are logged with best-effort and with verbose content. This makes the AuditEvent of a failure very hard to characterize, vary hard to automatically process, and possibly exposing of privacy or business secrets. These might be access control denials, which the patient would be interested in but for which it is not clear they would be due these kinds of notices. These might be infrastructural failures, which are too hard to characterize. 

The AuditEvent profiles here could be used as a prototype for a more specific AuditEvent profile in a use-case specific Implementation Guide. Where a use-case specific Implementation Guide defines an AuditEvent profile, those profiles should be used rather than the Basic AuditEvent profiles found here. Both could be recorded without harm.

### Actors

<div>
{%include ActorsAndTransactions.svg%}
</div>

**Figure: Actor Diagram**


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

* [Create (create)](StructureDefinition-Moehrke.PatientCreate.html)
  * [examples](StructureDefinition-Moehrke.PatientCreate-examples.html)
* [Read (read and vread)](StructureDefinition-Moehrke.PatientRead.html)
  * [examples](StructureDefinition-Moehrke.PatientRead-examples.html)
* [Update (update, patch)](StructureDefinition-Moehrke.PatientUpdate.html)
  * [examples](StructureDefinition-Moehrke.PatientUpdate-examples.html)
* [Delete (delete)](StructureDefinition-Moehrke.PatientDelete.html)
  * [examples](StructureDefinition-Moehrke.PatientDelete-examples.html)
* [Execute (search and query)](StructureDefinition-Moehrke.PatientQuery.html)
  * [examples](StructureDefinition-Moehrke.PatientQuery-examples.html)

### Use-Case

#### Data access requests produce an AuditEvent

<div>
{%include usecase1-processflow.svg%}
</div>

**Figure: Audit log event creation**

#### AuditEvents are available to authorized clients

<div>
{%include usecase2-processflow.svg%}
</div>

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
