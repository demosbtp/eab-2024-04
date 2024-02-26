using { eabtest2 } from '../srv/service.cds';

annotate eabtest2.Guitars with @UI.HeaderInfo: { TypeName: 'Guitar', TypeNamePlural: 'Guitars' };
annotate eabtest2.Guitars with {
  category @Common.ValueList: {
    CollectionPath: 'Categories',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: category_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'description'
      },
    ],
  }
};
annotate eabtest2.Guitars with @UI.DataPoint #brand: {
  Value: brand,
  Title: 'Brand',
};
annotate eabtest2.Guitars with @UI.DataPoint #model: {
  Value: model,
  Title: 'Model',
};
annotate eabtest2.Guitars with @UI.DataPoint #price: {
  Value: price,
  Title: 'Price',
};
annotate eabtest2.Guitars with {
  brand @title: 'Brand';
  model @title: 'Model';
  price @title: 'Price';
  description @title: 'Description';
  quantity @title: 'Quantity'
};

annotate eabtest2.Guitars with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: brand },
    { $Type: 'UI.DataField', Value: model },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: quantity },
    { $Type: 'UI.DataField', Label: 'Category', Value: category_ID }
];

annotate eabtest2.Guitars with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: brand },
    { $Type: 'UI.DataField', Value: model },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: quantity },
    { $Type: 'UI.DataField', Label: 'Category', Value: category_ID }
  ]
};

annotate eabtest2.Guitars with {
  category @Common.Text: { $value: category.name, ![@UI.TextArrangement]: #TextOnly }
};

annotate eabtest2.Guitars with {
  category @Common.Label: 'Category';
  orderItems @Common.Label: 'Order Items'
};

annotate eabtest2.Guitars with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#brand' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#model' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#price' }
];

annotate eabtest2.Guitars with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate eabtest2.Guitars with @UI.SelectionFields: [
  category_ID
];

annotate eabtest2.Categories with @UI.HeaderInfo: { TypeName: 'Category', TypeNamePlural: 'Categories', Title: { Value: name } };
annotate eabtest2.Categories with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate eabtest2.Categories with @UI.Identification: [{ Value: name }];
annotate eabtest2.Categories with {
  name @title: 'Name';
  description @title: 'Description'
};

annotate eabtest2.Categories with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: description }
];

annotate eabtest2.Categories with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: description }
  ]
};

annotate eabtest2.Categories with {
  guitars @Common.Label: 'Guitars'
};

annotate eabtest2.Categories with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate eabtest2.Categories with @UI.SelectionFields: [
  name
];

annotate eabtest2.OrderItems with @UI.HeaderInfo: { TypeName: 'Order Item', TypeNamePlural: 'Order Items' };
annotate eabtest2.OrderItems with {
  guitar @Common.ValueList: {
    CollectionPath: 'Guitars',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: guitar_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'brand'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'model'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'price'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'description'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'quantity'
      },
    ],
  }
};
annotate eabtest2.OrderItems with {
  order @Common.ValueList: {
    CollectionPath: 'Orders',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: order_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'orderDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalPrice'
      },
    ],
  }
};
annotate eabtest2.OrderItems with @UI.DataPoint #quantity: {
  Value: quantity,
  Title: 'Quantity',
};
annotate eabtest2.OrderItems with @UI.DataPoint #price: {
  Value: price,
  Title: 'Price',
};
annotate eabtest2.OrderItems with {
  quantity @title: 'Quantity';
  price @title: 'Price'
};

annotate eabtest2.OrderItems with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: quantity },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Label: 'Guitar', Value: guitar_ID }
];

annotate eabtest2.OrderItems with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: quantity },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Label: 'Guitar', Value: guitar_ID }
  ]
};

annotate eabtest2.OrderItems with {
  guitar @Common.Label: 'Guitar';
  order @Common.Label: 'Order'
};

annotate eabtest2.OrderItems with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#quantity' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#price' }
];

annotate eabtest2.OrderItems with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate eabtest2.OrderItems with @UI.SelectionFields: [
  guitar_ID,
  order_ID
];

annotate eabtest2.Orders with @UI.HeaderInfo: { TypeName: 'Order', TypeNamePlural: 'Orders' };
annotate eabtest2.Orders with @UI.DataPoint #orderDate: {
  Value: orderDate,
  Title: 'Order Date',
};
annotate eabtest2.Orders with @UI.DataPoint #totalPrice: {
  Value: totalPrice,
  Title: 'Total Price',
};
annotate eabtest2.Orders with {
  orderDate @title: 'Order Date';
  totalPrice @title: 'Total Price'
};

annotate eabtest2.Orders with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: orderDate },
    { $Type: 'UI.DataField', Value: totalPrice }
];

annotate eabtest2.Orders with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: orderDate },
    { $Type: 'UI.DataField', Value: totalPrice }
  ]
};

annotate eabtest2.Orders with {
  orderItems @Common.Label: 'Order Items'
};

annotate eabtest2.Orders with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#orderDate' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#totalPrice' }
];

annotate eabtest2.Orders with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' },
  { $Type : 'UI.ReferenceFacet', ID : 'OrderItems', Target : 'orderItems/@UI.LineItem' }
];

