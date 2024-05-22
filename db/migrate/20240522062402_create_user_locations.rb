class CreateUserLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :user_locations do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.string :provider
      t.integer :accuracy
      t.datetime :time
      t.string :deviceName

      t.timestamps
    end
  end
end
