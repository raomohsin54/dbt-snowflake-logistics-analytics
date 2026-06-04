with customers as (

    select *
    from {{ ref('stg_tpch__customers') }}

),

geography as (

    select *
    from {{ ref('dim_geography') }}

),

final as (

    select
        customers.customer_key,
        customers.customer_name,
        customers.customer_address,
        customers.phone_number,
        customers.account_balance,
        customers.market_segment,

        geography.nation_key,
        geography.nation_name,
        geography.region_key,
        geography.region_name

    from customers
    left join geography
        on customers.nation_key = geography.nation_key

)

select * from final