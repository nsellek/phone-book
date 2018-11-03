class ChangeFurstNameToFirstNameForUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :furst_name, :first_name
  end
end
