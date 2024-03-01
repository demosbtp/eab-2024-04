using { guitars as my } from '../db/schema.cds';

@path: '/service/guitar'
@requires: 'authenticated-user'
service guitarService {
  @odata.draft.enabled
  entity Guitar as projection on my.Guitar;
  @odata.draft.enabled
  entity Band as projection on my.Band;
  @odata.draft.enabled
  entity Category as projection on my.Category;
}