json.extract! create_user, :id, :name, :photo, :bio, :post_counter, :created_at, :updated_at
json.url create_user_url(create_user, format: :json)
