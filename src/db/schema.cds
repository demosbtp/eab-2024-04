namespace namespace;

entity Guitar {
  key ID: UUID;
  brand: String(100);
  model: String(100);
  color: String(50);
  price: Decimal(10,2);
  inStock: Boolean;
  owner: Association to RockStar;
  category: Association to Category;
}

entity RockStar {
  key ID: UUID;
  name: String(100) @assert.unique @mandatory;
  genre: String(50);
  age: Integer;
  netWorth: Decimal(10,2);
  guitars: Association to many Guitar on guitars.owner = $self;
  band: Association to Band;
}

entity Category {
  key ID: UUID;
  name: String(50) @assert.unique @mandatory;
  description: String(100);
  guitars: Association to many Guitar on guitars.category = $self;
  band: Association to Band;
}

entity Band {
  key ID: UUID;
  name: String(100) @assert.unique @mandatory;
  genre: String(50);
  foundingYear: Integer;
  members: Association to many RockStar on members.band = $self;
  category: Association to Category;
}

