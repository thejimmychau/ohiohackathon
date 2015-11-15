require 'geokit'
include Geokit::Geocoders

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

EventTag.delete_all

sTagId = EventTag.create!(tag_name:"Sports").id
aTagId = EventTag.create!(tag_name:"Academic").id
eTagId = EventTag.create!(tag_name:"Entertainment").id
EventTag.create!(tag_name:"Promotional")
EventTag.create!(tag_name:"Casual")

User.delete_all

billy = User.create!(
    email: 'test@test.org',
    first_name:'Billy',
    last_name:'TestUser',
    password: 'password',
    password_confirmation: 'password')

jane = User.create!(
    email: 'test2@test.org',
    first_name:'Jane',
    last_name:'TestUser',
    password: 'password',
    password_confirmation: 'password')

Event.delete_all
events = []
start_addr_num = 2450
puts "Adding sports tags"

address = "2440 Northwest blvd"
coordinates = GoogleGeocoder.geocode(address+" Columbus Ohio 43221")
for i in 0..20
    e = Event.create!( #nearby event, location = Ohio Union  
        title: "test-near",  
        start_time:DateTime.now-3,
        end_time:DateTime.now-3+i/24.0,
        event_tag_id:sTagId,
        description: "lots of fun!",
        person_count_cap:10,
        user_id:jane.id, 

        address: address,
        state: "Ohio",
        city: "Columbus",
        zip_code:43221,
        latitude: coordinates.latitude,
        longitude:coordinates.longitude
        )
    events.push(e)
end
address = "2430 Northwest blvd"
coordinates = GoogleGeocoder.geocode(address+" Columbus Ohio 43221")
for i in 0..20
    e = Event.create!( #nearby event, location = Ohio Union  
        title: "test-near",  
        start_time:DateTime.now-3,
        end_time:DateTime.now-3+i/24.0,
        event_tag_id:sTagId,
        description: "lots of fun!",
        person_count_cap:10,
        user_id:billy.id, 

        address: address,
        state: "Ohio",
        city: "Columbus",
        zip_code:43221,
        latitude: coordinates.latitude,
        longitude:coordinates.longitude
        )
    events.push(e)
end


for i in 0..20
    start_addr_num+=1
    address = "#{start_addr_num} Northwest blvd"
    coordinates = GoogleGeocoder.geocode(address+" Columbus Ohio 43221")
    e = Event.create!( #nearby event, location = Ohio Union  
        title: "test-near",  
        start_time:DateTime.now,
        end_time:DateTime.now+i/24.0,
        event_tag_id:sTagId,
        description: "lots of fun!",
        person_count_cap:10,
        user_id:billy.id, 

        address: address,
        state: "Ohio",
        city: "Columbus",
        zip_code:43221,
        latitude:coordinates.latitude,
        longitude:coordinates.longitude
        )
    events.push(e)
end



puts "Adding academic tags"
for i in 0..20
    start_addr_num+=1
    address = "#{start_addr_num} Northwest blvd"
    coordinates = GoogleGeocoder.geocode(address+" Columbus Ohio 43221")
    e = Event.create!( #nearby event, location = Ohio Union  
        title: "test-near",  
        start_time:DateTime.now+i/24.0,
        end_time:DateTime.now+(i+2)/24.0,
        event_tag_id:aTagId,
        description: "lots of fun!",
        person_count_cap:10,
        user_id:jane.id, 

        address: address,
        state: "Ohio",
        city: "Columbus",
        zip_code:43221,
        latitude:coordinates.latitude,
        longitude:coordinates.longitude
        )
    events.push(e)
end


puts "Adding entertainment tags"
for i in 0..20
    start_addr_num+=1
    address = "#{start_addr_num} Northwest blvd"
    coordinates = GoogleGeocoder.geocode(address+" Columbus Ohio 43221")
    e = Event.create!( #nearby event, location = Ohio Union  
        title: "test-near",  
        start_time:DateTime.now,
        end_time:DateTime.now+i/24.0,
        event_tag_id:eTagId,
        description: "lots of fun!",
        person_count_cap:10,
        user_id:jane.id, 

        address: address,
        state: "Ohio",
        city: "Columbus",
        zip_code:43221,
        latitude:coordinates.latitude,
        longitude:coordinates.longitude
        )
    events.push(e)
end

Attend.delete_all

events.each{|event|
    id = billy.id
    if(event.user_id == billy.id)
        id = jane.id
    end
    
    a = Attend.create!(
        user_id: id,
        event_id: event.id
        )
    }

