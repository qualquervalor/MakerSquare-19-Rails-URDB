class AddShowtimesToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :showtimes, :string
  end
end
