using { namespace } from '../srv/service.cds';

annotate namespace.Guitars with @UI.HeaderInfo: { TypeName: 'Guitar', TypeNamePlural: 'Guitars' };
annotate namespace.Guitars with {
  owner @Common.ValueList: {
    CollectionPath: 'RockStars',
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
        ValueListProperty: 'age'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'nationality'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'netWorth'
      },
    ],
  }
};
annotate namespace.Guitars with {
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
annotate namespace.Guitars with @UI.DataPoint #brand: {
  Value: brand,
  Title: 'Brand',
};
annotate namespace.Guitars with @UI.DataPoint #model: {
  Value: model,
  Title: 'Model',
};
annotate namespace.Guitars with @UI.DataPoint #price: {
  Value: price,
  Title: 'Price',
};
annotate namespace.Guitars with {
  brand @title: 'Brand';
  model @title: 'Model';
  color @title: 'Color';
  price @title: 'Price';
  year @title: 'Year';
  serialNumber @title: 'Serial Number'
};

annotate namespace.Guitars with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: brand },
    { $Type: 'UI.DataField', Value: model },
    { $Type: 'UI.DataField', Value: color },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Value: year },
    { $Type: 'UI.DataField', Value: serialNumber },
    { $Type: 'UI.DataField', Label: 'RockStar', Value: owner_ID },
    { $Type: 'UI.DataField', Label: 'Category', Value: category_ID }
];

annotate namespace.Guitars with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: brand },
    { $Type: 'UI.DataField', Value: model },
    { $Type: 'UI.DataField', Value: color },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Value: year },
    { $Type: 'UI.DataField', Value: serialNumber },
    { $Type: 'UI.DataField', Label: 'RockStar', Value: owner_ID },
    { $Type: 'UI.DataField', Label: 'Category', Value: category_ID }
  ]
};

annotate namespace.Guitars with {
  owner @Common.Text: { $value: owner.name, ![@UI.TextArrangement]: #TextOnly };
  category @Common.Text: { $value: category.name, ![@UI.TextArrangement]: #TextOnly }
};

annotate namespace.Guitars with {
  owner @Common.Label: 'RockStar';
  category @Common.Label: 'Category'
};

annotate namespace.Guitars with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#brand' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#model' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#price' }
];

annotate namespace.Guitars with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate namespace.Guitars with @UI.SelectionFields: [
  owner_ID,
  category_ID
];

annotate namespace.RockStars with @UI.HeaderInfo: { TypeName: 'RockStar', TypeNamePlural: 'RockStars', Title: { Value: name } };
annotate namespace.RockStars with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate namespace.RockStars with @UI.Identification: [{ Value: name }];
annotate namespace.RockStars with {
  age @title: 'Age';
  nationality @title: 'Nationality';
  netWorth @title: 'Net Worth'
};

annotate namespace.RockStars with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: age },
    { $Type: 'UI.DataField', Value: nationality },
    { $Type: 'UI.DataField', Value: netWorth }
];

annotate namespace.RockStars with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: age },
    { $Type: 'UI.DataField', Value: nationality },
    { $Type: 'UI.DataField', Value: netWorth }
  ]
};

annotate namespace.RockStars with {
  guitars @Common.Label: 'Guitars'
};

annotate namespace.RockStars with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate namespace.RockStars with @UI.SelectionFields: [
  name
];

annotate namespace.Categories with @UI.HeaderInfo: { TypeName: 'Category', TypeNamePlural: 'Categories', Title: { Value: name } };
annotate namespace.Categories with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate namespace.Categories with @UI.Identification: [{ Value: name }];
annotate namespace.Categories with {
  description @title: 'Description'
};

annotate namespace.Categories with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: description }
];

annotate namespace.Categories with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: description }
  ]
};

annotate namespace.Categories with {
  guitars @Common.Label: 'Guitars'
};

annotate namespace.Categories with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate namespace.Categories with @UI.SelectionFields: [
  name
];

