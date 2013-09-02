json.array!(@players) do |player|
  json.extract! player, :name, :position, :rank1, :rank2, :rank3, :pos_rank, :available, :taken_at
  json.url player_url(player, format: :json)
end
