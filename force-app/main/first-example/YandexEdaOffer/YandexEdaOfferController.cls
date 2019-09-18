/**
 * Created by Dasha Mitina on 12.09.2019.
 */

public with sharing class YandexEdaOfferController {
    public Offer__c offer{get; set;}
    public Boolean matchesBilling { get; set; }

    public List<SelectOption> getTypes() {
        Schema.sObjectType sobject_type = Offer__c.getSObjectType();


        Schema.DescribeSObjectResult sobject_describe = sobject_type.getDescribe();


        Map<String, Schema.SObjectField> field_map = sobject_describe.fields.getMap();

        List<Schema.PicklistEntry> pick_list_values = field_map.get('NDS__c').getDescribe().getPickListValues();


        List<selectOption> options = new List<selectOption>();


        for (Schema.PicklistEntry a : pick_list_values) {
            options.add(new selectOption(a.getLabel(), a.getValue()));
        }
        return options;
    }

    public PageReference save() {
        offer.RestName__c = ApexPages.currentPage().getParameters().get('RestName');
        offer.OrgINN__c = ApexPages.currentPage().getParameters().get('party');
        offer.BankName__c = ApexPages.currentPage().getParameters().get('bank');
        offer.CheckingAcc__c = ApexPages.currentPage().getParameters().get('checkingAcc');
        offer.Accounting_Phone__c = ApexPages.currentPage().getParameters().get('phone');
        offer.AccountingEmail__c = ApexPages.currentPage().getParameters().get('mail');
        offer.Website__c = ApexPages.currentPage().getParameters().get('site');
        offer.BillingIndex__c = ApexPages.currentPage().getParameters().get('index');
        offer.BillingCity__c = ApexPages.currentPage().getParameters().get('city');
        offer.BillingAddress__c = ApexPages.currentPage().getParameters().get('address');

        offer.AccountFullName__c  = ApexPages.currentPage().getParameters().get('fullName');

        offer.City__c  = ApexPages.currentPage().getParameters().get('city_u');
        offer.Index__c  = ApexPages.currentPage().getParameters().get('index_u');
        offer.Street__c  = ApexPages.currentPage().getParameters().get('street_u');
        offer.Apartments__c  = ApexPages.currentPage().getParameters().get('flat_u');

        offer.OGRN__c  = ApexPages.currentPage().getParameters().get('OGRN');
        offer.INN__c  = ApexPages.currentPage().getParameters().get('INN');
        offer.KPP__c  = ApexPages.currentPage().getParameters().get('KPP');

        offer.SignerName__c  = ApexPages.currentPage().getParameters().get('signerName');
        offer.SignerPosition__c  = ApexPages.currentPage().getParameters().get('signerPosition');

        offer.BankBIK__c  = ApexPages.currentPage().getParameters().get('BIK');
        offer.CorAcc__c  = ApexPages.currentPage().getParameters().get('CorrAcc');
        offer.NDS__c = ApexPages.currentPage().getParameters().get('NDS');
        update offer;
        return null;
    }

}