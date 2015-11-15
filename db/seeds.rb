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
    
    :address => "Ohio Union",
    state: "Ohio",
    city: "Columbus",
    zip_code:43210,
    latitude: 39.9980611,
    longitude:-83.00892859999999
    )

 Event.create!( #nearby event, location = Ohio Union  
   title: "test-2",     
     start_time:Time.now,     
     end_time:Time.now+10000000,     
     event_tag_id:sportTagId,     
     description: "extremely fun!",     
     person_count_cap:10,     
     user_id:billy.id,          
     address:"Ohio Union",     
     state:"Ohio",     
     city:"Columbus",     
     zip_code:43210,     
     latitude: 40.0017,     
     longitude:-83.0197     )  

Event.create!( #far away event      
    title: "test-far",     
    start_time:DateTime.now,     
    end_time:DateTime.now+10,     
    event_tag_id:sportTagId,     
    description: "lots of fun!",     
    person_count_cap:10,     
    user_id:billy.id,          
    address:"5839 Westheimer Rd",     
    state:"Texas",     
    city:"Houston",     
    latitude: 29.737939,     
    longitude: -95.482203     ) 
