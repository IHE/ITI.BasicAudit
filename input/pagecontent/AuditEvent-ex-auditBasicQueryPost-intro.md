Server - Audit Example of a basic patient identifiable Query (POST)

Audit Example for a RESTful Query (POST) of a resource with a patient subject.
- as recorded by the server
- a FHIR POST query 
- by client on an IPv6 network
- patient is specified
- user is specified

The search received, and thus recorded:
```
POST /r4/Observation HTTP/1.1
Host: test.fhir.org
Content-Type: application/x-www-form-urlencoded
Accept: application/fhir+json; fhirVersion=4.0
Content-Length: 100

patient=ex-patient&_lastUpdated=gt2020-11-06T21:52:30.300Z&_sort=_lastUpdated&_format=json&_count=10
```


