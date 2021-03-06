- connection: the_look
- scoping: true                  #allows referencing fields across views
- label: ecommerce_data


- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards


- explore: order_items
  joins:
    - join: orders
      type: left_outer 
      sql_on: ${order_items.order_id} = ${orders.id}
      relationship: many_to_one

    - join: inventory_items
      type: left_outer
      sql_on: ${order_items.inventory_item_id} = ${inventory_items.id}
      relationship: many_to_one

    - join: users
      type: left_outer 
      sql_on: ${orders.user_id} = ${users.id}
      relationship: many_to_one

    - join: products
      type: left_outer 
      sql_on: ${inventory_items.product_id} = ${products.id}
      relationship: many_to_one


# - explore: orders
#   joins:
#     - join: order_items
#       type: left_outer
#       sql_on: ${orders.id} = ${order_items.order_id}
#       relationship: many_to_one
#     
#     - join: users
#       type: left_outer 
#       sql_on: ${orders.user_id} = ${users.id}
#       relationship: many_to_one
      





