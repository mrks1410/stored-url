class AddColumnToUrl < ActiveRecord::Migration[6.1]
  def change
    add_column :urls, :title, :string
  end
end
