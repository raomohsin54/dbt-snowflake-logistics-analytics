with source as (

    select *
    from {{ source('tpch', 'LINEITEM') }}

),

renamed as (

    select
        l_orderkey::number          as order_key,
        l_partkey::number           as part_key,
        l_suppkey::number           as supplier_key,
        l_linenumber::number        as line_number,
        l_quantity::number(18,2)    as quantity,
        l_extendedprice::number(18,2) as extended_price,
        l_discount::number(18,4)    as discount,
        l_tax::number(18,4)         as tax,
        l_returnflag::varchar       as return_flag,
        l_linestatus::varchar       as line_status,
        l_shipdate::date            as ship_date,
        l_commitdate::date          as commit_date,
        l_receiptdate::date         as receipt_date,
        l_shipinstruct::varchar     as ship_instruction,
        l_shipmode::varchar         as ship_mode,
        l_comment::varchar          as line_comment,

        case
            when l_shipdate <= l_commitdate then true
            else false
        end as shipped_on_or_before_commit_date,

        datediff('day', l_commitdate, l_shipdate) as days_shipdate_after_commitdate,

        l_extendedprice * (1 - l_discount) as net_item_revenue,
        l_extendedprice * (1 - l_discount) * (1 + l_tax) as gross_item_revenue

    from source

)

select * from renamed