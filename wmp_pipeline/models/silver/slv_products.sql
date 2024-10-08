-- generate input from raw source file

with input as (
    select *
    from {{ source('raw', 'raw_products') }}
),

-- clean column names and datatypes

cleaned as (
    select
        cast(productid as int64) as product_id,
        cast(productname as string) as product_name,
        cast(productbrand as string) as product_brand,
        cast(gender as string) as gender,
        cast(price as numeric) as price,
        cast(description as string) as description,
        cast(primarycolor as string) as primary_color    
    from input
),

-- final select statement

final as (
    select *
    from cleaned
)

select *
from final
order by product_id