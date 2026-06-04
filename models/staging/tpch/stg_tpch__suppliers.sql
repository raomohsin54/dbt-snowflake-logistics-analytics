with source as (

    select *
    from {{ source('tpch', 'SUPPLIER') }}

),

renamed as (

    select
        s_suppkey::number        as supplier_key,
        s_name::varchar          as supplier_name,
        s_address::varchar       as supplier_address,
        s_nationkey::number      as nation_key,
        s_phone::varchar         as phone_number,
        s_acctbal::number(18,2)  as account_balance,
        s_comment::varchar       as supplier_comment

    from source

)

select * from renamed