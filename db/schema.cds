using {managed} from '@sap/cds/common';

namespace sap.capire.bookshop;

entity Books : managed {
    key ID     : Integer;
        title  : String(111);
        descr  : String(111);
        author : Association to Authors;
        genre  : Association to Genres;
        stock  : Integer;
        price  : Decimal(9, 2);
}

entity Authors : managed {
    key ID    : Integer;
        name  : String(111);
        dascr : String(111);
        years : Integer;
        books : Association to many Books
                    on books.author = $self
}

entity Genres : managed {
    key ID     : Integer;
        name   : String(111);
        parent : Association to Genres;
}
