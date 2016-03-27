class CreateBitstreams < ActiveRecord::Migration
  def change
    create_table :bitstreams do |t|

      t.timestamps null: false
    end
  end
end
