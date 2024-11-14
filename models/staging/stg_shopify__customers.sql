with base as (

    select * from {{ ref('stg_shopify__base_model') }}
)

, customers as (

    select
    cast((customer::jsonb)->>'id' AS bigint) AS customer_id
    , cast((customer::jsonb)->>'email' AS text) AS email
    , cast((customer::jsonb)->>'created_at' AS timestamp) AS created_at
    , cast((customer::jsonb)->>'updated_at' AS timestamp) AS updated_at
    , cast((customer::jsonb)->>'first_name' AS text) AS first_name
    , cast((customer::jsonb)->>'last_name' AS text) AS last_name 
    , cast((customer::jsonb)->>'orders_count' AS integer) AS orders_count 
    , cast((customer::jsonb)->>'total_spent' AS float) AS total_spent 
    , cast((customer::jsonb)->'default_address'->>'country' AS text) AS country
    , cast((customer::jsonb)->'default_address'->>'country_code' AS text) AS country_code
    from base
)

select * from customers 
