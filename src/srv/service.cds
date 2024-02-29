using { guitars as my } from '../db/schema.cds';

@path: '/service/guitar'
@requires: 'authenticated-user'
service guitarService {
  @odata.draft.enabled
  entity Guitars as projection on my.Guitars;
  @odata.draft.enabled
  entity Bands as projection on my.Bands;
}