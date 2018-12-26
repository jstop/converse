# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'


user = User.new 
user.email = "josh.stein107@gmail.com"
user.password = "oldfarm"
user.password_confirmation = "oldfarm"
user.save

task = Task.new
task.name = "Workout"
task.description = "Build some muscle"
task.duration = 60
task.user = user
task.save

program_payload = JSON.parse(File.read('/myapp/db/seed_data/programs/content.json'))
program = Program.new
program.payload = program_payload
program.save







#5.times do 
#  event = Event.new
#  event.title = Faker::Book.title
#  start = Faker::Time.between(Date.today, Date.today + 1.months, :morning)
#  event.start = start
#  event.end = Faker::Time.between(start, start + 2.days, :evening)
#  event.color = ['black','green','red', nil].sample
#  event.user = user
#  event.save
#end
