json.array!(@schedules) do |schedule|
  json.extract! schedule, :week, :date, :time, :visitor_id, :home_id, :visitor_score, :home_score, :winning_team_id
  json.url schedule_url(schedule, format: :json)
end
