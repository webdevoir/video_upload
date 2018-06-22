class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :name
      t.string :email
      t.integer :duration

      t.timestamps
    end
  end
end
