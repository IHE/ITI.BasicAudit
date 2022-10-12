<div markdown="1" class="stu-note">
This section modifies other IHE profiles, and is not a part of the Basic Audit Log Patterns Profile. The content here will be incorporated into the target narrative at a future time, usually when BasicAudit goes normative.
</div>

## IHE Technical Frameworks General Introduction Appendix A: Actors

|------------------------------------------------|
| Editor, add the following new or modified Actors definition in the [IHE Technical Frameworks General Introduction Appendix A](https://profiles.ihe.net/GeneralIntro/ch-A.html): |
{:.grid .bg-info}

| Actor                         | Definition                                                                                |
| ----------------------------- | ------------------------------------------------------------------------------------------|
| Audit Creator  | Creates audit log messages (e.g., AuditEvent). |
| Audit Consumer | Consumes audit log messages (e.g., AuditEvent). |
{:.grid .table-striped}


## IHE Technical Frameworks General Introduction Appendix B: Transactions

|------------------------------------------------|
| Editor, add the following new or modified transactions to the [IHE Technical Frameworks General Introduction Appendix B](https://profiles.ihe.net/GeneralIntro/ch-B.html): |
{:.grid .bg-info}


| Transaction                              | Definition                                                                              |
| ---------------------------------------- | --------------------------------------------------------------------------------------- |
| none |  |
{:.grid .table-striped}

## Maturity Levels

**There are Maturity Levels on artifacts, all the maturity level numbers are expected to be consistent with HL7 definition of [Maturity Levels (aka FMM)](http://build.fhir.org/versions.html#maturity). These Maturity Levels are used during [Trial Implementation phase only](https://profiles.ihe.net/GeneralIntro/ch-8.html).**

The content of this release has been subject to significant review through ~~ballot and other HL7~~ **IHE** processes and many aspects of it have been implemented and subjected to interoperability testing through Connectathons and early adoption. However, the degree of testing has varied. Some resources have been well tested in a variety of environments. Others have received relatively little real-world exercise. In general, the infrastructure should be considered to be more stable than the resources themselves. In some cases, there are issues on which input is specifically requested during the ~~Trial Use~~ **Trial Implementation** period (see the Outstanding Issue List, and known issues will arise after publication (refer to the ~~FHIR~~ Change Request icon tracker for details.) Guidance from early implementation will help address these areas.

All artifacts in this specification are assigned a "Maturity Level" ~~, known as FMM (~~ **modeled** after the well-known [CMM grades](http://en.wikipedia.org/wiki/Capability_Maturity_Model) ~~)~~ . The ~~FMM~~ **Maturity** level can be used by implementers to judge how advanced - and therefore stable - an artifact is. The following ~~FMM~~ **Maturity** levels are defined:

| Level | Definition |
| ----- | ---------- |
| 0 |	Draft: the resource or profile (artifact) has been published on the current build. This level is synonymous with Draft |
| 1 |	PLUS the artifact produces no warnings during the build process and the responsible WG has indicated that they consider the artifact substantially complete and ready for implementation. For resources, profiles and implementation guides, the FHIR Management Group has approved the underlying resource/profile/IG proposal |
| 2 |	PLUS the artifact has been tested and successfully supports interoperability among at least three independently developed systems leveraging most of the scope (e.g. at least 80% of the core data elements) using semi-realistic data and scenarios based on at least one of the declared scopes of the artifact (e.g. at a connectathon). ~~These interoperability results must have been reported to and accepted by the FMG~~ |
| 3 |	PLUS + the artifact has been verified by the work group as meeting the Conformance Resource Quality Guidelines; has been subject to a round of formal balloting; has at least 10 distinct implementer comments recorded in the tracker drawn from at least 3 organizations resulting in at least one substantive change |
| 4 |	PLUS the artifact has been tested across its scope (see below), published in a formal publication (e.g. ~~Trial-Use~~ **Trial Implementation** ), and implemented in multiple prototype projects. As well, the responsible work group agrees the artifact is sufficiently stable to require implementer consultation for subsequent non-backward compatible changes |
| 5 |	the artifact has been published in two formal publication release cycles at ~~FMM~~ 1+ (i.e. ~~Trial-Use level~~ **Trial Implementation** ) and has been implemented in at least 5 independent production systems in more than one country |
| Normative |	the artifact is now considered stable |

Tested across scope means:

~~The FMG icon has signed off on the list of "example contexts" defined for the artifact~~
* For each example context, the artifact has either been: reviewed and approved by a domain expert for that scope area, mapped to an existing implemented scope-area-specific standard or tested in an implementation

The Maturity level is strongly related to stability; the higher the maturity level, the more controls are enforced to restrict breaking changes to the resource. ~~For further information, and discussion, see the FHIR Confluence page icon.~~

~~The maturity model is significantly influenced by the degree and type of implementation activity using an artifact. For this reason, we encourage implementers to register their implementations icon. A detailed analysis of the basis for the maturity metrics for FHIR artifacts can be found here icon.~~
