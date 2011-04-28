namespace :globalflush do

  task :start => :environment do
    
    puts "================ UPDATING THE DATABASE ======================"
    Rake::Task["db:migrate"].execute

    puts "================ INSERTING THE TESTING DATA ======================"
    Rake::Task["test:insert_data"].execute
    
  end

end
