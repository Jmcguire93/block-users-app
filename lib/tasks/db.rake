namespace :admin do
  desc 'Decommission the provided user by deactivating account and cleaning up associations.'
  task :decom_user, [:email] => :environment do |task, args| 
    user_found = User.find_by(email: 'everyones-hero@singleops.com')  
    other_users = User.where.not(email: "everyones-hero@singleops.com").find_each do |user|
      user.unfollow(user_found) unless !user.following? user_found
    end
    user_found.delete 
  end
end