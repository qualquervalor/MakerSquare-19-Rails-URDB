class RemoveShowtimesFromMovie < ActiveRecord::Migration
  def change
  	remove_column :movies, :showtimes
  end
end
