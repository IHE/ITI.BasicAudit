Comments and questions are welcome as github issues, FHIR chat [stream for the topic AuditEvent for Patient](https://chat.fhir.org/#narrow/stream/179247-Security-and.20Privacy/topic/AuditEvent.20for.20Patient) , 
	
# Questions for committee development prior to public-comment

- Is there any alternatives to the patterns I have defined? I did note some alternatives with recommendations in narrative?
- Is there some other improvements one could recommend?
- note in my pattern for Search/Query, I allow the cleaned search parameters to be put into entity.description. Is this useful?
- I wish there was a flag similar but opposite to MustSupport, something like ShouldNotUse to discourage use while not making it invalid to use. given that this flag does not exist, I have marked everything that would be discouraged as 0..0. This is not necessarily wrong, as one can always be compliant with AuditEvent core, and not follow my IG guidance. It just seems very heavy handed.
- There is a start at a test plan using Gherkin/Cucumber.
- Should response time be recorded in the .period element? Who would be responsible for recording this response time? This seems too undefinable in abstract actor terms. Thus should it be given as guidance without constraints or requirements?
- Not clear how conformance to this IG will be declared in a way that is understandable at the IHE Integration Statement. Do we need named options for each defined pattern? Are the current "ANY Secure Client" and "ANY Secure Server" sufficient?     
- Should a minimally populated or maximum populated AuditEvent have a defined .meta.security code so as to be more able to be access controlled at the Audit Consumer API?
- is the use of AssuranceLevel proper? Should the extension element be defined more specific to NIST-800-63 assurance levels, and not allow to be carrying historical vocabulary that is not specifically assurance-level but rather the method of authentication used (e.g. urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport)?
- support for [HL7 Security for Scalable Registration, Authentication, and Authorization (aka UDAP) ](http://hl7.org/fhir/us/udap-security/history.html) when it gets published 


# TODO - tasks I know need to be done, I just didn't get to them yet.
	   
- I used SNOMED codes... are these freely available? are there alternatives? Should this IG just define codes rather than use SNOMED codes? Should IHE ask for these codes?
- example descriptions don't show up on the page for that example. For some examples (the REST Query examples) I have replicated the example description in the -info.md pagecontent. I hope that the IG builder can do this automatically - https://github.com/HL7/ig-template-base/issues/184
- IG builder / validation issue with the slicing I need to use in AuditEvent. Discussion can be found https://chat.fhir.org/#narrow/stream/215610-shorthand/topic/slicing.20with.20complex.20.24this and https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/slicing.20sliced.20extension
- Not much of a problem, but tracking for a solution anyway -- Binary Adjunct files (used to hold examples of SAML assertions) are working in DocumentReference, but throw a file type error with Binary. https://chat.fhir.org/#narrow/stream/215610-shorthand/topic/Binary.20Adjunct
- MustSupport -- given that the minimal profiles use MustSupport properly, but those profiles derived off of those minimal profiles add manditory requirement. This gives the appearance that a manditory element is also "R2", which is conflicting as something can't be both manditory and R2. Not sure how to solve this, as the FHIR profiling rules do not allow for removing a MustSupport flag. Thus the best I can think of is to define MustSupport in a way such that the R2 only applies if the element is not manditory, or that MustSupport does not mean anything on manditory elements. [chat thread](https://chat.fhir.org/#narrow/stream/179177-conformance/topic/must-support.20when.20re-profiling)
- add short descriptions to profiled elements when needed / useful.	

# Open Issues

1. Is the oAuth AuditEvent patterns appropriate, especially the opaque one. With Opaque is the last 32 characters biggenough yet not too big?
1. The R4 version of AuditEvent uses extensible binding often, this has limited the ways that the AuditEvent can be constrained. R5 has relaxed these to either example or preferred binding, so some further can be done in this IG once R5 is released.
1. The audit examples are brought in from MHD, PIXm, and PDQm; and "adjusted" to fit the RESTful pattern. This adjustment is not necessary, but follows with the proposal that these RESTful patterns are used as patterns in other Implementation Guides. Thus, these need to be evaluated as to if the adjustment is useful, or not. There should be no reason to update MHD, PIXm, or PDQm if there is not benefit, but there should also be no problem updating them. The adjustment here was more as an exercise in determining if the pattern concept could work, and not an excercise in forcing a change.
  - The adjustment was to the .type and .subtype, and one profile was changed from import/create to read.
1. RESTful profiles start with a non-patient specific one, then a derived one with the patient slice. Is this the cleanest?
1. This IG covers only basic RESTful http. Not covered are FHIR Operations, or advanced http activities like Patch, conditional create, conditional update, etc? What others are needed, for them please provide an example transaction that can be used in a profiled example.
1. X-Request-Id header -- I explained this only inside of the RESTful section, but it is applicable anywhere that X-Request-Id is used. X-Reqeust-Id is profiled differently than the example given in the FHIR core specification. Specifically there is a entity type defined here to enable slicing, where the example in FHIR core uses both type (job) and role (stream) which is harder to slice. I did not make this a standalone section because it is simply too small.  
  - X-Request-Id vs TraceId -- I added X-Request-Id profiling. I did not add TraceId, as I am not as aware of what this is. It seems very similar, unclear if it is different or the same thing. The modeling of TraceId that is in the FHIR Core is a bit different than I modeled X-Request-Id here. TraceId example in core is a .entity.type #21 "Job", with a .entity.what.identifier.type #TraceId. Where as for X-Request-Id I followed the example that Grahame indicted his server supports today for X-Request-Id. I welcome comment, as I am not an expert TraceId nor X-Reqeust-Id. 
1. who.identifier and what.identifer, rather than the .reference, are used because it is expected that as audit logging is happening these values are directly available, and the resource reference is not known. However it is possible that the resource reference is known, should we add a MS on who.reference and what.reference to encourage recording of these "when they are known"?
1. put homeCommunityId in as an Agent. Given that the definition in XUA is standalone, and is independent of organization or user. 
1. SAML profiling is focused on when a SAML token is used. There is no profiling of obtaining (access control decision). This is because [XUA](https://profiles.ihe.net/ITI/TF/Volume1/ch-13.html) only profiled the use.



