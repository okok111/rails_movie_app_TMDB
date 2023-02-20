class AddOverviewToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :overview, :text
  end
end
