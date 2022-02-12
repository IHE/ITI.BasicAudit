The national extensions documented in this section shall be used in conjunction with the definitions of integration profiles, actors and transactions provided in Volumes 1-3 of the IHE Technical Framework. This section includes extensions and restrictions to effectively support the regional practice of healthcare in Norway.

## 4:6.1 SAML to AuditEvent

The following additional attributes are defiend in Norway SAML assertion.

Norway SAML fields | AuditEvent element 
----|---- 
**subject** | **user**
subject:id | *AuditEvent.agent[user].who.identifier.value*
Subject:name | *AuditEvent.agent[user].who.display*
subject:system | *AuditEvent.agent[user].who.identifier.system*
subject:assigner | *AuditEvent.agent[user].who.identifier.assigner*
**application-session** | 
subject:application-session:id | AuditEvent.agent[user].extension[otherId][application-session].identifier.value
subject:application-session:name | AuditEvent.agent[user].extension[otherId][application-session].name
subject:application-session:system | AuditEvent.agent[user].extension[otherId][application-session].identifier.system
subject:application-session:assigner | N/A eller ekstensjon
**qualifications-roles** |
subject:qualification-role:id | AuditEvent.agent[user].role.code
subject:qualification-role:name | AuditEvent.agent[user].role.display
subject:qualification-role:system | AuditEvent.agent[user].role.system
subject:qualification-role:assigner | N/A eller ekstensjon
**structural-roles** |  
subject:role:id | AuditEvent.agent[user].role.code
subject:role:name | AuditEvent.agent[user].role.display
subject:role:system | AuditEvent.agent[user].role.system
subject:role:assigner | N/A eller ekstensjon
**functional-roles** | 
subject:functional-role:id | AuditEvent.agent[user].role.code
subject:functional-role:name | AuditEvent.agent[user].role.display
subject:functional-role:system | AuditEvent.agent[user].role.system
subject:functional-role:assigner | N/A eller ekstensjon
**application-roles** | 
subject:application-role-id | AuditEvent.agent[user].role.code
subject:application-role-name | AuditEvent.agent.[user].role.display
subject:application-role-system | AuditEvent.agent[user].role.system
subject:application-role-assigner | N/A eller ekstensjon
**healthcareservice** | 
healthcareservice:id | AuditEvent.purposeOfEvent.coding.code
healthcareservice:name | AuditEvent.purposeOfEvent.coding.display
healthcareservice:system | AuditEvent.purposeOfEvent.coding.system
healthcareservice:assigner | 
**PurposeUse** | 
purpose:id | AuditEvent.purposeOfEvent.coding.code
purpose:name | AuditEvent.purposeOfEvent.coding.display
purpose:system | AuditEvent.purposeOfEvent.coding.system
purpose:description | AuditEvent.purposeOfEvent.text
purpose:reason | ????
**PurposeUse-local** | 
purpose-local:id | AuditEvent.agent[user].purposeOUse.coding.code
purpose-local:name | AuditEvent.agent[user].purposeOfUse.coding.display
purpose-local:system | AuditEvent.agent[user].purposeOfUse.coding.system
purpose-local:description | AuditEvent.agent[user].purposeOfUse.text
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
**subject-assurance** | 
subject:assurance-level:id | AuditEvent.agent[user].extension[assurance-level].coding.code
subject:assurance-level:name | AuditEvent.agent[user].extension[assurance-level].coding.display
subject:assurance-level:system | AuditEvent.agent[user].extension[assurance-level].coding.system
subject:assurance-level:assigner | 
**organization** | 
subject:organization-id:  | *AuditEvent.agent[userorg].who.identifier.value*
subject:organization-name | *AuditEvent.agent[userorg].who.display*
subject:organization-system | *AuditEvent.agent[userorg].who.identifier.system*
subject:organization-assigner | *AuditEvent.agent[userorg].who.identifier.assigner*
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
**Patient** | 
resource:id | _AuditEvent.entity[patient].what.identifier.value_
resource:name | _AuditEvent.entity[patient].what.display_
resource:system | _AuditEvent.entity[patient].what.identifier.system_
**Patient-child-org** | 
resource:child-organization:id  | AuditEvent.entity[patient].detail[child-organization-id]
resource:child-organization:name | AuditEvent.entity[patient].detail[child-organization-name]
resource:child-organization:system | AuditEvent.entity[patient].detail[child-organization-system]
**Patient-facility** | 
resource:facility:id | AuditEvent.entity[patient].detail[facility-id]
resource:facility:name | AuditEvent.entity[patient].detail[facility-name]
resource:facility:system | AuditEvent.entity[patient].detail[facility-system]
**Patient-consent** | 
resource:patient-consent-directive  | _AuditEvent.agent[user].policy_
resource:patient-consent-directive-type | 
{:.grid}

### Profile

* [StructureDefinition profile for Basic AuditEvent pattern for Comprehensive Norway](StructureDefinition-IHE.BasicAudit.SAMLaccessTokenUse.Comprehensive.Norway.html)
  * [examples](StructureDefinition-IHE.BasicAudit.SAMLaccessTokenUse.Comprehensive.Norway-examples.html)
  
### TODO

- TODO-unknown-example: some examples did not have defined terms
  - hso:country --> TODO put into agent[user].location
  - hso:scope -- SAML replication of the predicate oauth scope -- TODO define two core extensions audience, and scope (String)
  - patient-consent -- would use the core 
- is it really necessary to slice the OtherId element? Or is it sufficient to just indicate the set of SAML attributes that get assembled in the otherId bucket. The result will look the same, but the modeling would not have slicing to show this.
  - I did not understand the comment on multiple OtherId elements. My question is on if slices need to be defined. This is independent of if there can be multiple instances of OtherId. The idea I am proposing is that the slices are not necessary, given that the various identifiers that would go into OtherId(s) all are self explanatory. The slices do not help with reading an AuditEvent. Slices are used to drive mandatory population. Thus we can explain where to place each identifier from the SAML assertion without defining a slice. One would only define a slice when one kind of these identifiers is mandatory.
- should I define a mapping table? Would be yet-another-place where these tables would go. If they existed on the mapping table, would they be needed elsewhere? Trying to keep them all aligned is hard work.
  - On the structureDefinition page is a "Mapping" tab, that can have a table expressing the mapping of elements. Much like the narrative above. The drawback is that this format of this table is very restricted. The benefit is that some tooling might be able to use it in a computable way.
- purposeOfUse:reason -- is important to preserve. TODO add extension to CodeableConcept to hold reason.
- possibly other "TODO"
- possibly other "?"
- resource:patient-consent-directive  and resource:patient-consent-directive-type
  - should this be modeled the same way IHE models bppc?