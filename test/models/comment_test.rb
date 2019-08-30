# frozen_string_literal: true

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @comment = Comment.new(body: 'good comment')
  end

  test 'comment should be valid' do
    assert_not @comment.valid?
  end

  test 'comment should have an user id' do
    @comment.user_id = nil
    assert_not @comment.valid?
  end

  test 'comment should have a post id' do
    @comment.post_id = nil
    assert_not @comment.valid?
  end

  test "comment shouldn't be empty" do
    @comment.body = ''
    assert_not @comment.valid?
  end

  test "comment shouldn't be more than 500 chars" do
    @comment.body = 'a' * 501
    assert_not @comment.valid?
  end

  test "comment shouldn't be less than 10 chars" do
    @comment.body = 'a' * 5
    assert_not @comment.valid?
  end
end
