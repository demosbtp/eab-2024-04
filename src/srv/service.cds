using { food as my } from '../db/schema.cds';

@path: '/service/food'
@requires: 'authenticated-user'
service foodService {
  @odata.draft.enabled
  entity Dishes as projection on my.Dishes;
  @odata.draft.enabled
  entity Categories as projection on my.Categories;
  @odata.draft.enabled
  entity Reviews as projection on my.Reviews;
}