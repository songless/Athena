class Hello < ActiveRecord::Base

	def self.up
		create_table :system_settings do |t|
			t.string :title
			t.string :author
			t.integer :isbn
		end
	end

	def self.search(search)
  		if search
    			find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  		else
    			find(:all)
		end
  	end

end
