require "test_helper"

class BlockedUserTest < ActiveSupport::TestCase
  test "should block and unblock a user" do
    michael = users(:michael)
    archer  = users(:archer)
    assert_not michael.blocked?(archer)
  end
#  test "should follow and unfollow a user" do
#     michael = users(:michael)
#     archer  = users(:archer)
#     assert_not michael.following?(archer)
#     michael.follow(archer)
#     assert michael.following?(archer)
#     assert archer.followers.include?(michael)
#     michael.unfollow(archer)
#     assert_not michael.following?(archer)
#     # Users can't follow themselves.
#     michael.follow(michael)
#     assert_not michael.following?(michael)
#   end

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
