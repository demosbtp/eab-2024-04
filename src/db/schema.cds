namespace food;

entity Dishes {
  key ID: UUID;
  name: String(100) @assert.unique @mandatory;
  description: String(500);
  price: Decimal(8,2);
  ingredients: String(500);
  spicinessLevel: Integer;
  isVegetarian: Boolean;
  category: Association to Categories;
  reviews: Association to many Reviews on reviews.dish = $self;
}

entity Categories {
  key ID: UUID;
  name: String(50) @assert.unique @mandatory;
  description: String(100);
  dishes: Association to many Dishes on dishes.category = $self;
}

entity Reviews {
  key ID: UUID;
  title: String(100) @assert.unique @mandatory;
  description: String(500);
  rating: Integer;
  dish: Association to Dishes;
}

