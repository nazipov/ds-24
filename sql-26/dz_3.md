# Основы SQL

## выведите магазины, имеющие больше 300-от покупателей

```sql
SELECT s.* FROM store AS s WHERE s.store_id IN (
    SELECT
        c.store_id
    FROM customer AS c
    GROUP BY c.store_id
    HAVING COUNT(c.*) > 300
)
```

## выведите у каждого покупателя город в котором он живет

```sql
SELECT
    c.*,
    c1.city
FROM customer AS c
    INNER JOIN address AS a ON a.address_id = c.address_id
    INNER JOIN city AS c1 ON c1.city_id = a.city_id
```
