class CreateInfluencers < ActiveRecord::Migration[5.2]
  def change
    create_table :influencers do |t|
      t.string :name
      t.string :bio

      t.timestamps
    end
  end
end
