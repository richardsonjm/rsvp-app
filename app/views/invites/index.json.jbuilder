json.array!(@invites) do |invite|
  json.extract! invite, :name, :event_id
  json.url invite_url(invite, format: :json)
end
