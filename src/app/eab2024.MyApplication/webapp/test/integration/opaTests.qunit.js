sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'eab2024/MyApplication/test/integration/FirstJourney',
		'eab2024/MyApplication/test/integration/pages/GuitarList',
		'eab2024/MyApplication/test/integration/pages/GuitarObjectPage'
    ],
    function(JourneyRunner, opaJourney, GuitarList, GuitarObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('eab2024/MyApplication') + '/index.html'
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