class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.boolean :read
      t.integer :display_count
      t.references :user, foreign_key: true
      t.references :media, foreign_key: true

      t.timestamps
    end
  end
end
