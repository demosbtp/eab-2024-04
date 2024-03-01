using { food } from '../srv/service.cds';

annotate food.Dishes with @UI.HeaderInfo: { TypeName: 'Dish', TypeNamePlural: 'Dishes', Title: { Value: name } };
annotate food.Dishes with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate food.Dishes with @UI.Identification: [{ Value: name }];
annotate food.Dishes with {
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
annotate food.Dishes with @UI.DataPoint #price: {
  Value: price,
  Title: 'Price',
};
annotate food.Dishes with {
  name @title: 'Name';
  description @title: 'Description';
  price @title: 'Price';
  ingredients @title: 'Ingredients';
  spicinessLevel @title: 'Spiciness Level';
  isVegetarian @title: 'Vegetarian'
};

annotate food.Dishes with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Value: ingredients },
    { $Type: 'UI.DataField', Value: spicinessLevel },
    { $Type: 'UI.DataField', Value: isVegetarian },
    { $Type: 'UI.DataField', Label: 'Category', Value: category_ID }
];

annotate food.Dishes with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Value: ingredients },
    { $Type: 'UI.DataField', Value: spicinessLevel },
    { $Type: 'UI.DataField', Value: isVegetarian },
    { $Type: 'UI.DataField', Label: 'Category', Value: category_ID }
  ]
};

annotate food.Dishes with {
  category @Common.Text: { $value: category.name, ![@UI.TextArrangement]: #TextOnly }
};

annotate food.Dishes with {
  category @Common.Label: 'Category';
  reviews @Common.Label: 'Reviews'
};

annotate food.Dishes with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#price' }
];

annotate food.Dishes with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate food.Dishes with @UI.SelectionFields: [
  category_ID
];

annotate food.Categories with @UI.HeaderInfo: { TypeName: 'Category', TypeNamePlural: 'Categories', Title: { Value: name } };
annotate food.Categories with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate food.Categories with @UI.Identification: [{ Value: name }];
annotate food.Categories with {
  name @title: 'Name';
  description @title: 'Description'
};

annotate food.Categories with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: description }
];

annotate food.Categories with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: description }
  ]
};

annotate food.Categories with {
  dishes @Common.Label: 'Dishes'
};

annotate food.Categories with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate food.Categories with @UI.SelectionFields: [
  name
];

annotate food.Reviews with @UI.HeaderInfo: { TypeName: 'Review', TypeNamePlural: 'Reviews', Title: { Value: title } };
annotate food.Reviews with {
  ID @UI.Hidden @Common.Text: { $value: title, ![@UI.TextArrangement]: #TextOnly }
};
annotate food.Reviews with @UI.Identification: [{ Value: title }];
annotate food.Reviews with {
  dish @Common.ValueList: {
    CollectionPath: 'Dishes',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: dish_ID, 
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
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'price'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'ingredients'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'spicinessLevel'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'isVegetarian'
      },
    ],
  }
};
annotate food.Reviews with @UI.DataPoint #rating: {
  Value: rating,
  Title: 'Rating',
};
annotate food.Reviews with {
  title @title: 'Title';
  description @title: 'Description';
  rating @title: 'Rating'
};

annotate food.Reviews with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: rating },
    { $Type: 'UI.DataField', Label: 'Dish', Value: dish_ID }
];

annotate food.Reviews with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: rating },
    { $Type: 'UI.DataField', Label: 'Dish', Value: dish_ID }
  ]
};

annotate food.Reviews with {
  dish @Common.Text: { $value: dish.name, ![@UI.TextArrangement]: #TextOnly }
};

annotate food.Reviews with {
  dish @Common.Label: 'Dish'
};

annotate food.Reviews with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#rating' }
];

annotate food.Reviews with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate food.Reviews with @UI.SelectionFields: [
  dish_ID
];

