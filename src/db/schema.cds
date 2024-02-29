namespace guitars;

entity Guitars {
  key ID: UUID;
  brand: String(50);
  model: String(50);
  color: String(20);
  price: Decimal(10,2);
  inStock: Boolean;
}

entity Bands {
  key ID: UUID;
  name: String(100);
  genre: String(50);
  yearFormed: Integer;
  country: String(50);
  members: Composition of many BandMembers on members.band = $self;
}

entity BandMembers {
  key ID: UUID;
  name: String(100);
  instrument: String(50);
  age: Integer;
  experience: String(100);
  band: Association to Bands;
}

