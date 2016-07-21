class Link < ActiveRecord::Base
   belongs_to :user	
   acts_as_votable

   def group_by_date
  		created_at.to_date.to_s(:db)
  		# raise
   end
end
