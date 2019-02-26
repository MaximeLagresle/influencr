class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.boolean :read, default: false
      t.integer :display_count, default: 0
      t.references :user, foreign_key: true
      t.references :medium, foreign_key: true

      t.timestamps
    end
  end
end
