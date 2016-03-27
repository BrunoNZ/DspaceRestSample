class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.string :title
      t.integer :community_id

      t.timestamps null: false
    end
  end
end
