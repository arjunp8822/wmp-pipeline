-- generate input from gold file

with input as (
    select *
    from {{ ref('gld_products') }}
)

select *
from input