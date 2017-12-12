class CreateClerks < ActiveRecord::Migration
  def change
		create_table :clerks do |t|
			t.string :clerk_no,:comment=>"工号"
			t.string :name,:comment=>"姓名"
			t.string :email,:comment=>"邮箱"
			t.string :entry_time,:comment=>"入职年份"
			t.string :depart,:comment=>"部门"
			t.string :position,:comment=>"职位名称"
			t.string :is_leader,:comment=>"是否是领导"
			t.string :sex,:comment=>"性别"
			t.string :salary,:comment=>'入职薪水'

			t.timestamps null: false
		end  	
  end
end