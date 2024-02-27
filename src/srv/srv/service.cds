using { eab1 as my } from '../db/schema.cds';

@path: '/service/eab'
@requires: 'authenticated-user'
service eabService {
  @odata.draft.enabled
  entity Guitars as projection on my.Guitars;
  @odata.draft.enabled
  entity Categories as projection on my.Categories;
  @odata.draft.enabled
  entity Owners as projection on my.Owners;
}