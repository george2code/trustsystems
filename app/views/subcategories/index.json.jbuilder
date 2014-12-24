json.array!(@subcategories) do |subcategory|
  json.extract! subcategory, :id, :rootCategoryId, :name, :description, :slug
  json.url subcategory_url(subcategory, format: :json)
end
