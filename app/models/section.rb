class Section < ActiveRecord::Base



#here sections and section_edits table will be merged
#no pivot table will be used
#section_edits table holds the key section_id which will be used

##NOTE
#section_edits at the same time is a pivot table for joining Section And User
# 
has_many :section_edits



# joining sections table and users table by default
#rails will search for pivot tabel name as users_section
#but here we are using intermidiate model SectionEdit which hold and user_id and section_id
#hence by specifying through key rails will join sections table and users table 
# by SectionEdit model

##NOTE
##here in User table we dont have any column for Section Id
##So we are using Intermediate model SectionEdit as  pivot model
##to joining the the Section and User
has_many :editors ,:through =>"SectionEdit",:class_name=>"User"





end
