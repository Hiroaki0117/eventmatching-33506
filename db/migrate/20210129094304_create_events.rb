class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string     :name,             null: false
      t.text       :explanation,      null: false
      t.string     :genre_id,         null: false
      t.date       :day,              null: false
      t.integer    :start_time_id,    null: false
      t.integer    :end_time_id,      null: false          
      t.string     :capacity,         null: false
      t.integer    :area_id,          null: false
      t.string     :place,            null: false
      t.float      :latitude
      t.float      :longitude
      t.references :user,             foreign_key: true
      t.timestamps
    end
  end
end
