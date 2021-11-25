

### 3:5.7.1 Scope

All but Delete are following a similar pattern of the initiator (client) of the RESTful interaction is identified as the Source Role ID, where the responder (server) is the Destination Role ID. This pattern is found in DICOM and XDS. This may not be as clear as would be favored. It is possible to deviate from that pattern and use Application and Custodian. This deviation should be carefully considered.

### 3:5.7.2 Content

The following AuditEvent patterns are defined.

#### 3:5.7.2.1 RESTful activities


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

#### 3:5.7.2.2 Security Token

Get Authenticated - See IUA ITI-71

Get Access Token - See IUA ITI-71

Use Access Token
