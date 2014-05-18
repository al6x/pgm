class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :gadget, index: true
      t.timestamps
    end
    add_attachment :images, :image
  end
end
