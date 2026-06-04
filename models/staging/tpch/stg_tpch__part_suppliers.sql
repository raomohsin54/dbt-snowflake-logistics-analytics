with source as (

    select *
    from {{ source('tpch', 'PARTSUPP') }}

),

renamed as (

    select
        ps_partkey::number        as part_key,
        ps_suppkey::number        as supplier_key,
        ps_availqty::number       as available_quantity,
        ps_supplycost::number(18,2) as supply_cost,
        ps_comment::varchar       as part_supplier_comment

    from source

)

select * from renamed