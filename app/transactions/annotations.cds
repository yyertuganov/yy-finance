using ProcessorService as service from '../../srv/services';
annotate service.Transactions with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : date,
            },
            {
                $Type : 'UI.DataField',
                Label : 'categorytype',
                Value : categorytype,
            },
            {
                $Type : 'UI.DataField',
                Label : 'crossaccount',
                Value : crossaccount,
            },
            {
                $Type : 'UI.DataField',
                Label : 'amount',
                Value : amount,
            },
            {
                $Type : 'UI.DataField',
                Label : 'currency',
                Value : currency,
            },
            {
                $Type : 'UI.DataField',
                Value : account_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : category_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : asset_ID,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : '{i18n>TransactionDetails}',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : date,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Category Type}',
            Value : categorytype,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Cross Account}',
            Value : crossaccount,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Amount}',
            Value : amount,
            ![@UI.Importance] : #Medium,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Currency}',
            Value : currency,
        },
        {
            $Type : 'UI.DataField',
            Value : account.title,
        },
        {
            $Type : 'UI.DataField',
            Value : asset.title,
        },
        {
            $Type : 'UI.DataField',
            Value : asset.ticker,
            Label : 'ticker',
        },
        {
            $Type : 'UI.DataField',
            Value : category.title,
        },
    ],
    UI.SelectionFields : [
        account_ID,
        category_ID,
        asset_ID,
    ],
    UI.HeaderInfo : {
        TypeImageUrl : 'sap-icon://accounting-document-verification',
        TypeName : '',
        TypeNamePlural : '',
    },
);

annotate service.Transactions with {
    account @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Accounts',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : account_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'title',
                },
            ],
        },
        Common.Label : '{i18n>Accounts}',
        Common.ValueListWithFixedValues : false,
    )
};

annotate service.Transactions with {
    category @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Categories',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : category_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'title',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'type',
                },
            ],
        },
        Common.Label : '{i18n>Category}',
        Common.ValueListWithFixedValues : true,
        )
};

annotate service.Transactions with {
    asset @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Assets',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : asset_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'title',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'ticker',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'type',
                },
            ],
        },
        Common.Label : '{i18n>Assets}',
    )
};

annotate service.Accounts with {
    ID @Common.Text : title
};

annotate service.Categories with {
    ID @Common.Text : {
        $value : title,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

annotate service.Transactions with {
    amount @Common.FieldControl : #Mandatory
};

