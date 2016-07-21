class Link < ActiveRecord::Base
   belongs_to :user

   acts_as_votable

   validates :title, :url, presence: true, uniqueness: true

   default_scope { order('cast(created_at as date) desc, cached_votes_up desc') } 

    def self.make_hash_by_date links
		hash = links.group_by{|link| DateStuffies.pretty_just_date_format link.created_at}
    	# self.sort_by_highest_votes_score hash
      # hash.each do |date, links|
      #   links.to_a.sort_by{|link| link[:cashed_votes_score]}
      # end
    end

end
