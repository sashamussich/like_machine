require './lib/date_stuffies' #heroku deployment doesnt work without this

class Link < ActiveRecord::Base
   
   after_update_commit { LinksUpdatesBroadcastJob.perform_later self } 

   belongs_to :user

   acts_as_votable

   validates :title, presence: true, uniqueness: true
   validates :url, :url => true, :presence => true, uniqueness: true

   default_scope { order('Date(created_at) desc, cached_votes_up desc') } 

   def self.make_hash_by_date links
    	# self.sort_by_highest_votes_score hash
       # links.to_a.sort_by{|link| link[:cashed_votes_up]}.reverse
     hash = links.group_by{|link| DateStuffies.pretty_just_date_format link.created_at}
   end

   def self.vote data
      link = Link.find data['link_id']
      current_user = User.find data['current_user_id']
      if data['vote'] == "like"
        link.upvote_from current_user
      else
        link.downvote_from current_user
      end
   end

end
