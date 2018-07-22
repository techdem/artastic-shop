json.extract! item, :id, :title, :description, :price, :image_url, :category, :author, :created_at, :updated_at
json.url item_url(item, format: :json)
