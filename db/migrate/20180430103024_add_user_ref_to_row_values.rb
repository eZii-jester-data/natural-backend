class AddUserRefToRowValues < ActiveRecord::Migration[5.1]
  def change
    add_reference :row_values, :user, foreign_key: true
  end
end
