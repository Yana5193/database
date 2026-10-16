#1. Найдите клиентов Gary Harrison, Michael Atwood, Amy Majors,
#Katherine Smith и обновите дату их рождения до 21.10.1930, 
#12.04.1934, 01.08.1975, 22.09.1959 соответственно.

SELECT * FROM clients 
WHERE (name = 'Gary' AND lastname = 'Harrison')
   OR (name = 'Michael' AND lastname = 'Atwood')
   OR (name = 'Amy' AND lastname = 'Majors')
   OR (name = 'Katherine' AND lastname = 'Smith');
SELECT * FROM clients WHERE id IN (306, 297, 240, 782);


UPDATE clients 
SET dbirth = 
    IF(id = 306, '1959-09-22',
        IF(id = 297, '1934-04-12',
            IF(id = 240, '1975-08-01', '1930-10-21')
        )
    ) 
WHERE id IN (306, 297, 240, 782) 
LIMIT 4;
#обновлено 4 строки

#2.Найдите клиентов с годом рождения ранее 1933 года и удалите номер телефона.
CREATE TABLE clients_bak AS SELECT * FROM clients;
SELECT COUNT(*) 
FROM clients 
WHERE dbirth < '1933-01-01';  #выдало 13

UPDATE clients 
SET phone = NULL 
WHERE dbirth < '1933-01-01' 
LIMIT 13;
#13 строк обновлено

#Исправьте ошибку клиента John Ohara, его настоящее имя Johanna Ohara, не забудьте поправить и пол клиента.
SELECT * FROM clients
WHERE name = 'John' AND lastname = 'Ohara';

UPDATE clients 
SET name = 'Johanna', gender = 'F' 
WHERE id = 570 
LIMIT 1;
#1 строка обновлена

#Замените номера телефонов Humberto Hoosier, Irene Schreiber, Donna Wallace на произвольные значения (для каждого свои).
SELECT id, name, lastname, phone FROM clients 
WHERE (name = 'Humberto' AND lastname = 'Hoosier')
   OR (name = 'Irene' AND lastname = 'Schreiber')
   OR (name = 'Donna' AND lastname = 'Wallace');

UPDATE clients 
SET phone = CASE id 
    WHEN 293 THEN '1111111'
    WHEN 447 THEN '2222222'
    WHEN 673 THEN '3333333'
END
WHERE id IN (293, 447, 673)
LIMIT 3;
#обновлено 3 строки

#Удалите клиентов с ID 215, 340, 449, 470, 607.
SELECT id, name, lastname FROM clients WHERE id IN (215, 340, 449, 470, 607);

DELETE FROM clients 
WHERE id IN (215, 340, 449, 470, 607) 
LIMIT 4;
#4 строки удалены

#Удалите клиентов мужского пола с датой рождения в период с 01.01.1941 по 30.04.1941 и с 10.09.1972 по 15.09.1972
SELECT * FROM clients 
WHERE gender = 'm' 
  AND ((dbirth BETWEEN '1941-01-01' AND '1941-04-30') 
    OR (dbirth BETWEEN '1972-09-10' AND '1972-09-15')
);

DELETE FROM clients 
WHERE id IN (383, 839) 
LIMIT 2;
#2 строки удалены