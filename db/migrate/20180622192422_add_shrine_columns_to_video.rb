class AddShrineColumnsToVideo < ActiveRecord::Migration[5.1]
  def change
    add_column :videos, :clip_data, :text
  end
end
