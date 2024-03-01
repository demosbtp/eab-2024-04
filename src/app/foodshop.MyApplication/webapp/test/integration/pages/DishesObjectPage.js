sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'foodshop.MyApplication',
            componentId: 'DishesObjectPage',
            contextPath: '/Dishes'
        },
        CustomPageDefinitions
    );
});