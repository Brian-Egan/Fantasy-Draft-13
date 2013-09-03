def resetTable(model, table)
	model.destroy_all
	table = table.to_s
	ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = '#{table}' ")
end