sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'eab2024/MyApplication/test/integration/FirstJourney',
		'eab2024/MyApplication/test/integration/pages/GuitarsList',
		'eab2024/MyApplication/test/integration/pages/GuitarsObjectPage'
    ],
    function(JourneyRunner, opaJourney, GuitarsList, GuitarsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('eab2024/MyApplication') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheGuitarsList: GuitarsList,
					onTheGuitarsObjectPage: GuitarsObjectPage
                }
            },
            opaJourney.run
        );
    }
);