json.array!(@clubs) do |club|
  json.extract! club, :city_abr, :city, :name, :wins, :losses, :ties, :win_percentage
  json.url club_url(club, format: :json)
end
