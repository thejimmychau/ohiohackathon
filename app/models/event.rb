class Event < ActiveRecord::Base    
    attr_accessor :address      #Model 'method' for getting address. This is simply a reference to a view form field's value
    
    belongs_to :user
    has_many :attends
    
    #setup geokit mapping
    acts_as_mappable :default_units => :miles,
                    :default_formula => :sphere,
                    :distance_field_name => :distance,
                    :lat_column_name => :latitude,
                    :lng_column_name => :longitude
end
