require 'geokit'
include Geokit::Geocoders

class Event < ActiveRecord::Base 
    
    validates :title, presence: true, length: { maximum: 50 }
    #validate :end_time_is_later
    validates :start_time, :end_time, presence: true
    validate :geocode_validish
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
    
    def end_time_is_later
        
        errors.add(:start_time, 'must be earlier than end time') if
        self.start_time > self.end_time
    end
end
