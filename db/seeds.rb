# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

EventTag.delete_all

sportTagId = EventTag.create!(tag_name:"Sports").id
EventTag.create!(tag_name:"Academic")
EventTag.create!(tag_name:"Entertainment")
EventTag.create!(tag_name:"Promotional")
EventTag.create!(tag_name:"Casual")

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
    start_time:DateTime.now,
    end_time:DateTime.now+100,
    event_tag_id:sportTagId,
    description: "lots of fun!",
    person_count_cap:10,
    user_id:billy.id,
    latitude: 39.9980611,
    longitude:-83.00892859999999
    )

Event.create!( #far away event 
    title: "test-far",
    start_time:DateTime.now,
    end_time:DateTime.now+10,
    event_tag_id:sportTagId,
    description: "lots of fun!",
    person_count_cap:10,
    user_id:billy.id,
    latitude: 0,
    longitude:0
    )