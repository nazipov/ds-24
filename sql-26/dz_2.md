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
SELECT * FROM customer WHERE active = 0;
```

```csv
customer_id;store_id;first_name;last_name;email;address_id;activebool;create_date;last_update;active
16;2;Sandra;Martin;sandra.martin@sakilacustomer.org;20;1;2006-02-14;"2013-05-26 14:49:45.738";0
64;2;Judith;Cox;judith.cox@sakilacustomer.org;68;1;2006-02-14;"2013-05-26 14:49:45.738";0
124;1;Sheila;Wells;sheila.wells@sakilacustomer.org;128;1;2006-02-14;"2013-05-26 14:49:45.738";0
169;2;Erica;Matthews;erica.matthews@sakilacustomer.org;173;1;2006-02-14;"2013-05-26 14:49:45.738";0
241;2;Heidi;Larson;heidi.larson@sakilacustomer.org;245;1;2006-02-14;"2013-05-26 14:49:45.738";0
271;1;Penny;Neal;penny.neal@sakilacustomer.org;276;1;2006-02-14;"2013-05-26 14:49:45.738";0
315;2;Kenneth;Gooden;kenneth.gooden@sakilacustomer.org;320;1;2006-02-14;"2013-05-26 14:49:45.738";0
368;1;Harry;Arce;harry.arce@sakilacustomer.org;373;1;2006-02-14;"2013-05-26 14:49:45.738";0
406;1;Nathan;Runyon;nathan.runyon@sakilacustomer.org;411;1;2006-02-14;"2013-05-26 14:49:45.738";0
446;2;Theodore;Culp;theodore.culp@sakilacustomer.org;451;1;2006-02-14;"2013-05-26 14:49:45.738";0
482;1;Maurice;Crawley;maurice.crawley@sakilacustomer.org;487;1;2006-02-14;"2013-05-26 14:49:45.738";0
510;2;Ben;Easter;ben.easter@sakilacustomer.org;515;1;2006-02-14;"2013-05-26 14:49:45.738";0
534;1;Christian;Jung;christian.jung@sakilacustomer.org;540;1;2006-02-14;"2013-05-26 14:49:45.738";0
558;1;Jimmie;Eggleston;jimmie.eggleston@sakilacustomer.org;564;1;2006-02-14;"2013-05-26 14:49:45.738";0
592;1;Terrance;Roush;terrance.roush@sakilacustomer.org;598;1;2006-02-14;"2013-05-26 14:49:45.738";0
```

## вывести все фильмы, выпущенные в 2006 году

## вывести 10 последних платежей за прокат фильмов
