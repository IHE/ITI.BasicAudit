Comments and questions are welcome as github issues, FHIR chat [stream for the topic AuditEvent for Patient](https://chat.fhir.org/#narrow/stream/179247-Security-and.20Privacy/topic/AuditEvent.20for.20Patient) , 
	
# Questions for Public Comment
- Is there an established way to record an OAuth token that I could define? I am expecting that mostly a unique identifier of the token is minimally needed. With a username and purposeOfUse being useful. I need some guidance and samples.
- Is there any alternatives to the patterns I have defined? I did note some alternatives with recommendations in narrative?
- Is there some other improvements one could recommend?
- note in my pattern for Search/Query, I allow the cleaned search parameters to be put into entity.description. Is this useful?
- I wish there was a flag similar but opposite to MustSupport, something like ShouldNotUse to discourage use while not making it invalid to use. given that this flag does not exist, I have marked everything that would be discouraged as 0..0. This is not necessarily wrong, as one can always be compliant with AuditEvent core, and not follow my IG guidance. It just seems very heavy handed.
- There is a start at a test plan using Gherkin/Cucumber.
- X-Request-Id vs TraceId -- I added X-Request-Id profiling. I did not add TraceId, as I am not as aware of what this is. It seems very similar, unclear if it is different or the same thing. The modeling of TraceId that is in the FHIR Core is a bit different than I modeled X-Request-Id here. TraceId example in core is a .entity.type #21 "Job", with a .entity.what.identifier.type #TraceId. Where as for X-Request-Id I followed the example that Grahame indicted his server supports today for X-Request-Id. I welcome comment, as I am not an expert TraceId nor X-Reqeust-Id. 
- Should response time be recorded in the .period element? Who would be responsible for recording this response time? This seems too undefinable in abstract actor terms. Thus should it be given as guidance without constraints or requirements?
- SAML profiling is focused on when a SAML token is used. There is no profiling of obtaining (access control decision). This is because [XUA](https://profiles.ihe.net/ITI/TF/Volume1/ch-13.html) only profiled the use.
- Not clear how conformance to this IG will be declared in a way that is understandable at the IHE Integration Statement. Do we need named options for each defined pattern? Are the current "ANY Secure Client" and "ANY Secure Server" sufficient?     
- Should a minimally populated or maximum populated AuditEvent have a defined .meta.security code so as to be more able to be access controlled at the Audit Consumer API?
- add short descriptions to profiled elements when needed / useful.	
- is the use of AssuranceLevel proper? Should the extension element be defined more specific to NIST-800-63 assurance levels, and not allow to be carrying historical vocabulary that is not specifically assurance-level but rather the method of authentication used (e.g. urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport)?
	
# TODO - tasks I know need to be done, I just didn't get to them yet.
	   
- All examples are recorded ONLY by the server. There should be also examples recorded by the client and by an intermediary. The difference is that the .source element indicates who is recording. Otherwise the pattern is the same.
- Give an explaination of why Query is just saving the query parameters and NOT the query results.
- Explain in narrative each profile 
- I intend to add many examples that are not compliant to the profiles, but should be considered consumable by an Audit-Client and accepted at an Audit-Repository. These will include AuditEvent logs from various IHE profiles, and degenerate forms of the included RESTful. Note that audit logging is a best-effort concept, the profiles show the best-case but best-effort fills out the AuditEvent with everything available even if it is not fully compliant.
- I used SNOMED codes... are these freely available? are there alternatives? Should this IG just define codes rather than use SNOMED codes? Should IHE ask for these codes?
- could create profiles here, that depend on MHD, PDQm, PIXm defined AuditEvent profiles and adds to them the IUA further refinement. Could have examples that declare conformance to original (MHD/PDQm/PIXm), and also the RESTful equivilant, and also the IUA refinement. These examples will show where deviations are, and then we can determine if those deviations are okay or should be fixed.
- OAuth profiling
- example descriptions don't show up on the example page. For some examples I have replicated the example description in the -info.md pagecontent. I hope that the IG builder can do this automatically - https://github.com/HL7/ig-template-base/issues/184


# Open Issues

- The R4 version of AuditEvent uses extensible binding often, this has limited the ways that the AuditEvent can be constrained. R5 has relaxed these to either example or preferred binding, so some further can be done in this IG once R5 is released.
- The audit examples are brought in from MHD, PIXm, and PDQm; and "adjusted" to fit the RESTful pattern. This adjustment is not necessary, but follows with the proposal that these RESTful patterns are used as patterns in other Implementation Guides. Thus, these need to be evaluated as to if the adjustment is useful, or not. There should be no reason to update MHD, PIXm, or PDQm if there is not benefit, but there should also be no problem updating them. The adjustment here was more as an exercise in determining if the pattern concept could work, and not an excercise in forcing a change.
  - The adjustment was to the .type and .subtype, and one profile was changed from import/create to read.
- RESTful profiles start with a non-patient specific one, then a derived one with the patient slice. Is this the cleanest?