class CreateBoxes < ActiveRecord::Migration
  def self.up
    create_table :boxes do |t|
      t.string :barcode
      t.text :description
      t.string :status
      t.string :classification
      t.string :location

      t.timestamps
    end
  end

  def self.down
    drop_table :boxes
  end
end
