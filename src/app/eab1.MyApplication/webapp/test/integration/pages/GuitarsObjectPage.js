sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'eab1.MyApplication',
            componentId: 'GuitarsObjectPage',
            contextPath: '/Guitars'
        },
        CustomPageDefinitions
    );
});