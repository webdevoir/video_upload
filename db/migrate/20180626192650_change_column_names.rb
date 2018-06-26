class ChangeColumnNames < ActiveRecord::Migration[5.1]
  def change
    rename_column :videos, :email, :uploader_email
    rename_column :videos, :name, :uploader_name
  end
end
