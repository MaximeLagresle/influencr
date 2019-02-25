class CreateMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :media do |t|
      t.string :url
      t.string :content
      t.string :title
      t.references :influencer, foreign_key: true
      t.references :format, foreign_key: true
      t.references :platform, foreign_key: true

      t.timestamps
    end
  end
end
