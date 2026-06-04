with order_line_items as (

    select *
    from {{ ref('int_order_line_items') }}

),

final as (

    select
        md5(order_key::varchar || '-' || line_number::varchar) as order_line_item_key,

        order_key,
        line_number,
        customer_key,
        part_key,
        supplier_key,

        order_status,
        order_date,
        order_priority,

        quantity,
        extended_price,
        discount,
        tax,
        net_item_revenue,
        gross_item_revenue,

        ship_date,
        commit_date,
        receipt_date,
        ship_mode,
        ship_instruction,

        days_to_ship,
        days_ship_to_receipt,
        days_order_to_receipt,
        days_shipdate_after_commitdate,
        shipped_on_or_before_commit_date,
        is_late_shipment

    from order_line_items

)

select * from final