using { cuid, managed} from '@sap/cds/common';
namespace sap.capire.finance;

entity Transactions : cuid, managed {
    date : type of managed:createdAt;
    account: Association to Accounts;
    category: Association to Categories;
    categorytype: String(50);
    asset: Association to Assets;
    crossaccount: String;
    amount: Decimal(9,2);
    currency : String(5);    
}

entity Assets : cuid {
    title : String @title : 'Assets';
    description : String;
    ticker: String(16);
    type : String(10) ;
    price  : Decimal(9,2);
    currency : String(5);
    yield : Decimal(2,2);
    transactions     : Association to many Transactions on transactions.asset = $self;  
}

entity Accounts : cuid {
    title : String @title : 'Accounts';
    number: String (20);
    entity: String(100);
    type: String(20);
    currency : String(5);  
    transactions     : Association to many Transactions on transactions.account = $self;  
}

entity Categories : cuid {
    title : String @title : 'Categories';
    type: String(50);    
    transactions     : Association to many Transactions on transactions.category = $self;  
}



