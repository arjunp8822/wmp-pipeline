-- test that all items have a positive price

select *
from {{ ref('products') }}
where price <= 0


