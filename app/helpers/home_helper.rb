module HomeHelper
	def get_current_term()
		start_year = Time.now.year
		if(Time.now.month < 7)
			start_year -= 1
		end
		end_year = start_year+1
		return start_year.to_s + "-" + end_year.to_s
	end
end
