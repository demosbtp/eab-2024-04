using { namespace as my } from '../db/schema.cds';

@path: '/service/servicename'
@requires: 'authenticated-user'
service servicenameService {
  @odata.draft.enabled
  entity Guitar as projection on my.Guitar;
  @odata.draft.enabled
  entity RockStar as projection on my.RockStar;
  @odata.draft.enabled
  entity Category as projection on my.Category;
  @odata.draft.enabled
  entity Band as projection on my.Band;
}