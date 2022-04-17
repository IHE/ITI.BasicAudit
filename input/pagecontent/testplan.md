<div markdown="1" class="stu-note">

This Test Plan page is a prototype.   We expect the maturity of the content will improve over time.  For now, we summarize high level testing scope and available tools. Comments are welcome.
</div>

## Introduction

Overall test plan leverages the Profiles, and Examples shown on the [Artifacts Summary](artifacts.html). The [Profiles](artifacts.html#structures-resource-profiles) listed are describing the constraints that would be adhered to by Actors claiming conformance to this implementation guide. Thus any applicable AuditEvent Resources that are known to have been published by an app or server MUST be conformant to these profiles as appropriate.

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

## High-level Test Scope

todo

### Options 

todo

## Unit Test Procedure (Conformance Testing)

todo
### Available tools for ATNA unit testing

#### Gazelle Audit Repository - Simulator 

todo

#### Gazelle External Validation Service (aka "EVS Client") - Validator

todo


## Integration Test Procedure (Interoperability Testing)

todo

