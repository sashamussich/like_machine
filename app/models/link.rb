require './lib/DateStuffies'

class Link < ActiveRecord::Base
   
   belongs_to :user

   acts_as_votable

   validates :title, presence: true, uniqueness: true
   validates :url, :url => true, :presence => true, uniqueness: true

   # default_scope { order('created_at desc, cached_votes_up desc') } 

   def self.make_hash_by_date links
    	# self.sort_by_highest_votes_score hash
       # links.to_a.sort_by{|link| link[:cashed_votes_up]}.reverse
     hash = links.group_by{|link| DateStuffies.pretty_just_date_format link.created_at}
   end

end
