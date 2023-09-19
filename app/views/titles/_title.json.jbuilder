json.extract! title, :id, :text, :comments_counter, :likes_counter, :created_at, :updated_at
json.url title_url(title, format: :json)
