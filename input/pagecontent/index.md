The **Basic Audit Log Patterns (BALP) Implementation Guide** is a **Content Profile** that defines some basic and reusable AuditEvent patterns. This includes basic audit log profiles for FHIR RESTful operations to be used when there is not a more specific audit event defined. A focus is enabling Privacy centric AuditEvent logs that hold well formed indication of the Patient when they are the subject of the activity being recorded in the log. Where a more specific audit event can be defined it should be derived off of these basic patterns.

<div markdown="1" class="stu-note">

| [Significant Changes, Open, and Closed Issues](issues.html) |
{: .grid}

**[Search this IG](https://www.google.com/search?q=site%3Ahttps%3A%2F%2Fprofiles.ihe.net%2FITI%2FBasicAudit)**

</div>

### Organization of This Guide
This guide is organized into four main sections:

1. Volume 1: [52 BasicAudit Introduction](volume-1.html)
    1. [52.1 BasicAudit Actors and Content](volume-1.html#1521-basicaudit-actors-and-content)
    2. [52.2 BasicAudit Actor Options](volume-1.html#1522-basicaudit-actor-options)
    3. [52.3 BasicAudit Required Groupings](volume-1.html#1523-basicaudit-required-actor-grouping)
    4. [52.4 BasicAudit Overview](volume-1.html#1524-basicaudit-overview)
    5. [52.5 BasicAudit Security Considerations](volume-1.html#1525-basicaudit-security-considerations)
    6. [52.6 BasicAudit Cross-Profile Considerations](volume-1.html#1526-basicaudit-cross-profile-considerations)

2. Volume 3: Content Section
    1. [5.7 Basic Audit Log Patterns](content.html)
	
4. [Test Plan](testplan.html)

5. [Changes to other Profiles](other.html)

See also the [table of contents](toc.html) and
the index of [artifacts](artifacts.html) defined as part of this implementation guide.

### Conformance Expectations

IHE uses the normative words: Shall, Should, and May according to [standards conventions](https://profiles.ihe.net/GeneralIntro/ch-E.html).

#### Must Support

The use of ```mustSupport``` in StructureDefinition profiles equivalent to the IHE use of **R2** as defined in [Appendix Z](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.10-profiling-conventions-for-constraints-on-fhir).

mustSupport of true - only has a meaning on items that are minimal cardinality of zero (0), and applies only to the source actor populating the data. The source actor shall populate the elements marked with MustSupport, if the concept is supported by the actor, a value exists, and security and consent rules permit. 
The consuming actors should handle these elements being populated or being absent/empty. 
Note that sometimes mustSupport will appear on elements with a minimal cardinality greater than zero (0), this is due to inheritance from a less constrained profile.

### Download 

You can also download:

* [this entire guide](full-ig.zip)
* the definition resources in [json](definitions.json.zip), [xml](definitions.xml.zip), [ttl](definitions.ttl.zip), or [csv](csvs.zip) format, or
* the example resources in [json](examples.json.zip), [xml](examples.xml.zip) or [ttl](examples.ttl.zip) format.

The source code for this Implementation Guide can be found on IHE GitHub [https://github.com/IHE/ITI.BasicAudit](https://github.com/IHE/ITI.BasicAudit).
