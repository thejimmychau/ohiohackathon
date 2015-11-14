require 'geokit'
include Geokit::Geocoders

class Event < ActiveRecord::Base    
    attr_accessor :address      #Model 'method' for getting address. This is simply a reference to a view form field's value
    validates :title, presence: true, length: { maximum: 50 }
	validates :description, presence: true, length: { maximum: 50 } 
	validates :person_count_cap, numericality: { only_integer: true }
    
    belongs_to :user
    has_many :attends
    
    #setup geokit mapping
    acts_as_mappable :default_units => :miles,
                    :default_formula => :sphere,
                    :distance_field_name => :distance,
                    :lat_column_name => :latitude,
                    :lng_column_name => :longitude
    
end
