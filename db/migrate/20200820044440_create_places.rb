class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.belongs_to  :user, index: true, foreign_key: true
      t.string      :lat
      t.string      :long
      t.string      :description

      t.timestamps
    end
  end
end
