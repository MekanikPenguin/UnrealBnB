class AddColumnRatingToOffer < ActiveRecord::Migration[7.1]
  def change
    add_column :offers, :rating, :float
  end
end
