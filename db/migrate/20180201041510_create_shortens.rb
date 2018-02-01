class CreateShortens < ActiveRecord::Migration[5.1]
  def change
    create_table :shortens do |t|
      t.string :url
      t.string :location
      t.datetime :last_seen_date
      t.integer :redirect_count, null: false, default: 0

      t.timestamps
    end
  end
end
