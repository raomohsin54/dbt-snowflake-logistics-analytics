with orders as (

    select *
    from {{ ref('stg_tpch__orders') }}

),

line_items as (

    select *
    from {{ ref('stg_tpch__line_items') }}

),

joined as (

    select
        line_items.order_key,
        line_items.line_number,
        orders.customer_key,
        line_items.part_key,
        line_items.supplier_key,

        orders.order_status,
        orders.order_date,
        orders.order_priority,

        line_items.quantity,
        line_items.extended_price,
        line_items.discount,
        line_items.tax,
        line_items.net_item_revenue,
        line_items.gross_item_revenue,

        line_items.ship_date,
        line_items.commit_date,
        line_items.receipt_date,
        line_items.ship_mode,
        line_items.ship_instruction,

        line_items.shipped_on_or_before_commit_date,
        line_items.days_shipdate_after_commitdate,

        datediff('day', orders.order_date, line_items.ship_date) as days_to_ship,
        datediff('day', line_items.ship_date, line_items.receipt_date) as days_ship_to_receipt,
        datediff('day', orders.order_date, line_items.receipt_date) as days_order_to_receipt,

        case
            when line_items.ship_date > line_items.commit_date then true
            else false
        end as is_late_shipment

    from line_items
    inner join orders
        on line_items.order_key = orders.order_key

)

select * from joined