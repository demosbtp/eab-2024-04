sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'guitarshop/MyApplication/test/integration/FirstJourney',
		'guitarshop/MyApplication/test/integration/pages/GuitarsList',
		'guitarshop/MyApplication/test/integration/pages/GuitarsObjectPage'
    ],
    function(JourneyRunner, opaJourney, GuitarsList, GuitarsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('guitarshop/MyApplication') + '/index.html'
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