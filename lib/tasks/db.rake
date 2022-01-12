namespace :admin do
  desc 'Decommission the provided user by deactivating account and cleaning up associations.'
  task :decom_user, [:email] => :environment do |task, args| 
    user_found = User.find_by(email: 'everyones-hero@singleops.com')  
    # Need to remove relationships before deleting user_found?
    user_found.delete           # Need to delete or deactivate?
  end
end