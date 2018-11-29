json.extract! article, :id, :title, :description, :publishedAt, :source, :urlToImage, :url, :created_at, :updated_at
json.url article_url(article, format: :json)
