namespace eabtest2;

entity Guitars {
  key ID: UUID;
  brand: String(50);
  model: String(50);
  price: Decimal(8,2);
  description: String(500);
  quantity: Integer;
  category: Association to Categories;
  orderItems: Association to many OrderItems on orderItems.guitar = $self;
}

entity Categories {
  key ID: UUID;
  name: String(50) @assert.unique @mandatory;
  description: String(100);
  guitars: Association to many Guitars on guitars.category = $self;
}

entity OrderItems {
  key ID: UUID;
  quantity: Integer;
  price: Decimal(8,2);
  guitar: Association to Guitars;
  order: Association to Orders;
}

entity Orders {
  key ID: UUID;
  orderDate: Date;
  totalPrice: Decimal(10,2);
  orderItems: Composition of many OrderItems on orderItems.order = $self;
}

