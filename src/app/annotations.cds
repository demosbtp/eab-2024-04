using { eab } from '../srv/service.cds';

annotate eab.Guitar with @UI.HeaderInfo: { TypeName: 'Guitar', TypeNamePlural: 'Guitars' };
annotate eab.Guitar with {
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
        ValueListProperty: 'yearFormed'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'website'
      },
    ],
  }
};
annotate eab.Guitar with {
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
annotate eab.Guitar with @UI.DataPoint #brand: {
  Value: brand,
  Title: 'Brand',
};
annotate eab.Guitar with @UI.DataPoint #model: {
  Value: model,
  Title: 'Model',
};
annotate eab.Guitar with @UI.DataPoint #price: {
  Value: price,
  Title: 'Price',
};
annotate eab.Guitar with {
  brand @title: 'Brand';
  model @title: 'Model';
  color @title: 'Color';
  price @title: 'Price';
  inStock @title: 'In Stock'
};

annotate eab.Guitar with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: brand },
    { $Type: 'UI.DataField', Value: model },
    { $Type: 'UI.DataField', Value: color },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Value: inStock },
    { $Type: 'UI.DataField', Label: 'Band', Value: band_ID },
    { $Type: 'UI.DataField', Label: 'Category', Value: category_ID }
];

annotate eab.Guitar with @UI.FieldGroup #Main: {
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

annotate eab.Guitar with {
  band @Common.Text: { $value: band.name, ![@UI.TextArrangement]: #TextOnly };
  category @Common.Text: { $value: category.name, ![@UI.TextArrangement]: #TextOnly }
};

annotate eab.Guitar with {
  band @Common.Label: 'Band';
  category @Common.Label: 'Category'
};

annotate eab.Guitar with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#brand' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#model' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#price' }
];

annotate eab.Guitar with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate eab.Guitar with @UI.SelectionFields: [
  band_ID,
  category_ID
];

annotate eab.Band with @UI.HeaderInfo: { TypeName: 'Band', TypeNamePlural: 'Bands', Title: { Value: name } };
annotate eab.Band with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate eab.Band with @UI.Identification: [{ Value: name }];
annotate eab.Band with {
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
annotate eab.Band with {
  name @title: 'Name';
  genre @title: 'Genre';
  yearFormed @title: 'Year Formed';
  website @title: 'Website'
};

annotate eab.Band with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: genre },
    { $Type: 'UI.DataField', Value: yearFormed },
    { $Type: 'UI.DataField', Value: website },
    { $Type: 'UI.DataField', Label: 'Category', Value: category_ID }
];

annotate eab.Band with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: genre },
    { $Type: 'UI.DataField', Value: yearFormed },
    { $Type: 'UI.DataField', Value: website },
    { $Type: 'UI.DataField', Label: 'Category', Value: category_ID }
  ]
};

annotate eab.Band with {
  category @Common.Text: { $value: category.name, ![@UI.TextArrangement]: #TextOnly }
};

annotate eab.Band with {
  guitars @Common.Label: 'Guitars';
  category @Common.Label: 'Category'
};

annotate eab.Band with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate eab.Band with @UI.SelectionFields: [
  category_ID
];

annotate eab.Category with @UI.HeaderInfo: { TypeName: 'Category', TypeNamePlural: 'Categories', Title: { Value: name } };
annotate eab.Category with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate eab.Category with @UI.Identification: [{ Value: name }];
annotate eab.Category with {
  name @title: 'Name';
  description @title: 'Description'
};

annotate eab.Category with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: description }
];

annotate eab.Category with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: description }
  ]
};

annotate eab.Category with {
  guitars @Common.Label: 'Guitars';
  bands @Common.Label: 'Bands'
};

annotate eab.Category with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate eab.Category with @UI.SelectionFields: [
  name
];

