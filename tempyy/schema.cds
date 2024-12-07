using { cuid, managed, Currency, sap.common.CodeList} from '@sap/cds/common';
namespace sap.capire.finance;

entity Assets : cuid {
    title : String @title : 'Title';
    description : String;
    ticker: String(16);
    type : Association to AssetType;
    price  : Decimal(9,2);
    currency : Currency;
    yield : Decimal(2,2);
}

entity Accounts : cuid {
    title : String @title : 'Title';
    number: String (20);
    entity: String(100);
    type: Association to AccountType;
    currency : Currency;  
    transactions     : Association to many Transactions on transactions.account = $self;  
}

entity Transactions : cuid, managed {
    date : type of managed:createdAt;
    account: Association to Accounts;
    category: Association to Categories;
    categorytype: Association to CategoryType;
    asset: Association to Assets;
    crossaccount: String;
    amount: Decimal(9,2);
    currency : Currency;    
}

entity Categories : cuid {
    title : String @title : 'Categories';
    type: Association to CategoryType;    
}

entity CategoryType : CodeList {
    key code: String enum {
        Cost = 'Cost';
        Income = 'Income';
        Balance = 'Balance';
        Investment = 'Investment';
        Transfer = 'Transfer';        
    }
}

entity AssetType : CodeList {
    key code: String enum {
        ETF = 'ETF';
        Stock = 'Stock';
        Currency = 'Currency';
    }
}

entity AccountType : CodeList {
    key code: String enum {
        Banking = 'Banking';
        Cash = 'Cash';
        Investment = 'Investment';
        Accrual = 'Accrual';
    }
}


