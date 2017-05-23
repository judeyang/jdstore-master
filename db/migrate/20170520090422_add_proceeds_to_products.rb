class AddProceedsToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :proceeds, :integer, default: 99
  end
end
