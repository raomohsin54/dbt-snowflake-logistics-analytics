with source as (

    select * 
    from {{ source('tpch', 'CUSTOMER') }}

),

renamed as (

    select
        c_custkey::number        as customer_key,
        c_name::varchar          as customer_name,
        c_address::varchar       as customer_address,
        c_nationkey::number      as nation_key,
        c_phone::varchar         as phone_number,
        c_acctbal::number(18, 2) as account_balance,
        c_mktsegment::varchar    as market_segment,
        c_comment::varchar       as customer_comment

    from source

)

select * from renamed