class AddTimeToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :time, :datetime
  end
end
