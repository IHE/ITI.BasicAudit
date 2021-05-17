Audit Example of a basic patient identifiable Query with no user

Audit Example for a RESTful Query of a resource with a patient subject with no user. 
- This might be a B2B exchange where the OAuth token just identifies the requesting organization.
- as recorded by the server
- a FHIR GET query of  
  - `test.fhir.org/r4/AuditEvent?_lastUpdated=gt2020-11-06T21:52:30.300Z&_sort=_lastUpdated&_format=json&_count=10`
- by client on an IPv6 network
- patient is NOT specified
- user is specified

