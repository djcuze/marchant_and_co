class AddNameToSuppliers < ActiveRecord::Migration[5.1]
  def change
    add_column :suppliers, :name, :string
  end
end
