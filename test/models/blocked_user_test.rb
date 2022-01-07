require "test_helper"

class BlockedUserTest < ActiveSupport::TestCase
  test "should block and unblock a user" do
    michael = users(:michael)
    archer  = users(:archer)
    assert_not michael.blocked?(archer)
    michael.block(archer)
    assert michael.blocked?(archer)
    assert archer.blockers.include?(michael)
    michael.unblock(archer)
    assert_not michael.blocked?(archer)
    #Users can't block themselves
    michael.block(michael)
    assert_not michael.blocked?(michael)
  end


  test "feed should have the right posts" do 
    michael = users(:michael)
    archer  = users(:archer)
    # Posts from followed user
    michael.follow(archer)
    assert michael.feed.any? { |post| post.user_id == archer.id }
    michael.block(archer)
    assert_not michael.feed.any? { |post| post.user_id == archer.id }
    assert_not archer.feed.any? { |post| post.user_id == michael.id }
  end

  test "something" do
    michael = users(:michael)
    archer = users(:archer)
    michael.block(archer)
    assert archer.blocked_by?(michael)
  end



#   test "feed should have the right posts" do
#     michael = users(:michael)
#     archer  = users(:archer)
#     lana    = users(:lana)
#     # Posts from followed user
#     lana.microposts.each do |post_following|
#       assert michael.feed.include?(post_following)
#     end
#     # Self-posts for user with followers
#     michael.microposts.each do |post_self|
#       assert michael.feed.include?(post_self)
#     end
#     # Self-posts for user with no followers
#     archer.microposts.each do |post_self|
#       assert archer.feed.include?(post_self)
#     end
#     # Posts from unfollowed user
#     archer.microposts.each do |post_unfollowed|
#       assert_not michael.feed.include?(post_unfollowed)
#     end
#   end
# end
end
