The national extensions documented in this section shall be used in conjunction with the definitions of integration profiles, actors and transactions provided in Volumes 1-3 of the IHE Technical Framework. This section includes extensions and restrictions to effectively support the regional practice of healthcare in Norway.

## 4:6.1 SAML to AuditEvent

The following additional attributes are defiend in Norway SAML assertion.

Norway SAML attributes | AuditEvent element 
----|---- 
**subject** | **user**
subject:id | AuditEvent.agent[user].who.identifier.value
Subject:name | AuditEvent.agent[user].who.display
subject:system | AuditEvent.agent[user].who.identifier.system
subject:assigner | AuditEvent.agent[user].who.identifier.assigner
**PurposeOfEvent** | 
purpose:id, | AuditEvent.purposeOfEvent.coding.code
purpose:name | AuditEvent.purposeOfEvent.coding.display
purpose:system | AuditEvent.purposeOfEvent.coding.system
purpose:assigner | N/A eller ekstensjon
purpose:description | AuditEvent.purposeOfEvent.text
purpose:reason | ????
**PurposeOfEvent-local** | 
purpose-local:id, | AuditEvent.agent[user].purposeOUse.coding.code
purpose-local:name | AuditEvent.agent[user].purposeOfUse.coding.display
purpose-local:system | AuditEvent.agent[user].purposeOfUse.coding.system
purpose-local:assigner | N/A eller ekstensjon
purpose-local:description | ?
purpose-local:reason | ?
purpose-local:userSelected | AuditEvent.agent.purposeOfUse.coding.userSelected
**qualifications** | 
subject:qualification:id | AuditEvent.agent[user].extension[otherId][qualification].identifier.value
subject:qualification:name | AuditEvent.agent[user].extension[otherId][qualification].name
subject:qualification:system | AuditEvent.agent[user].extension[otherId][qualification].identifier.system
subject:qualification:assigner | AuditEvent.agent[user].extension[otherId][qualification].identifier.assigner
**nationalidentifiers** | 
subject:national-identifier:id | AuditEvent.agent[user].extension[otherId][personal].identifier.value
subject:national-identifier:name | AuditEvent.agent[user].extension[otherId][personal].name
subject:national-identifier:system | AuditEvent.agent[user].extension[otherId][personal].identifier.system
subject:national-identifier:assigner | AuditEvent.agent[user].extension[otherId][personal].identifier.assigner
**drafting model** | **====================**
**qualifications** | TODO-role-slicing
subject:qualification-role:id | AuditEvent.agent[user].role[qualification].code
subject:qualification-role:name | AuditEvent.agent[user].role[qualification].display
subject:qualification-role:system | AuditEvent.agent[user].role[qualification].system
subject:qualification-role:assigner | N/A eller ekstensjon
**structural-roles** | TODO-role-slicing 
subject:role:id | AuditEvent.agent[user].role[formal].code
subject:role:name | AuditEvent.agent[user].role[formal].display
subject:role:system | AuditEvent.agent[user].role[formal].system
subject:role:assigner | N/A eller ekstensjon
**functional-roles** | TODO-role-slicing
subject:functional-role:id | AuditEvent.agent[user].role[functonal].code
subject:functional-role:name | AuditEvent.agent[user].role[functonal].display
subject:functional-role:system | AuditEvent.agent[user].role[functonal].system
subject:functional-role:assigner | N/A eller ekstensjon
**application-roles** | TODO-application
subject:application-role-id | AuditEvent.agent[user].role[application].code
subject:application-role-name | AuditEvent.agent.[user].role[application].display
subject:application-role-system | AuditEvent.agent[user].role[application].system
subject:application-role-assigner | N/A eller ekstensjon
**organization** | 
subject:organization-id:  | AuditEvent.agent[userorg].who.identifier.value
subject:organization-name | AuditEvent.agent[userorg].who.display
subject:organization-system | AuditEvent.agent[userorg].who.identifier.system
subject:organization-assigner | AuditEvent.agent[userorg].who.identifier.assigner
**child-organization** | 
subject:child-organization-id | AuditEvent.agent[user-child-org].who.identifier.value
subject:child-organization-name | AuditEvent.agent.[user-child-org]who.display
subject:child-organization-system | AuditEvent.agent[user-child-org].who.identifier.system
subject:child-organization-assigner | AuditEvent.agent[user-child-org].who.identifier.assigner
**facility** | 
subject:facility-id | AuditEvent.agent[detail-org].who.identifier.value
subject:facility-name | AuditEvent.agent[detail-org].who.display
subject:facility-system | AuditEvent.agent[detail-org].who.identifier.system
subject:facility-assigner | AuditEvent.agent[detail-org].who.identifier.assigner
**department** | 
subject:department:id | AuditEvent.agent[local-org-dep].who.identifier.value
subject:department:name | AuditEvent.agent[local-org-dep].who.display
subject:department:requester-code | 
subject:department:system | AuditEvent.agent[local-org-dep].identifier.system
subject:department:assigner | AuditEvent.agent[local-org-dep].identifier.assigner
**sub-department** | 
subject:sub-department:id | AuditEvent.agent[local-org-sec].who.identifier.value
subject:sub-department:name | AuditEvent.agent[local-org-sec].who.display
subject:sub-department:system | AuditEvent.agent[local-org-sec].identifier.system
subject:sub-department:assigner | AuditEvent.agent[local-org-sec].identifier.assigner
**unit** | 
subject:unit:id | AuditEvent.agent[local-org-unit].who.identifier.value
subject:unit:name | AuditEvent.agent[local-org-unit].who.display
subject:unit:system | AuditEvent.agent[local-org-unit].identifier.system
subject:unit:assigner | AuditEvent.agent[local-org-unit].identifier.assigner
**policy** | 
subject:policy:id | AuditEvent.agent.policy.coding.code
subject:policy:system | AuditEvent.agent.policy.coding.system
subject:policy:assigner | N/A eller ekstensjon
subject:policy:name | AuditEvent.agent.policy.coding.display
**subject-assurance** | 
subject:assurance-level:id | 
subject:assurance-level:name | 
subject:assurance-level:system | 
subject:assurance-level:assigner | 
**healthcareservice** | 
subject:healthcareservice-id | AuditEvent.agent[healthcareservice].who.identifier.value
subject:healthcareservice-name | AuditEvent.agent[healthcareservice].who.display
subject:healthcareservice-system | AuditEvent.agent[healthcareservice].who.identifier.system
subject:healthcareservice-assigner | AuditEvent.agent[healthcareservice].who.identifier.assigner
**Patient** | 
resource:id | AuditEvent.entity[patient].what.identifier.value
resource:name | AuditEvent.entity[patient].what.display
resource:system | AuditEvent.entity[patient].what.identifier.system
**Patient-child-org** | 
resource:child-organization:id  | AuditEvent.entity[patient-child-organization].what.identifier.value
resource:child-organization:name | AuditEvent.entity[patient-child-organizatio].what.display
resource:child-organization:system | AuditEvent.entity[patient-child-organizatio].what.identifier.system
resource:child-organization:assigner | 
**Patient-facility** | 
resource:facility:id | AuditEvent.entity[patient-detail-org].what.identifier.value
resource:facility:name | AuditEvent.entity[patient-detail-org].what.display
resource:facility:system | AuditEvent.entity[patient-detail-org].what.identifier.system
resource:facility:assigner  | 
**Patient-consent** | 
resource:patient-consent-directive  | AuditEvent.agent[user].policy
resource:patient-consent-directive-type | 
{:.grid}

## TODO

- TODO-role-slicing: the qualifications/functional/structural roles.
  - can these roles be put into the [user].role bucket?
  - not clear how we can slice the .role as initially described unless there is a defiend set of systems on these codes

* [StructureDefinition profile for Basic AuditEvent pattern for Comprehensive Norway](StructureDefinition-ITI.BasicAudit.SAMLaccessTokenUse.Comprehensive.Norway.html)
  * [examples](StructureDefinition-ITI.BasicAudit.SAMLaccessTokenUse.Comprehensive.Norway-examples.html)