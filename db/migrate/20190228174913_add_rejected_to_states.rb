class AddRejectedToStates < ActiveRecord::Migration[5.2]
  def change
    add_column :states, :rejected, :boolean, default: false
  end
end
