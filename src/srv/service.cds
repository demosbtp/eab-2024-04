using { eabtest2 as my } from '../db/schema.cds';

@path: '/service/eabtest2'
@requires: 'authenticated-user'
service eabtest2Service {
  @odata.draft.enabled
  entity Guitars as projection on my.Guitars;
  @odata.draft.enabled
  entity Categories as projection on my.Categories;
  @odata.draft.enabled
  entity Orders as projection on my.Orders;
}