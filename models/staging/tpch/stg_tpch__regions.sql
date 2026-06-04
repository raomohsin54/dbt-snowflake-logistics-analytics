with source as (

    select *
    from {{ source('tpch', 'REGION') }}

),

renamed as (

    select
        r_regionkey::number    as region_key,
        r_name::varchar        as region_name,
        r_comment::varchar     as region_comment

    from source

)

select * from renamed