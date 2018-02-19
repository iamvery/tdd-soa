class AddAgeToCats < ActiveRecord::Migration[5.1]
  def change
    add_column :cats, :age, :integer
    change_column_null :cats, :age, false, 0
  end
end
