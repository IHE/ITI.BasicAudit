The Basic Audit Log Patterns (BasicAudit) **Content Profile** defines some basic and reusable AuditEvent patterns. This includes basic audit log profiles for FHIR RESTful operations, to be used when there is not a more specific audit event defined. Where a more specific audit event can be defined it should be derived off of these basic patterns.

<div markdown="1" class="stu-note">

| [Significant Changes, Open, and Closed Issues](issues.html) |
{: .grid}

**[Search this IG](https://www.google.com/search?q=site%3Ahttps%3A%2F%2Fprofiles.ihe.net%2FITI%2FBasicAudit)**

</div>

### Organization of This Guide
This guide is organized into three main sections:

1. Volume 1 [52 BasicAudit Introduction](volume-1.html)
    1. [52.1 BasicAudit Actors and Content](volume-1.html#1521-basicaudit-actors-and-content)
    2. [52.2 BasicAudit Actor Options](volume-1.html#1522-basicaudit-actor-options)
    3. [52.3 BasicAudit Required Groupings](volume-1.html#1523-basicaudit-required-actor-grouping)
    4. [52.4 BasicAudit Overview](volume-1.html#1524-basicaudit-overview)
    5. [52.5 BasicAudit Security Considerations](volume-1.html#1525-basicaudit-security-considerations)
    6. [52.6 BasicAudit Cross-Profile Considerations](volume-1.html#1526-basicaudit-cross-profile-considerations)

2. Volume 3: Content Section
    1. [5.7 Basic Audit Log Patterns](content.html)

3. [Test Plan](testplan.html)

4. [Changes to other Profiles](other.html)

See also the [table of contents](toc.html) and
the index of [artifacts](artifacts.html) defined as part of this implementation guide.

### Conformance Expectations

IHE uses the normative words: Shall, Should, and May according to [standards conventions](https://profiles.ihe.net/GeneralIntro/ch-E.html).

BasicAudit uses ```Must Support``` in StructureDefinition profiles. This is equivalent to the IHE use of **R2** as defined in [Appendix Z](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.10-profiling-conventions-for-constraints-on-fhir).

### Download 

You can also download:

* [this entire guide](full-ig.zip),
* the definition resources in [json](definitions.json.zip), [xml](definitions.xml.zip), [ttl](definitions.ttl.zip), or [csv](csvs.zip) format, or
* the example resources in [json](examples.json.zip), [xml](examples.xml.zip) or [ttl](examples.ttl.zip) format.

The source code for this Implementation Guide can be found on [IHE GitHub](https://github.com/IHE/ITI.BasicAudit)
