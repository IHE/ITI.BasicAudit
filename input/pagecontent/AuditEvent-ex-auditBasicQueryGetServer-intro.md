Server - Audit Example of a basic patient identifiable Query (GET)

Audit Example for a RESTful Query using GET with a patient subject, recorded by the Server
- recorded by the server peer [client](AuditEvent-ex-auditBasicQueryGetClient.html)
- server is FHIR application server defined by ex-device
- client is a computer at myMachine.example.org
- user is John Smith
- query is for an Observation for given patient
- patient is specified
- X-Request-Id is specified 

The http GET requested

```
GET test.fhir.org/r4/Observation?patient=ex-patient&_lastUpdated=gt2020-11-06T21:52:30.300Z&_sort=_lastUpdated&_count=10
Accept: application/fhir+json; fhirVersion=4.0
X-Request-Id: cc6d168e-5871-11ec-bf63-0242ac130002
```

