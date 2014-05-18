class AddSearchFieldToGadget < ActiveRecord::Migration
  def change
    change_table :gadgets do |t|
      t.text :search
    end
  end
end
