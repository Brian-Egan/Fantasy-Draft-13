json.array!(@drafts) do |draft|
  json.extract! draft, :round, :pick, :draft_team, :player_taken
  json.url draft_url(draft, format: :json)
end
