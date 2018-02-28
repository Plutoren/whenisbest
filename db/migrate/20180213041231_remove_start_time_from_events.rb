class RemoveStartTimeFromEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :start_time, :time
  end
end
