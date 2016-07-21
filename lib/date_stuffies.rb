module DateStuffies

	Time::DATE_FORMATS[:just_date]  = ->(time) { time.strftime("%B #{time.day.ordinalize} %Y") }

	def self.pretty_just_date_format date
		date.to_formatted_s(:just_date)
	end
end