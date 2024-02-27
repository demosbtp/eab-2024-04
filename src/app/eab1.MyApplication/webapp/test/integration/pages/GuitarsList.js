sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'eab1.MyApplication',
            componentId: 'GuitarsList',
            contextPath: '/Guitars'
        },
        CustomPageDefinitions
    );
});