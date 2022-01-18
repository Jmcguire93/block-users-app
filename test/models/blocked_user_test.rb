require "test_helper"

class BlockedUserTest < ActiveSupport::TestCase
  test "should block and unblock a user" do
    michael = users(:michael)
    archer  = users(:archer)
    assert_not michael.blocked?(archer)
    michael.block(archer, "reason")
    assert michael.blocked?(archer)
    assert archer.blockers.include?(michael)
    michael.unblock(archer)
    assert_not michael.blocked?(archer)
    #Users can't block themselves
    michael.block(michael, "reason")
    assert_not michael.blocked?(michael)
  end


  test "feed should have the right posts" do 
    michael = users(:michael)
    archer  = users(:archer)
    # Posts from followed user
    michael.follow(archer)
    assert michael.feed.any? { |post| post.user_id == archer.id }
    michael.block(archer, "reason")
    assert_not michael.feed.any? { |post| post.user_id == archer.id }
    assert_not archer.feed.any? { |post| post.user_id == michael.id }
  end

  test "user can block another user" do
    michael = users(:michael)
    archer = users(:archer)
    michael.block(archer, "reason")
    assert archer.blocked_by?(michael)
  end
end
