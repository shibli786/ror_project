class CreateSubjects < ActiveRecord::Migration
  def up
   		create_table :subjects do |t|
		t.string :name, :limit=>50
		t.integer "position"
		t.boolean :visible , :default=>false
		t.timestamp
    end
  end

  def down
  	drop_table("subjects")
  end
end
