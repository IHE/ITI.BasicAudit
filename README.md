attempt at defining structureDefinition profiles and examples for how MyHealtheVet publishes to PGHD (which is DSTU2)

continuous build http://build.fhir.org/ig/JohnMoehrke/BasicAudit/branches/main/index.html



# Open issues

* Given that for Delete, I chose to have the FHIR Server identify as a custodian; should that be universal on all REST transactions? All the other CRUDE are more clear in DICOM and IHE to use Source Role ID as the client, and Destination Role Id for the server. 
