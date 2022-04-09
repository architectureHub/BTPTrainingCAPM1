using my.bookshop as my from '../db/data-model';

service CatalogService @(requires: 'authenticated-user')
{
    entity Books as
        projection on my.Books;

    entity Customers as
        projection on my.Costomers;

    @odata.draft.enabled
    entity sales as
        projection on my.sales;

    @readonly
    entity sales_overview as
        projection on my.sales_overview;
}
