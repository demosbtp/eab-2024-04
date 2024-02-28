sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'eab2024.MyApplication',
            componentId: 'GuitarObjectPage',
            contextPath: '/Guitar'
        },
        CustomPageDefinitions
    );
});