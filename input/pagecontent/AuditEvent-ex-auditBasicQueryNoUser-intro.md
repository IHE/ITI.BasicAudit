Audit Example of a basic patient identifiable Query with no user

Audit Example for a RESTful Query of a resource with a patient subject with no user. 
- This might be a B2B exchange where the OAuth token just identifies the requesting organization.
- as recorded by the server
- a FHIR GET query 
- by client on an IPv6 network
- patient is NOT specified
- user is specified

The http GET requested

```
GET test.fhir.org/r4/Observation?patient=ex-patient&_lastUpdated=gt2020-11-06T21:52:30.300Z&_sort=_lastUpdated&_count=10
Accept: application/fhir+json; fhirVersion=4.0
```
