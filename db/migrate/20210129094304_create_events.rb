class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string     :name,             null: false
      t.text       :explanation,      null: false
      t.string     :genre,            null: false
      t.date       :date,             null: false
      t.string     :capacity,         null: false
      t.string     :place,            null: false
      t.timestamps
    end
  end
end
