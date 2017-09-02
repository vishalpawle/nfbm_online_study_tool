json.extract! request, :id, :first_name, :last_name, :email, :mobile, :address_one, :address_two, :state, :city, :pin, :accept_flag, :created_at, :updated_at
json.url request_url(request, format: :json)
