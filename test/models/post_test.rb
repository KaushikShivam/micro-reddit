# frozen_string_literal: true

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @post = Post.new(link: 'hey', user_id: 1)
  end

  test "post should'nt be empty" do
    @post.link = ''
    assert_not @post.valid?
  end

  test 'post should have a user id ' do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test 'post shouldnt be more than 140 chars' do
    @post.link = 'a' * 141
    assert_not @post.valid?
  end
end
