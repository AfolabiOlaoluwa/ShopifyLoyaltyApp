json.extract! customer_detail, :id, :earning_rule_id, :name, :email, :point_balance, :event, :created_at, :updated_at
json.url customer_detail_url(customer_detail, format: :json)
