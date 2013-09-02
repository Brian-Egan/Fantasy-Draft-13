json.array!(@teams) do |team|
  json.extract! team, :name, :owner, :draft_order
  json.url team_url(team, format: :json)
end
