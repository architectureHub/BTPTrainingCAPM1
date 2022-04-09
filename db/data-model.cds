namespace my.bookshop;

using { managed } from '@sap/cds/common';


entity Books
{
    key ID : Integer;
    title : String;
    stock : Integer;
}

entity Costomers
{
    key ID : Integer;
    name : String(100) not null;
    address : String(100);
    phone : Integer not null;
}

entity sales : managed
{
    key ID : UUID
        @Core.Computed;
    cusomerID : Integer;
    bookID : Integer;
    price : Decimal;
}

@readonly
entity sales_overview as
    select key sal.ID as salesID,
    sal.cusomerID as customerID,
    cust.name as customerName,
    cust.address as customerAddress,
    cust.phone as customerPhone,
    bok.ID as bookID,
    bok.title as bookTitle,
    sal.price as salesAmount from sales as sal
    left join Costomers as cust
        on sal.cusomerID = cust.ID
    left join Books as bok
        on sal.bookID = bok.ID;


