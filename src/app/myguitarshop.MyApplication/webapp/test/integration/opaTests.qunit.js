sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'myguitarshop/MyApplication/test/integration/FirstJourney',
		'myguitarshop/MyApplication/test/integration/pages/GuitarList',
		'myguitarshop/MyApplication/test/integration/pages/GuitarObjectPage'
    ],
    function(JourneyRunner, opaJourney, GuitarList, GuitarObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('myguitarshop/MyApplication') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheGuitarList: GuitarList,
					onTheGuitarObjectPage: GuitarObjectPage
                }
            },
            opaJourney.run
        );
    }
);