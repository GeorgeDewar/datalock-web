# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

door = Door.create(name: "Front Door")
admin_user = User.create(name: "Dad", admin: true, pin: "1111", email: "dad@gmail.com", password: "password", password_confirmation: "password", ph_number: "+64221673298")
user = User.create(name: "Child", admin: false, pin: "2222", email: "child@gmail.com", password: "password", password_confirmation: "password", ph_number: "+64278188931")
temp_user = TempUser.create(name: "Plumber", pin: "3333", expiry_at: Time.now+1.day)

unlock_command = Command.create(code: "UNL", name: "Unlock")
lock_command = Command.create(code: "LOK", name: "Lock")
add_edit_user = Command.create(code: "USR", name: "Add/Edit User")
remove_user = Command.create(code: "REM", name: "Remove User")