Server - Audit Example of a basic patient identifiable Query (POST)

Audit Example for a RESTful Query using POST with a patient subject, recorded by the server
- recorded by the server
- server is FHIR application server defined by ex-device
- client is a computer at myMachine.example.org
- user is John Smith
- query is for an Observation for given patient
- patient is specified

The search received, and thus recorded:
```
POST /r4/Observation/_search HTTP/1.1
Host: test.fhir.org
Content-Type: application/x-www-form-urlencoded
Accept: application/fhir+json; fhirVersion=4.0
Content-Length: 87

patient=ex-patient&_lastUpdated=gt2020-11-06T21:52:30.300Z&_sort=_lastUpdated&_count=10
```


