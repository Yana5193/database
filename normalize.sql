-- задача 17
create table shop_items(
    id int primary key,          
    name varchar(100),            
    cat_id int,                     
    cat_name varchar(100)
);

insert into shop_items(id, name, cat_id, cat_name) 
values(1, 'Молоко', 101, 'Молочные продукты'),
(2, 'Сыр', 101, 'Молочные продукты'),
(3, 'Хлеб', 102, 'Хлебобулочные изделия'),
(4, 'Батон', 102, 'Хлебобулочные изделия'),
(5, 'Яблоки', 103, 'Фрукты');

-- теперь делаем нормализацию. разделим на 2 таблицы категории и товары
create table categories(
    id int primary key,
    name varchar(100)
);

create table products(
    id int primary key,
    name varchar(100),
    cat_id int,
    foreign key(cat_id) references categories(id)
);

-- заполняем таблицу категорий данными из shop_items
insert into categories (id, name)
select distinct cat_id, cat_name 
from shop_items;

-- заполняем таблицу товаров, беря только нужные колонки
insert into products (id, name, cat_id)
select id, name, cat_id 
from shop_items;