class AddTimeToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :time, :time
  end
end
