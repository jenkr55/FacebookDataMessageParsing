require 'nokogiri' 
require 'csv'

# Export friend requests into CSV  of name and date added/requested
##### CHANGE THESE VARIABLES ##########
path = '../facebook-jenniferkruse/html/friends.htm' # File path where your facebook data is
#######################################

class Friend
	attr_accessor :name, :date
	def initialize(name, date)
		@name = name
		@date = date
	end
end

friendlist = []
page = Nokogiri::HTML(open(path))  

contents = page.css('div.contents')
friends = contents.css('li')
friends.each do |f|
	friend = f.text
	name = friend.split('(')[0]
	date = friend.split('(')[1].split(')')[0]
	friendlist.push(Friend.new(name, date))
end

# Write to CSV
CSV.open("result2.csv", "w") do |csv|
	friendlist.each do |f|
		csv << [f.name, f.date]
	end
end

