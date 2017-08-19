class ChangeTimeCoumnInMessages < ActiveRecord::Migration[5.1]
  def change
    change_column :messages, :time, :datetime
  end
end
