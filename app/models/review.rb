class Review < ActiveRecord::Base

	belongs_to :user
	belongs_to :place
	
	validates_presence_of :score
	validates_presence_of :content

	after_save :calculate_average

	def calculate_average
		a = self.place.avererage_rating
		self.place.update_attribute(total_average_rating: a)
	end 
end
