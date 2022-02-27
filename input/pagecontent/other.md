<div markdown="1" class="stu-note">
This section modifies other IHE profiles, and is not a part of the BasicAudit profile. The content here will be incorporated into the target narrative at a future time, usually when BasicAudit goes normative.
</div>

## IHE Technical Frameworks General Introduction Appendix A: Actors

|------------------------------------------------|
| Editor, add the following new or modified Actors definition in the [IHE Technical Frameworks General Introduction Appendix A](https://profiles.ihe.net/GeneralIntro/ch-A.html): |
{:.grid .bg-info}

| Actor                         | Definition                                                                                |
| ----------------------------- | ------------------------------------------------------------------------------------------|
| none |  |
{:.grid .table-striped}

TODO: Not likely there are new actors as this depends on ATNA for the actors and transactions.

## IHE Technical Frameworks General Introduction Appendix B: Transactions

|------------------------------------------------|
| Editor, add the following new or modified transactions to the [IHE Technical Frameworks General Introduction Appendix B](https://profiles.ihe.net/GeneralIntro/ch-B.html): |
{:.grid .bg-info}


| Transaction                              | Definition                                                                              |
| ---------------------------------------- | --------------------------------------------------------------------------------------- |
| none |  |
{:.grid .table-striped}

TODO: Not likely there are new transactions as this depends on ATNA for actors and transactions.


## AuditEvent use in IHE Implementation Guides

In general IHE Profiles should have "Security Considerations" sections in both Volume 1 and in Volume 2. In Volume 2 the Security Considerations section should have a definition of how the AuditEvent is filled out when the given transaction happens. This definition usually includes one specification of an AuditEvent to be created by each of the actors involved in the transaction.

All of the AuditEvent (AuditMessage) encodings can be found on [Gazelle AuditTrail section](https://gazelle.ihe.net/gss/audit-messages/list.seam;jsessionid=O8kPo08QmPxFgrWZQbhfzfTr). These specifications usually use a table format. These are in the format of DICOM AuditMessage, but the mapping to FHIR AuditEvent is defined in the [FHIR AuditEvent mapping to DICOM](http://hl7.org/fhir/auditevent-mappings.html#dicom).

The IHE ITI-18 transaction has prototyped the documentation change to use the gazelle method rather than using a table. See the (XDS) Registry Stored Query Transaction [2:3.18.5 Security Considerations](https://profiles.ihe.net/ITI/TF/Volume2/ITI-18.html#3.18.5).

### IG Publisher

Some of the IHE Profiles are being converted to using the IG Publisher. When this is done, the AuditEvent is "profiled" using the FHIR StructureDefinition and Examples are provided for each.

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

The [QEDm](https://wiki.ihe.net/index.php?title=Query_for_Existing_Data_for_Mobile_(QEDm)) Implementation Guide has not yet defined AuditEvent profiles. So it should derive off the [Patient Query](StructureDefinition-IHE.BasicAudit.PatientQuery.html) profile, likely with an [OAuth use](StructureDefinition-IHE.BasicAudit.IUAaccessTokenUse.html) profile.



