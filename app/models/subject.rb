class Subject < ActiveRecord::Base


#subjects table will be merged with pages table
#pages table hold foreign key marking toward section table
has_many :pages
validates_presence_of :name
#validates_length_of   :name, :maximum=>255, :minimum=>4
validates_length_of :name, :within=> 3..255
  


end
