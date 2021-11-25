

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

Get Authenticated - See IUA ITI-71

Get Access Token - See IUA ITI-72

Use Access Token to secure an activity

TODO: Should there be any difference to the server .agent when https is used vs http?

### 3:5.7.5 Disclosure audit message

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
  