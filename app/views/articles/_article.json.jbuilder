json.extract! article, :id, :title, :description, :date, :epigraph, :to_date, :url, :hour, :created_at, :updated_at
json.url article_url(article, format: :json)
