# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new email: "default@user.com", password: '19041988g', password_confirmation: '19041988g'
user.skip_confirmation!
user.save!

report = Report.new title: 'Main Report', email_to: 'eb3f9d54547d346e6936@cloudmailin.net'
report.save

report.users << user
