namespace guitars;

entity Guitar {
  key ID: UUID;
  brand: String(50);
  model: String(50);
  color: String(20);
  price: Decimal(10,2);
  inStock: Boolean;
  band: Association to Band;
  category: Association to Category;
}

entity Band {
  key ID: UUID;
  name: String(100) @assert.unique @mandatory;
  genre: String(50);
  location: String(100);
  contactEmail: String(100);
  guitars: Association to many Guitar on guitars.band = $self;
  category: Association to Category;
}

entity Category {
  key ID: UUID;
  name: String(50) @assert.unique @mandatory;
  description: String(100);
  guitars: Association to many Guitar on guitars.category = $self;
  bands: Association to many Band on bands.category = $self;
}

