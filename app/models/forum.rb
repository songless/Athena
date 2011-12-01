class Forum < ActiveRecord::Base
	attr_accessible :name, :desciption
	has_many :topics, :dependent => :destroy

   def most_recent_post
     begin
         topic = Topic.first(:order => 'last_post_at DESC', :conditions => ['forum_id = ?', self.id])  
         return topic
     rescue
     end
   end 
end
