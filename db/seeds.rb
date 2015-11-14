# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.delete_all

User.create!(
    email: 'test@test.org',
    first_name:'Billy',
    last_name:'TestUser',
    password: 'password',
    password_confirmation: 'password')