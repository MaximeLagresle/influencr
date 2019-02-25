class CreateFormats < ActiveRecord::Migration[5.2]
  def change
    create_table :formats do |t|
      t.string :type_of
      t.float :weight

      t.timestamps
    end
  end
end
