namespace eab2024;

entity Guitars {
  key ID: UUID;
  brand: String(50);
  model: String(50);
  color: String(20);
  price: Decimal(10,2);
  description: String(500);
}

entity Customers {
  key ID: UUID;
  firstName: String(50);
  lastName: String(50);
  email: String(100);
  phone: String(20);
  address: String(200);
}

entity Orders {
  key ID: UUID;
  orderNumber: String(20);
  orderDate: Date;
  totalAmount: Decimal(10,2);
  status: String(20);
  customer: Association to Customers;
}

