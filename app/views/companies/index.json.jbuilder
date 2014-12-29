json.array!(@companies) do |company|
  json.extract! company, :id, :name, :description, :homesite, :slug, :country_id, :city_id, :zip, :email, :phone, :address, :logo
  json.url company_url(company, format: :json)
end
