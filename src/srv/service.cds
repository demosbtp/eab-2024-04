using { eab2024 as my } from '../db/schema.cds';

@path: '/service/eab'
@requires: 'authenticated-user'
service eabService {
  @odata.draft.enabled
  entity Guitars as projection on my.Guitars;
  @odata.draft.enabled
  entity Customers as projection on my.Customers;
  @odata.draft.enabled
  entity Orders as projection on my.Orders;
}