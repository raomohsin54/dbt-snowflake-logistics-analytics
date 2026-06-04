with suppliers as (

    select *
    from {{ ref('stg_tpch__suppliers') }}

),

geography as (

    select *
    from {{ ref('dim_geography') }}

),

final as (

    select
        suppliers.supplier_key,
        suppliers.supplier_name,
        suppliers.supplier_address,
        suppliers.phone_number,
        suppliers.account_balance,

        geography.nation_key,
        geography.nation_name,
        geography.region_key,
        geography.region_name

    from suppliers
    left join geography
        on suppliers.nation_key = geography.nation_key

)

select * from final