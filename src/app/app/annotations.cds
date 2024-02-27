using { eab1 } from '../srv/service.cds';

annotate eab1.Guitars with @UI.HeaderInfo: { TypeName: 'Guitar', TypeNamePlural: 'Guitars' };
annotate eab1.Guitars with {
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
annotate eab1.Guitars with {
  owner @Common.ValueList: {
    CollectionPath: 'Owners',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: owner_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'email'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'phone'
      },
    ],
  }
};
annotate eab1.Guitars with @UI.DataPoint #brand: {
  Value: brand,
  Title: 'Brand',
};
annotate eab1.Guitars with @UI.DataPoint #model: {
  Value: model,
  Title: 'Model',
};
annotate eab1.Guitars with @UI.DataPoint #price: {
  Value: price,
  Title: 'Price',
};
annotate eab1.Guitars with {
  brand @title: 'Brand';
  model @title: 'Model';
  price @title: 'Price';
  color @title: 'Color';
  year @title: 'Year'
};

annotate eab1.Guitars with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: brand },
    { $Type: 'UI.DataField', Value: model },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Value: color },
    { $Type: 'UI.DataField', Value: year },
    { $Type: 'UI.DataField', Label: 'Category', Value: category_ID },
    { $Type: 'UI.DataField', Label: 'Owner', Value: owner_ID }
];

annotate eab1.Guitars with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: brand },
    { $Type: 'UI.DataField', Value: model },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Value: color },
    { $Type: 'UI.DataField', Value: year },
    { $Type: 'UI.DataField', Label: 'Category', Value: category_ID },
    { $Type: 'UI.DataField', Label: 'Owner', Value: owner_ID }
  ]
};

annotate eab1.Guitars with {
  category @Common.Text: { $value: category.name, ![@UI.TextArrangement]: #TextOnly };
  owner @Common.Text: { $value: owner.name, ![@UI.TextArrangement]: #TextOnly }
};

annotate eab1.Guitars with {
  category @Common.Label: 'Category';
  owner @Common.Label: 'Owner'
};

annotate eab1.Guitars with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#brand' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#model' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#price' }
];

annotate eab1.Guitars with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate eab1.Guitars with @UI.SelectionFields: [
  category_ID,
  owner_ID
];

annotate eab1.Categories with @UI.HeaderInfo: { TypeName: 'Category', TypeNamePlural: 'Categories', Title: { Value: name } };
annotate eab1.Categories with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate eab1.Categories with @UI.Identification: [{ Value: name }];
annotate eab1.Categories with {
  description @title: 'Description'
};

annotate eab1.Categories with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: description }
];

annotate eab1.Categories with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: description }
  ]
};

annotate eab1.Categories with {
  guitars @Common.Label: 'Guitars'
};

annotate eab1.Categories with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate eab1.Categories with @UI.SelectionFields: [
  name
];

annotate eab1.Owners with @UI.HeaderInfo: { TypeName: 'Owner', TypeNamePlural: 'Owners', Title: { Value: name } };
annotate eab1.Owners with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate eab1.Owners with @UI.Identification: [{ Value: name }];
annotate eab1.Owners with @UI.DataPoint #email: {
  Value: email,
  Title: 'Email',
};
annotate eab1.Owners with {
  email @title: 'Email';
  phone @title: 'Phone'
};

annotate eab1.Owners with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: email },
    { $Type: 'UI.DataField', Value: phone }
];

annotate eab1.Owners with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: email },
    { $Type: 'UI.DataField', Value: phone }
  ]
};

annotate eab1.Owners with {
  guitars @Common.Label: 'Guitars'
};

annotate eab1.Owners with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#email' }
];

annotate eab1.Owners with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate eab1.Owners with @UI.SelectionFields: [
  name
];

