json.array!(@root_categories) do |root_category|
  json.extract! root_category, :id, :show, :index, :new, :edit, :list
  json.url root_category_url(root_category, format: :json)
end
