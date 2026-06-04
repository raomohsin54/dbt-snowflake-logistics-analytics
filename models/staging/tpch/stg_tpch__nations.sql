with source as (

    select *
    from {{ source('tpch', 'NATION') }}

),

renamed as (

    select
        n_nationkey::number    as nation_key,
        n_name::varchar        as nation_name,
        n_regionkey::number    as region_key,
        n_comment::varchar     as nation_comment

    from source

)

select * from renamed