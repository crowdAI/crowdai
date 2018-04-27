json.extract! blog, :id, :participant_id, :title, :body, :published, :vote_count, :view_count, :created_at, :updated_at
json.url blog_url(blog, format: :json)
