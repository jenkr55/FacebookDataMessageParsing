require 'nokogiri' 
require 'csv'

# Dates of timeline activity into a CSV of a single column

##### CHANGE THESE VARIABLES ##########
path = '../facebook-jenniferkruse/html/timeline.htm' # File path where your facebook data is
#######################################

class Timeline
	attr_accessor :type, :date
	def initialize(type, date)
		@date = date
	end
end

activities = []
page = Nokogiri::HTML(open(path))  
daysOfWeek = ['Monday,', 'Tuesday,', 'Wednesday,', 'Thursday,', 'Friday,', 'Saturday,', 'Sunday,']

contents = page.css('div.contents')
statuses = contents.css('div.meta') #date of imeline activity, posts, statuses, photos
statuses.each do |s|
	activities.push s.text.split.delete_if{|x| daysOfWeek.include?(x)}.join(' ').split(' at')[0] #Remove day of week and time for easier formatting later
end

# Write to CSV
CSV.open("result3.csv", "w") do |csv|
	activities.each do |a|
		csv << [a]
	end
end

