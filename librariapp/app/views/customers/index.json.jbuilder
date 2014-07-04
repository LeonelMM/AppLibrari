json.array!(@customers) do |customer|
  json.extract! customer, :id, :nombreCliente, :telefono, :direccion, :RFC, :correo, :facebook, :linkedln
  json.url customer_url(customer, format: :json)
end
