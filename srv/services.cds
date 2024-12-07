using { sap.capire.finance as my } from '../db/schema';

/**
 * Service used by support personell, i.e. the incidents' 'processors'.
 */
service ProcessorService { 
    entity Transactions as projection on my.Transactions;
    entity Assets as projection on my.Assets;
    entity Accounts as projection on my.Accounts;
    @readonly
    entity Categories as projection on my.Categories;
}

annotate ProcessorService.Transactions with @odata.draft.enabled; 
/**
 * Service used by administrators to manage customers and incidents.
 */
service AdminService {
    entity Transactions as projection on my.Transactions;
    entity Assets as projection on my.Assets;
    entity Categories as projection on my.Categories;
    entity Accounts as projection on my.Accounts;
}
