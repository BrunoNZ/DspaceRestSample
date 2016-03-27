class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :title
      t.integer :id

      t.timestamps null: false
    end
  end
end
