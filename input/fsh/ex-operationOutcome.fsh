Instance: ex-operationOutomeWithIheOtherId
InstanceOf: OperationOutcome
Usage: #example
Description: """
Example for an OperationOutcome with an IHE OtherId extension

- The extension ihe-otherId can be added to the OperationOutcome to indicate the homeCommunityId which is not responding.
"""
* issue.severity = #warning
* issue.code = #incomplete
* issue.details.extension.url = "https://profiles.ihe.net/ITI/BALP/StructureDefinition/ihe-otherId"
* issue.details.extension.valueIdentifier.type = urn:ihe:iti:xca:2010#homeCommunityId
* issue.details.extension.valueIdentifier.value = "urn:oid:1.2.334483.3.337395864.7"
* issue.details.text = "The community ABC did not respond"