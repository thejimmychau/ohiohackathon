class Event < ActiveRecord::Base    
    attr_accessor :address      #Model 'method' for getting address. This is simply a reference to a view form field's value
    
    belongs_to :user
    has_many :attends
end
