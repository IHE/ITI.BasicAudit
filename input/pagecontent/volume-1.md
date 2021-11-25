
The Basic Audit Log Pattern (BasicAudit) Content Profile defines some basic and reusable AuditEvent patterns. 

The Audit Log Patterns defined here rely on the [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html) Profile for transport of the AuditEvent and query/retrival of AuditEvents previously recorded. 
The patterns defined here may be used as they are, or further refined to specific use-cases. 

Where a more specific audit event is defined, it should be derived off of these basic patterns. Thus a more specific AuditEvent would be compliant with one or more of the AuditEvent patterns defined here.

This implementation guide is intended to be fully compliant with the HL7 [FHIR](http://hl7.org/fhir/) specification, providing only use-case driven constraints to aid with interoperability, deterministic results, and compatibility with ATNA and other IHE Profiles.

## 1:52.1 BasicAudit Actors and Content

Figure 52.1-1 shows the actors directly involved in the Basic Audit Log Pattern Profile and the relevant transactions between them. Note that the actors in this profile are the same as the actors defined in the ATNA Profile [ITI TF-1: 9.1](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html).
<div>
{%include ActorsAndTransactions.svg%}
</div>
<br clear="all">

**Figure 52.1: BasicAudit Actor Diagram**

Table 52.1-1: BasicAudit; Profile - Actors and Transactions

| Actors                  | Transactions              | Initiator or Responder | Optionality| Reference|
|-------------------------|---------------------------|:----------------------:|:----------:|----------|
| ANY Secure Client       | ANY request/response      | Initiator | R | <any>  |
| ANY Secure Client       | Record Audit Event        | Initiator | R | ITI-20 |
| ANY Secure Server       | ANY request/response      | Responder | R | <any>  |
| ANY Secure Server       | Record Audit Event        | Initiator | R | ITI-20 |
| Audit Record Repository | Record AuditEvent         | Responder | R | ITI-20 |
| Audit Record Repository | Retrieve ATNA Audit Event | Responder | R | ITI-81 |
| Audit Consumer          | Retrieve ATNA Audit Event | Initiator | R | ITI-81 |
| Data 
{:.grid}



### 1:52.1.1 Actor Descriptions and Actor Profile Requirements

#### 1:52.1.1.1 ANY Secure Client

ANY Secure Client represent abstractions of any client actor grouped with an ATNA Secure Node or an ATNA Secure Application supporting the ATX: FHIR Feed Option. Where ANY Secure Client is involved in an auditable event that is described in this Implementation Guide and for which some AuditEvent pattern is defined. The AuditEvent patterns defined here will be created and recorded (ITI-20) by the ANY Secure Client and the ANY Secure Server. The double recording enables forensic analysis to detect failures better. The double recording will be different as the the AuditEvent.source would identify the actor recording the event. Some actors will be able to populate the AuditEvent pattern given more fully, the lack of an element being populated is not a defect but rather indicates that the actor did not have access to that data. 

#### 1:52.1.1.2 ANY Secure Server

ANY Secure Server represent abstractions of any server actor grouped with an ATNA Secure Node or an ATNA Secure Application supporting the ATX: FHIR Feed Option. Where ANY Secure Server is involved in an auditable event that is described in this Implementation Guide and for which some AuditEvent pattern is defined. The AuditEvent patterns defined here will be created and recorded (ITI-20) by the ANY Secure Client and the ANY Secure Server. The double recording enables forensic analysis to detect failures better. The double recording will be different as the the AuditEvent.source would identify the actor recording the event. Some actors will be able to populate the AuditEvent pattern given more fully, the lack of an element being populated is not a defect but rather indicates that the actor did not have access to that data. 

#### 1:52.1.1.3 ATNA Audit Record Repository

The Audit Record Repository shown is not specialized, it is the ATNA Audit Record Repository with support for ATNA ATX:FHIR Feed Option, and Retrieve Audit Message Option.

#### 1:52.1.1.4 ATNA Audit Consumer

The Audit Consumer shown is an ATNA Audit Consumer actor that understands and uses the AuditEvent patterns defined here.

## 1:52.2 BasicAudit Actor Options

Each AuditEvent pattern defined here can be declared by an ANY Secure Client, ANY Secure Server, or Audit Consumer.


## 1:52.3 BasicAudit Required Actor Grouping

TODO: not clear what to say here or how to say it.

The actors shown in the Implementation Guide are already defined by ATNA. 

The Security Considerations page describes some optional groupings that may be of interest for security considerations.

Cross-Profile Considerations describes some optional groupings in other related profiles.

## 1:52.4 BasicAudit Overview

### 1:52.4.1 Concepts
The BasicAudit implementation guide provides reusable AuditEvent patterns that can be used directly, or combined, or as derivation material for a more specific AuditEvent. 

### 1:52.4.2 Use Cases

#### 1:52.4.2.1 General pattern

##### 1:52.4.2.1.1 Data access requests produce an AuditEvent

<div>
{%include usecase1-processflow.svg%}
</div>
<br clear="all">

**Figure: Audit log event creation**

#### 1:52.4.2.1.2 AuditEvents are available to authorized clients

<div>
{%include usecase2-processflow.svg%}
</div>
<br clear="all">

**Figure: Audit Use**


#### 1:52.4.2.2 Use Case #1: Generic AuditEvent pattern for FHIR RESTful operations

Given the http RESTful operations of Create, Read, Update, Delete, and Search; the patterns defined here will capture sufficient information for audit analysis by an Audit Consumer actor

#### 1:52.4.2.3 Use Case #2: Security token enhancement pattern 

Given that a security relevant event is being recorded, for example Generic FHIR RESTful operations, and where a security token is known that descrbes the client and possibly the human. 

#### 1:52.4.2.4 Use Case #3: Privacy relevant event

Given that a privacy relevant event is being recorded.

## 1:52.5 BasicAudit Security Considerations

This profile does not define any transactions. This profile defines AuditEvent patterns to be used when a more specific AuditEvent pattern is defined. 

In some cases this profile has defined a minimally-populated AuditEvent that is focused on recording identifiers with no descriptive or replication. The minimally-populated AuditEvent helps preserve privacy of the data, actors, and events recorded in the AuditEvent. The minimally-populated AuditEvent is expected to be used by an audit log using agent that has knowledge of the source material for these identifiers, and has access rights to use those source materials. For example, recording a Practitioner id, without recording the Practitioner name or other elements recorded in the Practitioner resource; where audit log analysis would use an organization directory where that identitifier can be looked up to find the full details of the Practitioner.

TODO: Should a minimally populated or maximum populated AuditEvent have a defiend .meta.security so as to be more able to be access controlled at the Audit Consumer API?

## 1:52.6 BasicAudit Cross-Profile Considerations

This profile defines some AuditEvent patterns for use when there is not a more specific AuditEvent pattern defined. Thus when grouped with an IHE Profile that has defined an AuditEvent (AuditMessage) pattern, that more specific pattern defined in the grouped IHE Profile shall be used.

The patterns defined here might be used as profiling parent to a more specific defined AuditEvent.


