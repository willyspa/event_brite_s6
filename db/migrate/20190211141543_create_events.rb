class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.datetime :start_date
      t.integer :duration
      t.string :title
      t.text :description
      t.integer :price
      t.string :location

      t.references :attendance, index: true
      t.references :admin_event, index: true


      t.timestamps
    end
  end
end
