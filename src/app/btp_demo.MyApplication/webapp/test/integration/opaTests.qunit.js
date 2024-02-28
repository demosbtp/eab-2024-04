sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'btpdemo/MyApplication/test/integration/FirstJourney',
		'btpdemo/MyApplication/test/integration/pages/GuitarList',
		'btpdemo/MyApplication/test/integration/pages/GuitarObjectPage'
    ],
    function(JourneyRunner, opaJourney, GuitarList, GuitarObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('btpdemo/MyApplication') + '/index.html'
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