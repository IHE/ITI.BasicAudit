
The Basic Audit Log Pattern (BasicAudit) Content Profile defines some basic and reusable AuditEvent patterns. This includes basic audit log profiles for FHIR RESTful operations, to be used when there is not a more specific audit event defined. Where a more specific audit event can be defined it should be derived off of these basic patterns.

The Audit Log Patterns defined here rely on the [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html) Profile. 
The patterns defined here may be used as they are, or further refined to specific use-cases. 

The following list provides a few examples of how BasicAudit might be leveraged by implementers:
-   Generic AuditEvent pattern for FHIR RESTful operations
-   Generic AuditEvent pattern for recording a data access meeting some recording pattern (e.g. USA Accounting of Disclosures)

This implementation guide is intended to be fully compliant with the HL7 [FHIR](http://hl7.org/fhir/) specification, providing only use-case driven constraints to aid with interoperability, deterministic results, and compatibility with ATNA and other IHE Profiles.

## 1:52.1 BasicAudit Actors and Content

Figure 52.1-1 shows the actors directly involved in the Basic Audit Log Pattern Profile and the relevant transactions between them. Note that the actors in this profile are the same as the actors defined in the ATNA Profile [ITI TF-1: 9.1](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html).
<div>
{%include ActorsAndTransactions.svg%}
</div>
<br clear="all">

**Figure 52.1: BasicAudit Actor Diagram**

Table 52.1-1: BasicAudit; Profile - Actors and Transactions

| Actors  | Transactions  | Initiator or Responder | Optionality| Reference|
|---------|---------------|:----------------------:|:---------------:|-----------------------------------|
| Patient Demographics Consumer | Mobile Patient Demographics Query [ITI-78]  | Initiator | R  | [ITI TF-2:3.78](ITI-78.html) |
| Patient Demographics Supplier | Mobile Patient Demographics Query [ITI-78] | Responder | R | [ITI TF-2:3.78](ITI-78.html) |
{:.grid}


Note 1: The Mobile Patient Demographics Query [\[ITI-78\]](ITI-78.html) transaction corresponds to the transactions used in the [PDQ](https://profiles.ihe.net/ITI/TF/Volume1/ch-8.html) and [PDQv3](https://profiles.ihe.net/ITI/TF/Volume1/ch-24.html) Profiles and provides similar functionality. 
There is no transaction which corresponds to the Patient Demographics and Visit Query [ITI-22].
See [ITI TF-2: Appendix M.4](https://profiles.ihe.net/ITI/TF/Volume2/ch-M.html#M.4) for a mapping of query fields for PDQ, PDQv3, and BasicAudit transactions.

### 1:52.1.1 Actor Descriptions and Actor Profile Requirements

#### 1:52.1.1.1 Patient Demographics Consumer

No additional requirements.

#### 1:52.1.1.2 Patient Demographics Supplier

The Patient Demographics Supplier shall publish an `instance` CapabilityStatement at the metadata endpoint following [ITI Appendix Z.3](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.3-capabilitystatement-resource) using the [FHIR capabilities interaction](http://hl7.org/fhir/R4/http.html#capabilities). 
All supported search parameters and search methods (GET, POST) shall be specified. The [search parameters defined in \[ITI-78\]](ITI-78.html#23784121-search-parameters) shall be supported, other parameters may be supported.

This capabilities response will typically include all of the capabilities inclusive of all grouped Actors and additional functionality.

### 1:52.1.2 Transaction Descriptions
The transactions in this profile are summarized in the sections below.

#### 1:52.1.2.1 Mobile Patient Demographics Query transaction

Mobile Patient Demographics Query is used by the Patient Demographics Consumer to solicit information about patients whose demographics data match data provided in the query parameters on the request message. The request is received by the Patient Demographics Supplier. The Patient Demographics Supplier processes the request and returns a response in the form of demographics information for the matching patients.

For more details see the detailed [transaction description](ITI-78.html)

## 1:52.2 BasicAudit Actor Options

Options that may be selected for each actor in this profile, if any, are listed in Table 52.2-1. Dependencies between options when applicable are specified in notes.

**Table 52.2-1: Basic Audit Log Pattern - Actors and Options**

Actor	| Option Name |	Reference
---|---|---
Patient Demographics Consumer |	none |	.
Patient Demographics Supplier |	none |	.
{:.grid}

## 1:52.3 BasicAudit Required Actor Grouping

No required groupings.

The Security Considerations page describes some optional groupings that may be of interest for security considerations.

Cross-Profile Considerations describes some optional groupings in other related profiles.

## 1:52.4 BasicAudit Overview

### 1:52.4.1 Concepts
The BasicAudit Profile supports all of the use cases of PDQ while keeping the technology as lightweight as possible. Example uses include:
*   Mobile devices used by physicians (for example: a mobile app for electronic patient charts) which need to establish patient context by scanning a bracelet,
*	Web based EHR/EMR applications which wish to provide dynamic updates of patient demographic information such as a non-postback search, additional demographic detail, etc.
*	A document source/consumer wishing to perform an operation in the IHE Mobile access to Health Documents (MHD) Profile, where patient ID in the appropriate patient ID domain needs to be resolved by the source/consumer,
*	A health portal securely exposing demographics data to browser-based plugins,
*	Medical devices which need to access patient demographic information.
Each of these specific use cases is generalized into two general use cases. The first is one where a system must obtain patient demographics to populate a user interface via a known demographic field (such as bracelet ID) or search parameters provided by a user. The second is as a prerequisite step whereby an application must obtain an identifier from another patient ID domain in order to complete another workflow.
This profile is applicable for use by any application which requires access to patient demographics where lightweight REST/JSON or REST/XML is a more suitable technology than traditional PDQ or PDQv3 Profiles.

### 1:52.4.2 Use Cases

#### 1:52.4.2.1 Use Case #1: Patient Information Entering at Bedside
In this use case an admitted patient is assigned a bed and may not be able to provide positive ID information. The nurse uses the BasicAudit Profile to establish patient context.

##### 1:52.4.2.1.1 Patient Information Entering at Bedside Use Case Description
An admitted patient is assigned to a bed. The patient may or may not be able to provide positive ID information. The nurse needs to enter patient identity information into some bedside equipment to establish the relationship of the assigned bed to the patient. The equipment issues a query for a patient pick list to a patient demographics supplier that provides data for a patient pick list. Search criteria entered by the nurse might include one or more of the following:

*	Partial or complete patient name (printed on the patient record or told by the patient)
*	Patient ID (this may be obtained from printed barcode, a bed-side chart, etc.)
*	Patient ID entry or scan.
*	Date of birth / age range

The system returns a list of patients showing Patient ID, full name, age, sex and displays the list to the nurse. The nurse then selects the appropriate record to enter the patient identity information into the bedside equipment application.

#### 1:52.4.2.2 Use Case #2: Patient Identity Information Entering in Physician Offices
In this use case a patient visits a physician for the first time. The physician system will use the BasicAudit Profile to import demographics information into the local application.

##### 1:52.4.2.2.1 Patient Identity Information Entering in Physician Offices Use Case Description
A patient visits a physician office for the first time. The nurse needs to register the patient; in doing so, it is desired to record the patient’s demographic data in the practice management information system (PMIS). The physician office is connected to a hospital enterprise’s central patient registry. The nurse issues a patient query request to the central patient registry acting as a Patient Demographics Supplier, with some basic patient demographics data as search criteria. In the returned patient list, she picks an appropriate record for the patient, including the hospital’s Patient ID, to enter into the PMIS. (Note the PMIS uses a different Patient ID domain than that of the central patient registry.)

#### 1:52.4.2.3 Use Case #3: Patient Demographics Query in an Enterprise with Multiple Patient ID Domains
In this use case a lab system obtains identities from multiple Patient ID domains for the purpose of reporting results.

##### 1:52.4.2.3.1 Patient Demographics Query in an Enterprise with Multiple Patient ID Domains Use Case Description
A lab technician enters some basic demographics data (e.g., patient name) into a lab application to query a patient demographics supplier to identify a patient for his lab exams. As the application also needs the patient identifier in another Patient ID Domain in the enterprise for results delivery, the application is configured to query for Patient IDs from other domains in the query response.


#### 1:52.4.3 Basic Process Flow in Basic Audit Log Pattern Profile

<div>
{%include ActorsAndTransactions.svg%}
</div>
<br clear="all">
**Figure 52.4.3-1: Basic Process Flow in BasicAudit Profile**

## 1:52.5 BasicAudit Security Considerations

This profile does not define any transactions. This profile defines AuditEvent patterns to be used when a more specific AuditEvent pattern is defined. 

In some cases this profile has defined a minimally-populated AuditEvent that is focused on recording identifiers with no descriptive or replication. The minimally-populated AuditEvent helps preserve privacy of the data, actors, and events recorded in the AuditEvent. The minimally-populated AuditEvent is expected to be used by an audit log using agent that has knowledge of the source material for these identifiers, and has access rights to use those source materials. For example, recording a Practitioner id, without recording the Practitioner name or other elements recorded in the Practitioner resource; where audit log analysis would use an organization directory where that identitifier can be looked up to find the full details of the Practitioner.

## 1:52.6 BasicAudit Cross-Profile Considerations

This profile defines some AuditEvent patterns for use when there is not a more specific AuditEvent pattern defined. Thus when grouped with an IHE Profile that has defined an AuditEvent (AuditMessage) pattern, that more specific pattern defined in the grouped IHE Profile shall be used.

The patterns defined here might be used as profiling parent to a more specific defined AuditEvent.


