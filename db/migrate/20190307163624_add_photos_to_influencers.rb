class AddPhotosToInfluencers < ActiveRecord::Migration[5.2]
  def change
    add_column :influencers, :photo, :string
  end
end
