json.extract! businesspartner, :id, :customer_code, :customer_name, :corporate_number, :invoice_number, :postal_code, :address, :telephone_number, :created_at, :updated_at
json.url businesspartner_url(businesspartner, format: :json)
