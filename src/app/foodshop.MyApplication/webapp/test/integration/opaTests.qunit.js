sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'foodshop/MyApplication/test/integration/FirstJourney',
		'foodshop/MyApplication/test/integration/pages/DishesList',
		'foodshop/MyApplication/test/integration/pages/DishesObjectPage'
    ],
    function(JourneyRunner, opaJourney, DishesList, DishesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('foodshop/MyApplication') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheDishesList: DishesList,
					onTheDishesObjectPage: DishesObjectPage
                }
            },
            opaJourney.run
        );
    }
);