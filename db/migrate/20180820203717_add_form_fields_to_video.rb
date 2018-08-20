class AddFormFieldsToVideo < ActiveRecord::Migration[5.1]
  def change
    add_column :videos, :genre, :string
    add_column :videos, :series, :boolean
    add_column :videos, :end_airing_date, :date
    add_column :videos, :run_time, :integer
    add_column :videos, :segments, :integer
    add_column :videos, :crew, :text
    add_column :videos, :additional_info, :text
  end
end
