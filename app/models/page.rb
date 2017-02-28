class Page < ActiveRecord::Base


	# pages table contain foreign key marking toward Subject table 
	# through which we can identify the subject 
	belongs_to :subject

	has_and_belongs_to_many :editors ,:class_name=>"User"

end
