
Basic Auditing where there is a known subject of the data involved. This profile is a formal specification of the guidance given in the FHIR Core AuditEvent under [Common Scenarios](http://build.fhir.org/auditevent.html#6.4.4.4)

This guide does not cover all AuditEvents. It does not cover 
* how accesses to data where their is no subject, such as a Provider Directory. Although this is likely similar, just without the mandated Patient entity.
* how failures are recorded. Failures are recorded with the .outcome that is not success, and is thus a very large body of possibilities. Failures are logged with best-effort and with verbose content. This makes the AuditEvent of a failure very hard to characterize, vary hard to automatically process, and possibly exposing of privacy or business secrets. These might be access control denials, which the patient would be interested in but for which it is not clear they would be due these kinds of notices. These might be infrastructural failures, which are too hard to characterize. 

### Actors


![Figure: Actor Diagram](ActorsAndTransactions.svg "Figure: Actor Diagram")

<div style="clear: left"/>

**Figure: Actor Diagram**


#### Client

Requesting application in a REST relationship with the Server.

Note that the Client may also record the appropriate AuditEvent into the Audit-Repository. For security use-cases it is very helpful for the client to record the AuditEvent too, as this sets up a pattern of normal operation that can be watched for deviations. Deviations such as the client stopping audit logging should be investigated, a possible cause is that the client credentials have been stolen and are being used by another application than the one authorized.

#### Server

Responding server that holds the data the Client is requesting thru REST. Server records the appropriate AuditEvent into the Audit-Repository.

#### Audit-Repository

FHIR repository holding the AuditEvents created, and provides access to the AuditEvents to Audit-Clients. The Audit-Repository would typically not allow Update or Delete of any AuditEvent previously recorded. Thus only allowing Create, and Read of AuditEvents.

Note that the Audit-Repository may be the same system as the Server.

#### Audit-Client

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

