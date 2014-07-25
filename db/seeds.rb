# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

door = Door.create(name: "Front Door")
admin_user = User.create(name: "Dad", admin: true, pin: "1234", email: "dad@gmail.com", password: "password", password_confirmation: "password")
user = User.create(name: "Child", admin: false, pin: "1234", email: "child@gmail.com", password: "password", password_confirmation: "password")
temp_user = TempUser.create(name: "Plumber", pin: "1234", expiry_at: Time.now+1.day)