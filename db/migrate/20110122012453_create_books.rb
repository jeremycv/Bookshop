class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.integer :box_id
      t.string :title
      t.string :author
      t.text :description
      t.string :classification
      t.datetime :date_published

      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end
