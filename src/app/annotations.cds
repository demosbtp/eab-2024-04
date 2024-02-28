using { namespace } from '../srv/service.cds';

annotate namespace.Guitar with @UI.HeaderInfo: { TypeName: 'Guitar', TypeNamePlural: 'Guitars' };
annotate namespace.Guitar with {
  owner @Common.ValueList: {
    CollectionPath: 'RockStar',
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
        ValueListProperty: 'genre'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'age'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'netWorth'
      },
    ],
  }
};
annotate namespace.Guitar with {
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
annotate namespace.Guitar with @UI.DataPoint #brand: {
  Value: brand,
  Title: 'Brand',
};
annotate namespace.Guitar with @UI.DataPoint #model: {
  Value: model,
  Title: 'Model',
};
annotate namespace.Guitar with @UI.DataPoint #price: {
  Value: price,
  Title: 'Price',
};
annotate namespace.Guitar with {
  brand @title: 'Brand';
  model @title: 'Model';
  color @title: 'Color';
  price @title: 'Price';
  inStock @title: 'In Stock'
};

annotate namespace.Guitar with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: brand },
    { $Type: 'UI.DataField', Value: model },
    { $Type: 'UI.DataField', Value: color },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Value: inStock },
    { $Type: 'UI.DataField', Label: 'Rock Star', Value: owner_ID },
    { $Type: 'UI.DataField', Label: 'Category', Value: category_ID }
];

annotate namespace.Guitar with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: brand },
    { $Type: 'UI.DataField', Value: model },
    { $Type: 'UI.DataField', Value: color },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Value: inStock },
    { $Type: 'UI.DataField', Label: 'Rock Star', Value: owner_ID },
    { $Type: 'UI.DataField', Label: 'Category', Value: category_ID }
  ]
};

annotate namespace.Guitar with {
  owner @Common.Text: { $value: owner.name, ![@UI.TextArrangement]: #TextOnly };
  category @Common.Text: { $value: category.name, ![@UI.TextArrangement]: #TextOnly }
};

annotate namespace.Guitar with {
  owner @Common.Label: 'Rock Star';
  category @Common.Label: 'Category'
};

annotate namespace.Guitar with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#brand' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#model' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#price' }
];

annotate namespace.Guitar with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate namespace.Guitar with @UI.SelectionFields: [
  owner_ID,
  category_ID
];

annotate namespace.RockStar with @UI.HeaderInfo: { TypeName: 'Rock Star', TypeNamePlural: 'Rock Stars', Title: { Value: name } };
annotate namespace.RockStar with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate namespace.RockStar with @UI.Identification: [{ Value: name }];
annotate namespace.RockStar with {
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
        ValueListProperty: 'foundingYear'
      },
    ],
  }
};
annotate namespace.RockStar with {
  genre @title: 'Genre';
  age @title: 'Age';
  netWorth @title: 'Net Worth'
};

annotate namespace.RockStar with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: genre },
    { $Type: 'UI.DataField', Value: age },
    { $Type: 'UI.DataField', Value: netWorth },
    { $Type: 'UI.DataField', Label: 'Band', Value: band_ID }
];

annotate namespace.RockStar with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: genre },
    { $Type: 'UI.DataField', Value: age },
    { $Type: 'UI.DataField', Value: netWorth },
    { $Type: 'UI.DataField', Label: 'Band', Value: band_ID }
  ]
};

annotate namespace.RockStar with {
  band @Common.Text: { $value: band.name, ![@UI.TextArrangement]: #TextOnly }
};

annotate namespace.RockStar with {
  guitars @Common.Label: 'Guitars';
  band @Common.Label: 'Band'
};

annotate namespace.RockStar with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate namespace.RockStar with @UI.SelectionFields: [
  band_ID
];

annotate namespace.Category with @UI.HeaderInfo: { TypeName: 'Category', TypeNamePlural: 'Categories', Title: { Value: name } };
annotate namespace.Category with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate namespace.Category with @UI.Identification: [{ Value: name }];
annotate namespace.Category with {
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
        ValueListProperty: 'foundingYear'
      },
    ],
  }
};
annotate namespace.Category with {
  description @title: 'Description'
};

annotate namespace.Category with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Label: 'Band', Value: band_ID }
];

annotate namespace.Category with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Label: 'Band', Value: band_ID }
  ]
};

annotate namespace.Category with {
  band @Common.Text: { $value: band.name, ![@UI.TextArrangement]: #TextOnly }
};

annotate namespace.Category with {
  guitars @Common.Label: 'Guitars';
  band @Common.Label: 'Band'
};

annotate namespace.Category with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate namespace.Category with @UI.SelectionFields: [
  band_ID
];

annotate namespace.Band with @UI.HeaderInfo: { TypeName: 'Band', TypeNamePlural: 'Bands', Title: { Value: name } };
annotate namespace.Band with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate namespace.Band with @UI.Identification: [{ Value: name }];
annotate namespace.Band with {
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
annotate namespace.Band with {
  name @title: 'Name';
  genre @title: 'Genre';
  foundingYear @title: 'Founding Year'
};

annotate namespace.Band with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: genre },
    { $Type: 'UI.DataField', Value: foundingYear },
    { $Type: 'UI.DataField', Label: 'Category', Value: category_ID }
];

annotate namespace.Band with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: genre },
    { $Type: 'UI.DataField', Value: foundingYear },
    { $Type: 'UI.DataField', Label: 'Category', Value: category_ID }
  ]
};

annotate namespace.Band with {
  category @Common.Text: { $value: category.name, ![@UI.TextArrangement]: #TextOnly }
};

annotate namespace.Band with {
  members @Common.Label: 'Rock Stars';
  category @Common.Label: 'Category'
};

annotate namespace.Band with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate namespace.Band with @UI.SelectionFields: [
  category_ID
];

