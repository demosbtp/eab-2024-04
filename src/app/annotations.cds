using { guitars } from '../srv/service.cds';

annotate guitars.Guitars with @UI.HeaderInfo: { TypeName: 'Guitar', TypeNamePlural: 'Guitars' };
annotate guitars.Guitars with @UI.DataPoint #brand: {
  Value: brand,
  Title: 'Brand',
};
annotate guitars.Guitars with @UI.DataPoint #model: {
  Value: model,
  Title: 'Model',
};
annotate guitars.Guitars with @UI.DataPoint #price: {
  Value: price,
  Title: 'Price',
};
annotate guitars.Guitars with {
  brand @title: 'Brand';
  model @title: 'Model';
  color @title: 'Color';
  price @title: 'Price';
  inStock @title: 'In Stock'
};

annotate guitars.Guitars with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: brand },
    { $Type: 'UI.DataField', Value: model },
    { $Type: 'UI.DataField', Value: color },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Value: inStock }
];

annotate guitars.Guitars with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: brand },
    { $Type: 'UI.DataField', Value: model },
    { $Type: 'UI.DataField', Value: color },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Value: inStock }
  ]
};

annotate guitars.Guitars with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#brand' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#model' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#price' }
];

annotate guitars.Guitars with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate guitars.Bands with @UI.HeaderInfo: { TypeName: 'Band', TypeNamePlural: 'Bands' };
annotate guitars.Bands with @UI.DataPoint #name: {
  Value: name,
  Title: 'Name',
};
annotate guitars.Bands with {
  name @title: 'Name';
  genre @title: 'Genre';
  yearFormed @title: 'Year Formed';
  country @title: 'Country'
};

annotate guitars.Bands with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: genre },
    { $Type: 'UI.DataField', Value: yearFormed },
    { $Type: 'UI.DataField', Value: country }
];

annotate guitars.Bands with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: genre },
    { $Type: 'UI.DataField', Value: yearFormed },
    { $Type: 'UI.DataField', Value: country }
  ]
};

annotate guitars.Bands with {
  members @Common.Label: 'Band Members'
};

annotate guitars.Bands with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#name' }
];

annotate guitars.Bands with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' },
  { $Type : 'UI.ReferenceFacet', ID : 'BandMembers', Target : 'members/@UI.LineItem' }
];

annotate guitars.BandMembers with @UI.HeaderInfo: { TypeName: 'Band Member', TypeNamePlural: 'Band Members' };
annotate guitars.BandMembers with {
  band @Common.ValueList: {
    CollectionPath: 'Bands',
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
        ValueListProperty: 'country'
      },
    ],
  }
};
annotate guitars.BandMembers with @UI.DataPoint #name: {
  Value: name,
  Title: 'Name',
};
annotate guitars.BandMembers with @UI.DataPoint #instrument: {
  Value: instrument,
  Title: 'Instrument',
};
annotate guitars.BandMembers with {
  name @title: 'Name';
  instrument @title: 'Instrument';
  age @title: 'Age';
  experience @title: 'Experience'
};

annotate guitars.BandMembers with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: instrument },
    { $Type: 'UI.DataField', Value: age },
    { $Type: 'UI.DataField', Value: experience }
];

annotate guitars.BandMembers with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: instrument },
    { $Type: 'UI.DataField', Value: age },
    { $Type: 'UI.DataField', Value: experience }
  ]
};

annotate guitars.BandMembers with {
  band @Common.Label: 'Band'
};

annotate guitars.BandMembers with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#name' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#instrument' }
];

annotate guitars.BandMembers with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate guitars.BandMembers with @UI.SelectionFields: [
  band_ID
];

