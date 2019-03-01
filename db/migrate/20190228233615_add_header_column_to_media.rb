class AddHeaderColumnToMedia < ActiveRecord::Migration[5.2]
  def change
    add_column :media, :header, :string
  end
end
