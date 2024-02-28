using { namespace as my } from '../db/schema.cds';

@path: '/service/servicename'
@requires: 'authenticated-user'
service servicenameService {
  @odata.draft.enabled
  entity Guitars as projection on my.Guitars;
  @odata.draft.enabled
  entity RockStars as projection on my.RockStars;
  @odata.draft.enabled
  entity Categories as projection on my.Categories;
}