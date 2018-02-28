class AddMeridianFromEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :start_meridian, :string
    add_column :events, :end_meridian, :string
  end
end
