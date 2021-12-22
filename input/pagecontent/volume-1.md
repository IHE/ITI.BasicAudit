
The Basic Audit Log Pattern (BasicAudit) Content Profile defines some basic and reusable AuditEvent patterns. 

The Audit Log Patterns defined here rely on the [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html) Profile for transport of the AuditEvent and query/retrival of AuditEvents previously recorded. 
The patterns defined here may be used as they are, or further refined to specific use-cases. 

Where a more specific audit event is defined, it should be derived off of these basic patterns. Thus a more specific AuditEvent would be compliant with one or more of the AuditEvent patterns defined here.

This implementation guide is intended to be fully compliant with the HL7 [FHIR](http://hl7.org/fhir/) specification, providing only use-case driven constraints to aid with interoperability, deterministic results, and compatibility with ATNA and other IHE Profiles.

## 1:52.1 BasicAudit Actors and Content

Figure 52.1-1 shows the actors directly involved in the Basic Audit Log Pattern Profile and the relevant transactions between them. Note that the actors in this profile are the same as the actors defined in the [ATNA Profile \[ITI TF-1: 9\]](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html) and [Add RESTful ATNA (Query and Feed) Supplement](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_RESTful-ATNA.pdf).

<div>
{%include ActorsAndTransactions.svg%}
</div>
<br clear="all">

**Figure 52.1: BasicAudit Actor Diagram**

Table 52.1-1: BasicAudit; Profile - Actors and Transactions

| Actors                  | Transactions              | Initiator or Responder | Optionality| Reference|
|-------------------------|---------------------------|:----------------------:|:----------:|----------|
| ANY Secure Client       | ANY request/response      | Initiator | R | <any>  |
| ANY Secure Client       | Record Audit Event        | Initiator | R | [ITI-20](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_RESTful-ATNA.pdf) |
| ANY Secure Server       | ANY request/response      | Responder | R | <any>  |
| ANY Secure Server       | Record Audit Event        | Initiator | R | [ITI-20](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_RESTful-ATNA.pdf) |
| Audit Record Repository | Record AuditEvent         | Responder | R | [ITI-20](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_RESTful-ATNA.pdf) |
| Audit Record Repository | Retrieve ATNA Audit Event | Responder | R | [ITI-81](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_RESTful-ATNA.pdf) |
| Audit Consumer          | Retrieve ATNA Audit Event | Initiator | R | [ITI-81](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_RESTful-ATNA.pdf) |
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

<div markdown="1" class="stu-note">
TODO: likely need an Option named for each AuditEvent pattern (and combinations) defined.
</div>

## 1:52.3 BasicAudit Required Actor Grouping

<div markdown="1" class="stu-note">
TODO: not clear what to say here or how to say it.
</div>

The required groupings for BasicAudit are those in the ATNA Profile, see [IHE ITI TF-1:9.3](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html)

The Security Considerations page describes some optional groupings that may be of interest for security considerations.

Cross-Profile Considerations describes some optional groupings in other related profiles.

## 1:52.4 BasicAudit Overview

### 1:52.4.1 Concepts
The BasicAudit implementation guide provides reusable AuditEvent patterns that can be used directly, or combined, or as derivation material for a more specific AuditEvent. 

##### 1:52.4.1.1 Data access requests produce an AuditEvent

<div>
{%include usecase1-processflow.svg%}
</div>
<br clear="all">

**Figure: Audit log event creation**

#### 1:52.4.1.2 AuditEvents are available to authorized clients

<div>
{%include usecase2-processflow.svg%}
</div>
<br clear="all">

**Figure: Audit Use**

#### 1:52.4.1.3 Minimal vs Comprehensive AuditEvent

There are two sets of patterns defined

##### 1:52.4.1.3.1 Minimal AuditEvent

The minimal AuditEvent pattern should be used whenever possible. The minimal AuditEvent pattern avoids replicating information that can be looked up by any audit analysis application that has access. By placing minimal information into the AuditEvent the size of the AuditEvent is dramatically reduced, and there is less exposure of privacy and security information. 

With minimal AuditEvent the AuditEvent contains identifiers, and not the details such as user identifier, practitioner identifier, organizational identifier, patient identifier, data object identifier, location identifiers, and security token identifier. These identifiers can be looked up using a user directory, practitioner directory, patient directory, data registry, and token introspection. The lookup of these values is further protection of the data behind them, preventing abuse by someone who has access to the AuditEvent log for one purpose gaining knowledge from other AuditEvent records.

With minimal AuditEvent, the AuditEvent contains only the search (aka, query) parameters, and never the results of the search. This too limits the size of the AuditEvent, and the exposure of sensitive results data into the AuditEvent log. The results can be determined by re-executing the search or query, adjusting the results based on the time of the search. 

The minimal AuditEvent does not produce an audit log that is not sensitive, just reduced sensitivity. 

##### 1:52.4.1.3.2 Comprehensive AuditEvent

There are times when the AuditEvent log are used by Audit Consumer actors are known to not have access to some lookup services. In these cases, it is better to record the details into the AuditEvent. For example, where in a Cross-Community setting the details of the user may not be possible to lookup the security token details.

With Comprehensive AuditEvent, the search results might be preserved in the AuditEvent. This will create a very large AuditEvent with mutiply replicated data. So, care should be taken to select the kinds of search where the results are recorded, and these results should be purged regularly to limit the overall impact as the results data tend to be less useful as the AuditEvent ages. 

In Cross-Community settings making full access to all of the needed directory and registry services may not be logictically possible. The counter argument is that when one party has done AuditEvent log analysis and has suspiction based on that analysis, they could use out-of-band methods to request a lookup of an identifier. For example, when the AuditEvent log shows a strange behaviour by a user identifier, such as an unusually large number of search activities at strange times of day or searches against a VIP patient. These out-of-band requests should be supported by the Cross-Community policy agreements.

##### 1:52.4.1.3.3 Best Effort

The AuditEvent should be populated with best-effort. This principle recognizes that there are times when an AuditEvent can't be fully populated due to the recording entity not having access to all of the information. The principle recognizes that recording some information is better than failing to record any AuditEvent due to this lack of elements to fit the pattern. These cases where lesser information is available to be recorded tend to be during failure-modes, which leads to the importance to record the elements that are known.

This principle also recognizes that some detail could be obtained, but through extreme effort. This extreme effort is often not justified. So best-effort does not compel the use of extreme effort to obtain the missing information. For example, during a network transaction where the AuditEvent pattern is calling for the name of the user in addition to the user identifier, the name could be looked up in a directory, but this would be extreme effort that is not called for by best-effort. 

### 1:52.4.2 Use Cases

The AuditEvent patterns defined here cover the following Use Cases.

#### 1:52.4.2.1 Use Case #1: Generic AuditEvent pattern for FHIR RESTful operations

Given the http RESTful operations of Create, Read, Update, Delete, and Search; the patterns defined here will capture sufficient information for audit analysis by an Audit Consumer actor. See [3:5.7.3 RESTful activities](content.html#3573-restful-activities) for the pattern definitions and examples.

#### 1:52.4.2.2 Use Case #2: Security token enhancement pattern 

Given that a security relevant event is being recorded, for example Generic FHIR RESTful operations, and where a security token is known that descrbes the client and possibly the human. Define how an activity AuditEvent (see Use Case #1) would be enhanced to record details from the OAuth or SAML token. See [3:5.7.4 Security Token](content.html#3574-security-token) for the pattern definitions and examples.

#### 1:52.4.2.3 Use Case #3: Privacy relevant disclosure event

Given that a privacy relevant disclosure event is detected, this use-case shows how the details of the event can be recorded. See [3:5.7.5 Privacy Disclosure Audit Message](content.html#3575-privacy-disclosure-audit-message)

## 1:52.5 BasicAudit Security Considerations

This profile does not define any transactions. This profile defines AuditEvent patterns to be used when a more specific AuditEvent pattern is defined. 

In some cases this profile has defined a minimally-populated AuditEvent that is focused on recording identifiers with no descriptive or replication. The minimally-populated AuditEvent helps preserve privacy of the data, actors, and events recorded in the AuditEvent. The minimally-populated AuditEvent is expected to be used by an audit log using agent that has knowledge of the source material for these identifiers, and has access rights to use those source materials. For example, recording a Practitioner id, without recording the Practitioner name or other elements recorded in the Practitioner resource; where audit log analysis would use an organization directory where that identitifier can be looked up to find the full details of the Practitioner.

<div markdown="1" class="stu-note">
TODO: Should a minimally populated or maximum populated AuditEvent have a defined .meta.security so as to be more able to be access controlled at the Audit Consumer API?
</div>

## 1:52.6 BasicAudit Cross-Profile Considerations

This profile defines some AuditEvent patterns for use when there is not a more specific AuditEvent pattern defined. Thus when grouped with an IHE Profile that has defined an AuditEvent (AuditMessage) pattern, that more specific pattern defined in the grouped IHE Profile shall be used.

The patterns defined here might be used as profiling parent to a more specific defined AuditEvent.