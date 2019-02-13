# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Destroy database.."
sleep(1)
User.destroy_all
Attendance.destroy_all
Event.destroy_all

sleep(1)
puts "Reset PK Sequence"
ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('events')
ActiveRecord::Base.connection.reset_pk_sequence!('attendances')

puts "Sucess, all DB deleted"
sleep(1)
puts "Generate new DB..."
puts ""
puts "_______________________________"
puts ""
sleep(1.5)
mdp = Faker::Internet.password(8)
15.times do
  mdp = Faker::Internet.password(8)
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::TvShows::SiliconValley.quote, email: Faker::Internet.email, password: mdp, password_confirmation: mdp)
  puts ""
  puts "user #{user.first_name} #{user.last_name} email : #{user.email}"
  sleep(0.05)
  puts "#{user.first_name}'s description :"
  puts "#{user.description}"
  puts ""
  puts "~~~~~~~~~~~~~~~~~~~next~~~~~~~~~~~~~~~~>"
end

sleep(1)

10.times do

  puts ""
  user = User.all.sample
  nb = Faker::Number.between(5, 1000)
  multiple_of_5 = nb%5 == 0
	event = Event.create!(participant_id: user.id, admin_event_id: user.id, start_date: Faker::Date.forward(5), duration: "5", title: Faker::Book.title, description: Faker::Lorem.paragraph(2),  price: Faker::Number.between(1, 1000), location: "Fresne")
  puts "#{event.title} is an event who begin at #{event.start_date} and cost #{event.price}"
  puts "_______________________________"
  puts ""
end

sleep(1)

20.times do
  user = User.all.sample
  event = Event.all.sample
  attendance = Attendance.create!(participant_id: user.id, event_id: event.id, stripe_customer_id: Faker::Number.between(0, 2000))
  puts "attendance id :#{attendance.id} is create"
  puts "_______________________________"
  puts ""

end


sleep(2)
puts "ALL GOOD, DB fresh and ready to be explored like as life"
