
Time::DATE_FORMATS[:short_ordinal]  = ->(time) { time.strftime("%B #{time.day.ordinalize}") }
Time::DATE_FORMATS[:reservacions]  = "%H:%M"

