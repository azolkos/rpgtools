create table stats (
    id text not null primary key,
    idx number
);

insert into stats (id,idx) values ('INT',1);
insert into stats (id,idx) values ('REF',2);
insert into stats (id,idx) values ('TECH',3);
insert into stats (id,idx) values ('COOL',4);
insert into stats (id,idx) values ('ATTR',5);
insert into stats (id,idx) values ('LUCK',6);
insert into stats (id,idx) values ('MA',7);
insert into stats (id,idx) values ('BODY',8);

select * from stats;

drop table stats;