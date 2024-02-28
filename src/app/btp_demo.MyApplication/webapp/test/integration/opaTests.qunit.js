sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'btpdemo/MyApplication/test/integration/FirstJourney',
		'btpdemo/MyApplication/test/integration/pages/GuitarsList',
		'btpdemo/MyApplication/test/integration/pages/GuitarsObjectPage'
    ],
    function(JourneyRunner, opaJourney, GuitarsList, GuitarsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('btpdemo/MyApplication') + '/index.html'
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