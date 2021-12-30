Audit Example of a basic patient identifiable Query with no Patient

Audit Example for a RESTful Query using GET with NO patient subject, recorded by the Server.
- recorded by the server
- server is FHIR application server defined by ex-device
- client is a computer at myMachine.example.org
- user is John Smith
- query is for a MeasureReport
- X-Request-Id is specified 

The http GET requested

```
GET test.fhir.org/r4/MeasureReport?_lastUpdated=gt2020-11-06T21:52:30.300Z&_sort=_lastUpdated&_count=10
Accept: application/fhir+json; fhirVersion=4.0
X-Request-Id: 4a8dca3c-2205-4dc7-90e1-db877781d7cc
```
