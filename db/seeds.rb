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
    email: 'test1@test.org',
    first_name:'Jane',
    last_name:'TestUser',
    password: 'password',
    password_confirmation: 'password')

lurker = User.create!(
    email: 'test2@test.org',
    first_name:'lurker',
    last_name:'TestUser',
    password: 'password',
    password_confirmation: 'password')


taumer = User.create!(
    email: 'test3@test.org',
    first_name:'Taumer',
    last_name:'Anabtawi',
    password: 'password',
    password_confirmation: 'password')

Event.delete_all
events = []

address = "337 W. 17th Avenue"
coordinates = GoogleGeocoder.geocode(address+" Columbus Ohio 43221")
e = Event.create!( #nearby event, location = Ohio Union  
    title: "BBall ",  
    start_time:DateTime.now-3,
    end_time:DateTime.now+2,
    event_tag_id:sTagId,
    description: "Be ready to ball!",
    person_count_cap:10,
    user_id:taumer.id, 

    address: address,
    state: "Ohio",
    city: "Columbus",
    zip_code:43221,
    latitude: coordinates.latitude,
    longitude:coordinates.longitude
    )
events.push(e)

address = " 855 Woody Hayes Dr"
coordinates = GoogleGeocoder.geocode(address+" Columbus Ohio 43221")
e = Event.create!( #nearby event, location = Ohio Union  
    title: "Climbing ",  
    start_time:DateTime.now,
    end_time:DateTime.now+12/24.0,
    event_tag_id:sTagId,
    description: "Don't be afraid of heights",
    person_count_cap:10,
    user_id:taumer.id, 

    address: address,
    state: "Ohio",
    city: "Columbus",
    zip_code:43221,
    latitude: coordinates.latitude,
    longitude:coordinates.longitude
    )
events.push(e)


address = " 79 2015 Neil Ave "
coordinates = GoogleGeocoder.geocode(address+" Columbus Ohio 43221")
e = Event.create!( #nearby event, location = Ohio Union  
    title: "CSE study group",  
    start_time:DateTime.now-3,
    end_time:DateTime.now+3+22/24.0,
    event_tag_id:sTagId,
    description: "Not again...",
    person_count_cap:10,
    user_id:taumer.id, 

    address: address,
    state: "Ohio",
    city: "Columbus",
    zip_code:43221,
    latitude: coordinates.latitude,
    longitude:coordinates.longitude
    )
events.push(e)



start_addr_num = 2450
puts "Adding sports tags"

address = "2440 Northwest blvd"
coordinates = GoogleGeocoder.geocode(address+" Columbus Ohio 43221")
for i in 0..20
    e = Event.create!( #nearby event, location = Ohio Union  
        title: "test-near #{i}",  
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
    sleep(0.5)
end


address = "2430 Northwest blvd"
coordinates = GoogleGeocoder.geocode(address+" Columbus Ohio 43221")
for i in 0..20
    e = Event.create!( #nearby event, location = Ohio Union  
        title: "test-near #{i+20}",  
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
    
    sleep(0.5)
end




for i in 0..20
    start_addr_num+=1
    address = "#{start_addr_num} Northwest blvd"
    coordinates = GoogleGeocoder.geocode(address+" Columbus Ohio 43221")
    e = Event.create!( #nearby event, location = Ohio Union  
        title: "test-near#{start_addr_num}",  
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
    sleep(0.5)
end




puts "Adding academic tags"
for i in 0..20
    start_addr_num+=1
    address = "#{start_addr_num} Northwest blvd"
    coordinates = GoogleGeocoder.geocode(address+" Columbus Ohio 43221")
    e = Event.create!( #nearby event, location = Ohio Union  
        title: "test-near#{start_addr_num}",  
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
    sleep(0.5)
end



puts "Adding entertainment tags"
for i in 0..20
    start_addr_num+=1
    address = "#{start_addr_num} Northwest blvd"
    coordinates = GoogleGeocoder.geocode(address+" Columbus Ohio 43221")
    e = Event.create!( #nearby event, location = Ohio Union  
        title: "test-near#{start_addr_num}",  
        start_time:DateTime.now,
        end_time:DateTime.now+i/24.0,
        event_tag_id:eTagId,
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
    sleep(0.5)
end

Attend.delete_all

#jane has attended every one of billy's events
billy.events.each{|event|
    Attend.create!(
        user_id: jane.id,
        event_id: event.id
        )
    
    a = Attend.create!(
        user_id: lurker.id,
        event_id: event.id
        )
    }

jane.events.each{|event|
    Attend.create!(
        user_id: lurker.id,
        event_id: event.id
        )
    }

