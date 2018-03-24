require 'nokogiri' 
require 'csv'

##### CHANGE THESE VARIABLES ##########
path = '../facebook-jenniferkruse/messages' # File path where your facebook data is
myName = 'Jennifer Kruse' # Your name on Facebook
#######################################

class Person
	attr_accessor :name, :messages

	def initialize(name)
		@name = name
		@messages = []
	end

	def add_message(time)
		parsedTime = Date.parse(time).to_s[0..6]
		puts time
		if !@messages.any?{|m| m.date == parsedTime} then
			@messages.push(MessageDay.new(time))
		else
			message = @messages.select{|m| m.date == parsedTime}
			message[0].count = message[0].count + 1
		end
	end
end

class MessageDay
	attr_accessor :date, :count

	def initialize(date)
		@date = date
		@count = 1
	end
end

people = [] #array of individual people
daysOfWeek = ['Monday,', 'Tuesday,', 'Wednesday,', 'Thursday,', 'Friday,', 'Saturday,', 'Sunday,']

# Loop through each message file 
Dir.foreach(path) do |item|
	puts item
	next if item == '.' or item == '..'

	page = Nokogiri::HTML(open(path + '/' + item))  

	#each user name besides mine
	users = page.css('span.user').map{|u| u.text }
	users.delete(myName)

	#make sure this person exists in our array
	users.uniq!
	users.each do |x|
		if !people.any?{|p| p.name == x} then
			people.push(Person.new(x))
		end
	end

	currentUsers = people.select{|p| users.include?(p.name)}

	messages = page.css('div.message')
	messages.each do |x|
		day = x.css('span.meta').text
		day = day.split.delete_if{|x| daysOfWeek.include?(x)}.join(' ').split(' at')[0] #remove weekday and time
		currentUsers.each do |u|
			u.add_message(day)
		end
	end
end

# Write to CSV
CSV.open("result.csv", "w") do |csv|
	people.each do |u|
		puts u.name
		u.messages.each do |m|
			csv << [u.name, m.count, m.date]
		end
	end
end

