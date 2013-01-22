desc "Deletes all happenings that happened more than 24 hours ago"
task :DeleteOldHappenings => :environment do

  happening_ids = Happening.find(:all, :conditions => ["time_of < ?", 24.hours.ago])
  favorites_id = Favorite.find(:all, :conditions => ["happening_id = ?", happening_ids])

  # Desetroy Favorites
  if favorites_id.size > 0
    Favorite.destroy(favorites_id)
    puts "#{favorites_id.size} favorites have been deleted!"
  end

  # Destroy happenings
  if happening_ids.size > 0
    Happening.destroy(happening_ids)
    puts "#{happening_ids.size} happenings have been deleted!"
  end
end
