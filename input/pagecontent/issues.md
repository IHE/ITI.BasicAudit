Comments and questions are welcome as github issues, FHIR chat [stream for the topic AuditEvent for Patient](https://chat.fhir.org/#narrow/stream/179247-Security-and.20Privacy/topic/AuditEvent.20for.20Patient) , 
	
Is there an established way to record an OAuth token that I could define? I am expecting that mostly a unique identifier of the token is minimally needed. With a username and purposeOfUse being useful. I need some guidance and samples.

Is there any alternatives to the patterns I have defined? I did note some alternatives with recommendations in narrative?

Is there some other improvements one could recommend?

note in my pattern for Query, I allow the non-base64Binary query string to be put into entity.name. Is this useful?

The base64binary should still be used to record the query/search as it was received, thus the place where no input-sensitization might have removed a malicious attempt. However even this is not clear how it should record the query and relevant http headers (mime-type), while not duplicating security information that would be recorded in an agent element.

It has been noted that [HAR](https://en.wikipedia.org/wiki/HAR_(file_format)) HTTP Archive format might be a useful generic format for the logging of Query/Search. Also see [har-12-spec](http://www.softwareishard.com/blog/har-12-spec/#request).

I need some examples of how Query is recorded for variations on search. Such as a POST with a Parameters?

I wish there was a flag similar but opposite to MustSupport, something like ShouldNotUse to discourage use while not making it invalid to use. given that this flag does not exist, I have marked everything that would be discouraged as 0..0. This is not necessarily wrong, as one can always be compliant with AuditEvent core, and not follow my IG guidance. It just seems very heavy handed.


There is a start at a test plan using Gherkin/Cucumber.

I did not include the traceID stuff, should it be part of basic?
	
	
TODO - tasks I know need to be done, I just didn't get to them yet.
	   
All examples are recorded ONLY by the server. There should be also examples recorded by the client and by an intermediary. The difference is that the .source element indicates who is recording. Otherwise the pattern is the same.

Explain Query as just saving the query parameters and NOT the query results.

Explain in the narrative the general layout of that profile.

I intend to add many examples that are not compliant to the profiles, but should be considered consumable by an Audit-Client and accepted at an Audit-Repository. These will include AuditEvent logs from various IHE profiles, and degenerate forms of the included RESTful. Note that audit logging is a best-effort concept, the profiles show the best-case but best-effort fills out the AuditEvent with everything available even if it is not fully compliant.

Should response time be recorded in the .period element?
     
I used SNOMED codes... are these freely available? are there alternatives? Should this IG just define codes rather than use SNOMED codes?
