json.extract! ticket, :id, :name, :description, :price, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
