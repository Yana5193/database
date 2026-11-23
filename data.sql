--1 задание
select id,name,lastname, year(dbirth) as birth_year
from clients;

--2 задание
--a)сколько полных лет
select id,name,lastname,timestampdiff(year,dbirth,curdate()) as age
from clients;

--б)до конца текущего года
select id,name,lastname,year(curdate())-year(dbirth) as age_end_year
from clients;

--3 задание
--а)сколько лет на 8 декабря 1992 года
select id,name,lastname,timestampdiff(year,dbirth,'1992-12-08')as age_in_1992
from clients;
--б) на 15 июля 2024 года
select id,name,lastname,timestampdiff(year,dbirth,'2024-07-15')as age_in_2024
from clients;

--4 задание
--а)в ближ неделю
select * from clients
where date_format(dbirth, concat(year(curdate()), '-%m-%d'))
      between curdate() and curdate() + interval 1 week;

--б)ближ 2 неделт
select * from clients
where date_format(dbirth, concat(year(curdate()), '-%m-%d'))
      between curdate() and curdate() + interval 2 week;

--в)до конца текущего месяца
select * from clients
where date_format(dbirth, concat(year(curdate()), '-%m-%d'))
      between curdate() and last_day(curdate());



