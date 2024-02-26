sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'eabtest2/MyApplication/test/integration/FirstJourney',
		'eabtest2/MyApplication/test/integration/pages/GuitarsObjectPage'
    ],
    function(JourneyRunner, opaJourney, GuitarsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('eabtest2/MyApplication') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheGuitarsObjectPage: GuitarsObjectPage
                }
            },
            opaJourney.run
        );
    }
);