namespace eab1;

entity Guitars {
  key ID: UUID;
  brand: String(50);
  model: String(50);
  price: Decimal(10,2);
  color: String(20);
  year: Integer;
  category: Association to Categories;
  owner: Association to Owners;
}

entity Categories {
  key ID: UUID;
  name: String(50) @assert.unique @mandatory;
  description: String(100);
  guitars: Association to many Guitars on guitars.category = $self;
}

entity Owners {
  key ID: UUID;
  name: String(50) @assert.unique @mandatory;
  email: String(100);
  phone: String(20);
  guitars: Association to many Guitars on guitars.owner = $self;
}

