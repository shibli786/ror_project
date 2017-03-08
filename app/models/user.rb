class User < ActiveRecord::Base

#to configure a different table name:
# self.table_name = "admin_users"

#many to many relationship 
# user can edit or create many pages 
#one page may be edited by many users
# pages_users will be used as a junction table for User and Pages
has_and_belongs_to_many :pages


#section_edit has user_id
has_many :section_edits


# user has many section
#user and section are joined via sectionedit model
#user do not know about section(No foreign key to section table)
#section also do not nkow about user(No foreign key towards uSER tABLE)
# SectionEdit contains both the information that which user edits on which section
# hence through is used

has_many :sections, :through=> "SectionEdit"
FORBIDDEN_USERNAME=["syed.shibli1","sam1234567",]

EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

#validates :first_name, :presence =>true, :length =>{:maximum=>25}
validates_presence_of :name 
validates_presence_of :username
validates_presence_of :email
validates_presence_of :password
validates_length_of :name , :maximum=>30
validates_length_of :username , :within=>8..20
validates_uniqueness_of :username
validates_length_of :email ,:maximum=>100
validates_format_of :email, :with =>EMAIL_REGEX
validates_confirmation_of :email


validate :username_is_allowed
validate :no_new_users_on_wednesday, :on=>:create

def username_is_allowed
	if FORBIDDEN_USERNAME.include?(username)
		errors.add(:username," is not allowed for username")
	end
end

def no_new_users_on_wednesday
	if Time.now.wday ==3
		errors[:base]<<"No new users on Wednesday."
		
	end
end

end
