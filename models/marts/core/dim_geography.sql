with nations as (

    select *
    from {{ ref('stg_tpch__nations') }}

),

regions as (

    select *
    from {{ ref('stg_tpch__regions') }}

),

final as (

    select
        nations.nation_key,
        nations.nation_name,
        regions.region_key,
        regions.region_name

    from nations
    inner join regions
        on nations.region_key = regions.region_key

)

select * from final