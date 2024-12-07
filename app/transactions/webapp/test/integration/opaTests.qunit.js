sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/yy/rg/transactions/test/integration/FirstJourney',
		'com/yy/rg/transactions/test/integration/pages/TransactionsList',
		'com/yy/rg/transactions/test/integration/pages/TransactionsObjectPage'
    ],
    function(JourneyRunner, opaJourney, TransactionsList, TransactionsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/yy/rg/transactions') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheTransactionsList: TransactionsList,
					onTheTransactionsObjectPage: TransactionsObjectPage
                }
            },
            opaJourney.run
        );
    }
);