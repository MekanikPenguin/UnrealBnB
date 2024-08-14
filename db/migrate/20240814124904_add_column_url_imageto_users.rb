class AddColumnUrlImagetoUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :url_image, :string
  end
end
