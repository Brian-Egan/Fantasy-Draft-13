module DraftsHelper
	def TeamPlayerList(mp)
		
		x = mp.count
		i = 1
		@pNames = ""
		mp.each do |p|
			if i < x
				@pNames << p.name + ", " 
			else
				@pNames << p.name
			end
			i += 1
		end

		return @pNames
	
	end

	def SumPosPoints(mp, by)
		@posPoints = mp.sum :rank3
		return @posPoints
	end

	def CalcWeeklyPoints(pp, wks)
		@wklyPoints = pp/wks
		return @wklyPoints
	end






end
