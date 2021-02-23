# Работа с базами данных

## перечислить все таблицы и первичные ключи в базе данных.

Походу не для той БД выполнил, думаю не критично

```sql
select
    tc.table_schema,
  tc.table_name,
  ccu.column_name,
  c.data_type
from information_schema.table_constraints as tc
    INNER JOIN information_schema.constraint_column_usage AS ccu ON
        ccu.constraint_catalog = tc.constraint_catalog AND
        ccu.constraint_schema = tc.constraint_schema AND 
        ccu.constraint_name = tc.constraint_name
    INNER JOIN information_schema.columns AS c ON
        c.table_schema = tc.table_schema AND 
        c.table_name = tc.table_name AND
        c.column_name = ccu.column_name
where
    tc.table_catalog = 'world-db' and tc.table_schema = 'public' AND
    tc.constraint_type = 'PRIMARY KEY';
```

```
table_schema  table_name              column_name     data_type
public        account                 user_id         integer
public        volkova_country         id_nationality  integer
public        volkova_language        id_nationality  integer
public        volkova                 id              integer
public        avtor_x                 user_id         integer
public        creations               cr_id           integer
public        ordersx                 id              integer
public        actor                   actor_id        integer
public        address                 address_id      integer
public        author                  id              integer
public        category                category_id     integer
public        customer                customer_id     integer
public        film_actor              actor_id        smallint
public        film_actor              film_id         smallint
public        film_category           film_id         smallint
public        film_category           category_id     smallint
public        film                    film_id         integer
public        inventory               inventory_id    integer
public        language                language_id     integer
public        orders                  id              integer
public        payment                 payment_id      integer
public        rental                  rental_id       integer
public        staff                   staff_id        integer
public        store                   store_id        integer
public        books_popov             id              integer
public        autor_astrakhantsev     id              integer
public        proizved_astrakhantsev  id_pro          integer
public        users                   user_id         integer
public        orders_customers        order_id        integer
public        author_table            id              integer

```

## вывести всех неактивных покупателей

Тут не ясно какое поле использовать, 

```SQL
SELECT email FROM customer WHERE active = 0;
```

```
email
sandra.martin@sakilacustomer.org
judith.cox@sakilacustomer.org
sheila.wells@sakilacustomer.org
erica.matthews@sakilacustomer.org
heidi.larson@sakilacustomer.org
penny.neal@sakilacustomer.org
kenneth.gooden@sakilacustomer.org
harry.arce@sakilacustomer.org
nathan.runyon@sakilacustomer.org
theodore.culp@sakilacustomer.org
maurice.crawley@sakilacustomer.org
ben.easter@sakilacustomer.org
christian.jung@sakilacustomer.org
jimmie.eggleston@sakilacustomer.org
terrance.roush@sakilacustomer.org
```

## вывести все фильмы, выпущенные в 2006 году

там где то 1000 записей, поэтому поставил limit

```SQL
SELECT title FROM film where release_year = 2006 LIMIT 10;
```

```
title
Chamber Italian
Grosse Wonderful
Airport Pollock
Bright Encounters
Academy Dinosaur
Ace Goldfinger
Adaptation Holes
Affair Prejudice
African Egg
Agent Truman
```

## вывести 10 последних платежей за прокат фильмов

```sql
SELECT * FROM payment order by payment_date DESC limit 10;
```

```
payment_id  customer_id   staff_id  rental_id amount  payment_date
     31925          284          2      12959   0.00  2007-05-14 13:44:29.996577
     31923          282          2      15430   0.99  2007-05-14 13:44:29.996577
     31922          279          2      13538   4.99  2007-05-14 13:44:29.996577
     31924          284          1      12064   5.98  2007-05-14 13:44:29.996577
     31921          274          1      13486   0.99  2007-05-14 13:44:29.996577
     31917          267          2      12066   7.98  2007-05-14 13:44:29.996577
     31920          269          2      12610   0.00  2007-05-14 13:44:29.996577
     31918          267          2      13713   0.00  2007-05-14 13:44:29.996577
     31919          269          1      13025   3.98  2007-05-14 13:44:29.996577
     31926          287          2      14204   0.99  2007-05-14 13:44:29.996577
```
