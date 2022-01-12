namespace :admin do
  desc 'Deactivate account and cleaning up associations after attack.'
  task :fix_attack, [:email] => :environment do |task, args| 
    user_found = User.find_by(email: args.email)  
    time_hijacked = user_found.updated_at
    Relationship.destroy_by(followed: user_found, created_at: time_hijacked..)
    user_found.deactivate
  end
end