class AddStateToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :state
  end
end
