# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.delete_all

billy = User.create!(
    email: 'test@test.org',
    first_name:'Billy',
    last_name:'TestUser',
    password: 'password',
    password_confirmation: 'password')

Event.delete_all

Event.create!( #nearby event, location = Ohio Union
    title: "test-near",
    description: "lots of fun!",
    person_count_cap:10,
    user_id:billy.id,
    latitude: 39.9980611,
    longitude:-83.00892859999999
    )

Event.create!( #far away event 
    title: "test-far",
    description: "lots of fun!",
    person_count_cap:10,
    user_id:billy.id,
    latitude: 0,
    longitude:0
    )