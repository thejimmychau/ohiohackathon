class Event < ActiveRecord::Base   
	validates :title, presence: true, length: { maximum: 50 }
	validates :description, presence: true, length: { maximum: 50 } 
	validates :person_count_cap, numericality: { only_integer: true }
    # attr_accessor :address      #Model 'method' for getting address. This is simply a reference to a view form field's value
    
    belongs_to :user
    has_many :attends
end
