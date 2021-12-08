Server - Audit Example of a basic patient identifiable Query (GET)

Description: "Audit Example for a RESTful Query (GET) of a resource with a patient subject.
- as recorded by the server
- a FHIR GET query 
- by client on an IPv6 network
- patient is specified
- user is specified
- a X-Request-Id is present

The http GET requested

```
GET test.fhir.org/r4/Observation?patient=ex-patient&_lastUpdated=gt2020-11-06T21:52:30.300Z&_sort=_lastUpdated&_count=10
Accept: application/fhir+json; fhirVersion=4.0
X-Request-Id: cc6d168e-5871-11ec-bf63-0242ac130002
```

