namespace namespace;

entity Guitars {
  key ID: UUID;
  brand: String(50);
  model: String(50);
  color: String(20);
  price: Decimal(10,2);
  year: Integer;
  serialNumber: String(50);
  owner: Association to RockStars;
  category: Association to Categories;
}

entity RockStars {
  key ID: UUID;
  name: String(100) @assert.unique @mandatory;
  age: Integer;
  nationality: String(50);
  netWorth: Decimal(15,2);
  guitars: Association to many Guitars on guitars.owner = $self;
}

entity Categories {
  key ID: UUID;
  name: String(50) @assert.unique @mandatory;
  description: String(100);
  guitars: Association to many Guitars on guitars.category = $self;
}

