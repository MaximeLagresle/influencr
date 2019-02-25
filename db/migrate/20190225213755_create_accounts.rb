class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :username
      t.string :url
      t.references :platform, foreign_key: true
      t.references :influencer, foreign_key: true

      t.timestamps
    end
  end
end
