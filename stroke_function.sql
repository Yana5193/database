--1.а) верхний регистр
select id, upper(name) as name_up
from clients;
--б) нижний регистр
select id,lower(name) as name_low
from clients;


--2 задание
select
	concat_ws(' ',name,lastname) as full_name,
    concat(
    	left(phone,3),
        repeat('*',char_length(phone)-4),
        right(phone,1)
    )as phone_number
from clients;


--3 задание
select
    concat_ws('. ',left(name,1),lastname) as full_name
from clients
where locate('tt', lastname)>0
    or locate('ss', lastname)>0
    or locate('ll', lastname)>0;


--4 задание
---а) начало на 586
--1 вариант
select * from clients where left(phone,3)='586';
--2 вариант
select * from clients where substring(phone,1,3)='586';
--3 вариант
select * from clients where substr(phone,1,3)='586';
--4 вариант
select * from clients where mid(phone,1,3)='586';
--5 вариант
select * from clients where position('586' in phone) = 1;
--6 вариант
select * from clients where locate('586', phone) = 1;
--7 вариант
select * from clients where  instr(phone, '586') = 1;

--б)содержат 657
--1 вариант
select * from clients where position('657' in phone)>0;
--2 вариант
select * from clients where locate('657',phone)>0;
--3 вариант
select * from clients where instr('657',phone)>0;

--в)заканчиваются на 707
-- 1 вариант
select * from clients where right(phone,3)='707'
--2 вариант
select * from clients where substring(phone,char_length(phone)-2,3)='707';
--3 вариант
select * from clients where substr(phone,char_length(phone)-2,3)='707';
--4 вариант
select * from clients where mid(phone,char_length(phone)-2,3)='707';

