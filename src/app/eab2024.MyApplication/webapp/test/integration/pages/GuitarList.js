sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'eab2024.MyApplication',
            componentId: 'GuitarList',
            contextPath: '/Guitar'
        },
        CustomPageDefinitions
    );
});