-- generate input from silver file

with input as (
    select *
    from {{ ref('slv_products') }}
),

-- add some business logic

price_type as (
    select 
        *,
        case
            when price <= 500 then 'Cheap'
            when price <= 20000 then 'Normal'
            else 'Expensive'
        end as price_type
    from input
),

final as (
    select *
    from price_type
)

select * 
from final