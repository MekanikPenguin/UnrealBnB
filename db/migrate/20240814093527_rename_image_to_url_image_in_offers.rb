class RenameImageToUrlImageInOffers < ActiveRecord::Migration[7.1]
  def change
    rename_column :offers, :image, :url_image
  end
end
