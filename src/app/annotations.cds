using { eab2024 } from '../srv/service.cds';

annotate eab2024.Guitars with @UI.HeaderInfo: { TypeName: 'Guitar', TypeNamePlural: 'Guitars' };
annotate eab2024.Guitars with @UI.DataPoint #brand: {
  Value: brand,
  Title: 'Brand',
};
annotate eab2024.Guitars with @UI.DataPoint #model: {
  Value: model,
  Title: 'Model',
};
annotate eab2024.Guitars with @UI.DataPoint #price: {
  Value: price,
  Title: 'Price',
};
annotate eab2024.Guitars with {
  brand @title: 'Brand';
  model @title: 'Model';
  color @title: 'Color';
  price @title: 'Price';
  description @title: 'Description'
};

annotate eab2024.Guitars with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: brand },
    { $Type: 'UI.DataField', Value: model },
    { $Type: 'UI.DataField', Value: color },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Value: description }
];

annotate eab2024.Guitars with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: brand },
    { $Type: 'UI.DataField', Value: model },
    { $Type: 'UI.DataField', Value: color },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Value: description }
  ]
};

annotate eab2024.Guitars with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#brand' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#model' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#price' }
];

annotate eab2024.Guitars with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate eab2024.Customers with @UI.HeaderInfo: { TypeName: 'Customer', TypeNamePlural: 'Customers' };
annotate eab2024.Customers with @UI.DataPoint #firstName: {
  Value: firstName,
  Title: 'First Name',
};
annotate eab2024.Customers with @UI.DataPoint #lastName: {
  Value: lastName,
  Title: 'Last Name',
};
annotate eab2024.Customers with @UI.DataPoint #email: {
  Value: email,
  Title: 'Email',
};
annotate eab2024.Customers with {
  firstName @title: 'First Name';
  lastName @title: 'Last Name';
  email @title: 'Email';
  phone @title: 'Phone';
  address @title: 'Address'
};

annotate eab2024.Customers with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: firstName },
    { $Type: 'UI.DataField', Value: lastName },
    { $Type: 'UI.DataField', Value: email },
    { $Type: 'UI.DataField', Value: phone },
    { $Type: 'UI.DataField', Value: address }
];

annotate eab2024.Customers with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: firstName },
    { $Type: 'UI.DataField', Value: lastName },
    { $Type: 'UI.DataField', Value: email },
    { $Type: 'UI.DataField', Value: phone },
    { $Type: 'UI.DataField', Value: address }
  ]
};

annotate eab2024.Customers with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#firstName' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#lastName' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#email' }
];

annotate eab2024.Customers with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate eab2024.Orders with @UI.HeaderInfo: { TypeName: 'Order', TypeNamePlural: 'Orders' };
annotate eab2024.Orders with {
  customer @Common.ValueList: {
    CollectionPath: 'Customers',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: customer_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'firstName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'lastName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'email'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'phone'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'address'
      },
    ],
  }
};
annotate eab2024.Orders with @UI.DataPoint #orderNumber: {
  Value: orderNumber,
  Title: 'Order Number',
};
annotate eab2024.Orders with @UI.DataPoint #orderDate: {
  Value: orderDate,
  Title: 'Order Date',
};
annotate eab2024.Orders with @UI.DataPoint #totalAmount: {
  Value: totalAmount,
  Title: 'Total Amount',
};
annotate eab2024.Orders with {
  orderNumber @title: 'Order Number';
  orderDate @title: 'Order Date';
  totalAmount @title: 'Total Amount';
  status @title: 'Status'
};

annotate eab2024.Orders with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: orderNumber },
    { $Type: 'UI.DataField', Value: orderDate },
    { $Type: 'UI.DataField', Value: totalAmount },
    { $Type: 'UI.DataField', Value: status },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customer_ID }
];

annotate eab2024.Orders with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: orderNumber },
    { $Type: 'UI.DataField', Value: orderDate },
    { $Type: 'UI.DataField', Value: totalAmount },
    { $Type: 'UI.DataField', Value: status },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customer_ID }
  ]
};

annotate eab2024.Orders with {
  customer @Common.Label: 'Customer'
};

annotate eab2024.Orders with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#orderNumber' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#orderDate' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#totalAmount' }
];

annotate eab2024.Orders with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate eab2024.Orders with @UI.SelectionFields: [
  customer_ID
];

