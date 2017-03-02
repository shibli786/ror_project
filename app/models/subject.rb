class Subject < ActiveRecord::Base


#subjects table will be merged with pages table
#pages table hold foreign key marking toward section table
has_many :pages



end
