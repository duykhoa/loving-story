json.array!(@pages) do |page|
  json.extract! page, :id, :name, :content, :slug
  json.url page_url(page, format: :json)
end
