<!--badges-->
### IG Status

![issues](https://img.shields.io/github/issues/IHE/ITI.BasicAudit)

<!--/badges-->

### Implementation Guide for basic AuditEvent 

This Implementation Guide provides AuditEvent profiles and examples for some common and reusable patterns. This Implementation Guide depends on IHE-ATNA infrastructure for logging and providing access to the Audit Record Repository. 
* logging of RESTful interactions. 
  * Create / Read / Update / Delete / Search
* logging of A known Disclosure (e.g. USA Accounting of Disclosures)
* Additional details to be recorded when grouped with IUA or XUA
* some communities would like more comprehensive data in the AuditEvent than the minimal (identifier centric)
* some communities would like to record specific Query/Search types with full search results in the auditEvent
* a major contribution will be a huge number of examples that align with these guidelines. 
* an auditEvent pattern for an Authorization Service Decision

continuous build http://build.fhir.org/ig/IHE/ITI.BasicAudit/branches/main/index.html

released https://profiles.ihe.net/ITI/BALP

