with source as (

    select *
    from {{ source('tpch', 'ORDERS') }}

),

renamed as (

    select
        o_orderkey::number        as order_key,
        o_custkey::number         as customer_key,
        o_orderstatus::varchar    as order_status,
        o_totalprice::number(18,2) as total_price,
        o_orderdate::date         as order_date,
        o_orderpriority::varchar  as order_priority,
        o_clerk::varchar          as clerk,
        o_shippriority::number    as ship_priority,
        o_comment::varchar        as order_comment

    from source

)

select * from renamed