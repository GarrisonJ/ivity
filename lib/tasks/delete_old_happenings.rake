desc "Deletes all happenings that happened more than 24 hours ago"
task :DeleteOldHappenings => :environment do

  happening_ids = Happening.find(:all, :conditions => ["time_of < ?", 24.hours.ago])

  if happening_ids.size > 0
    Happening.destroy(happening_ids)
    puts "#{happening_ids.size} happenings have been deleted!"
  end
end
