class AddUserReference < ActiveRecord::Migration
  def change
    change_table :gadgets do |t|
      t.references :user, index: true
    end
  end
end
