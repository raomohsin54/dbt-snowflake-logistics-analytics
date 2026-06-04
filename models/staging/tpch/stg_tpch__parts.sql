with source as (

    select *
    from {{ source('tpch', 'PART') }}

),

renamed as (

    select
        p_partkey::number        as part_key,
        p_name::varchar          as part_name,
        p_mfgr::varchar          as manufacturer,
        p_brand::varchar         as brand,
        p_type::varchar          as part_type,
        p_size::number           as part_size,
        p_container::varchar     as container_type,
        p_retailprice::number(18,2) as retail_price,
        p_comment::varchar       as part_comment

    from source

)

select * from renamed