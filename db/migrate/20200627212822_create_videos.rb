class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :name
      t.string :url
      t.integer :views, default: 0
      t.references :user
      t.timestamps
    end
  end
end
