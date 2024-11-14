with base as (

    select * from {{ source('shopify', 'shopify_orders') }}
)

, casting as (
    
    select
    cast(order_id as bigint)
    , order_total_tax :: float
    , cast(order_created_at_timestamp as timestamp) created_at
    , cast(order_updated_at_timestamp as timestamp) updated_at 
    , total_price :: float
    , total_discounts :: float
    , total_line_items_price :: float
    , customer
    , shipping_address
    , fulfillment_status
    , financial_status
    , cancelled_at
    , line_items 
    , refunds
    , fulfillments
    from base
)

select * from casting 