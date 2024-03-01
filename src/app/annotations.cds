using { guitars } from '../srv/service.cds';

annotate guitars.Guitar with @UI.HeaderInfo: { TypeName: 'Guitar', TypeNamePlural: 'Guitars' };
annotate guitars.Guitar with {
  band @Common.ValueList: {
    CollectionPath: 'Band',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: band_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'genre'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'location'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'contactEmail'
      },
    ],
  }
};
annotate guitars.Guitar with {
  category @Common.ValueList: {
    CollectionPath: 'Category',
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
annotate guitars.Guitar with @UI.DataPoint #brand: {
  Value: brand,
  Title: 'Brand',
};
annotate guitars.Guitar with @UI.DataPoint #model: {
  Value: model,
  Title: 'Model',
};
annotate guitars.Guitar with @UI.DataPoint #price: {
  Value: price,
  Title: 'Price',
};
annotate guitars.Guitar with {
  brand @title: 'Brand';
  model @title: 'Model';
  color @title: 'Color';
  price @title: 'Price';
  inStock @title: 'In Stock'
};

annotate guitars.Guitar with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: brand },
    { $Type: 'UI.DataField', Value: model },
    { $Type: 'UI.DataField', Value: color },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Value: inStock },
    { $Type: 'UI.DataField', Label: 'Band', Value: band_ID },
    { $Type: 'UI.DataField', Label: 'Category', Value: category_ID }
];

annotate guitars.Guitar with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: brand },
    { $Type: 'UI.DataField', Value: model },
    { $Type: 'UI.DataField', Value: color },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Value: inStock },
    { $Type: 'UI.DataField', Label: 'Band', Value: band_ID },
    { $Type: 'UI.DataField', Label: 'Category', Value: category_ID }
  ]
};

annotate guitars.Guitar with {
  band @Common.Text: { $value: band.name, ![@UI.TextArrangement]: #TextOnly };
  category @Common.Text: { $value: category.name, ![@UI.TextArrangement]: #TextOnly }
};

annotate guitars.Guitar with {
  band @Common.Label: 'Band';
  category @Common.Label: 'Category'
};

annotate guitars.Guitar with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#brand' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#model' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#price' }
];

annotate guitars.Guitar with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate guitars.Guitar with @UI.SelectionFields: [
  band_ID,
  category_ID
];

annotate guitars.Band with @UI.HeaderInfo: { TypeName: 'Band', TypeNamePlural: 'Bands', Title: { Value: name } };
annotate guitars.Band with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate guitars.Band with @UI.Identification: [{ Value: name }];
annotate guitars.Band with {
  category @Common.ValueList: {
    CollectionPath: 'Category',
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
annotate guitars.Band with {
  name @title: 'Name';
  genre @title: 'Genre';
  location @title: 'Location';
  contactEmail @title: 'Contact Email'
};

annotate guitars.Band with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: genre },
    { $Type: 'UI.DataField', Value: location },
    { $Type: 'UI.DataField', Value: contactEmail },
    { $Type: 'UI.DataField', Label: 'Category', Value: category_ID }
];

annotate guitars.Band with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: genre },
    { $Type: 'UI.DataField', Value: location },
    { $Type: 'UI.DataField', Value: contactEmail },
    { $Type: 'UI.DataField', Label: 'Category', Value: category_ID }
  ]
};

annotate guitars.Band with {
  category @Common.Text: { $value: category.name, ![@UI.TextArrangement]: #TextOnly }
};

annotate guitars.Band with {
  guitars @Common.Label: 'Guitars';
  category @Common.Label: 'Category'
};

annotate guitars.Band with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate guitars.Band with @UI.SelectionFields: [
  category_ID
];

annotate guitars.Category with @UI.HeaderInfo: { TypeName: 'Category', TypeNamePlural: 'Categories', Title: { Value: name } };
annotate guitars.Category with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate guitars.Category with @UI.Identification: [{ Value: name }];
annotate guitars.Category with {
  name @title: 'Name';
  description @title: 'Description'
};

annotate guitars.Category with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: description }
];

annotate guitars.Category with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: description }
  ]
};

annotate guitars.Category with {
  guitars @Common.Label: 'Guitars';
  bands @Common.Label: 'Bands'
};

annotate guitars.Category with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate guitars.Category with @UI.SelectionFields: [
  name
];

