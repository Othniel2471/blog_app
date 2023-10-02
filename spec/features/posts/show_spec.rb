require 'rails_helper'

RSpec.describe 'Posts index', type: :feature do
  before :each do
    @user = User.create(name: 'otsama', photo: 'photo', bio: 'software developer', posts_counter: 5)
    post4 = Post.create(title: 'test title 4', text: 'test text', comment_counter: 1, likes_counter: 1,
                        author_id: @user.id)
    post5 = Post.create(title: 'test title 5', text: 'test text', comment_counter: 1, likes_counter: 1,
                        author_id: @user.id)
    post6 = Post.create(title: 'test title 6', text: 'test text', comment_counter: 1, likes_counter: 1,
                        author_id: @user.id)
    comment = Comment.create(text: 'test text', author_id: @user.id, post_id: post4.id)
    comment2 = Comment.create(text: 'test text', author_id: @user.id, post_id: post5.id)
    comment3 = Comment.create(text: 'test text', author_id: @user.id, post_id: post6.id)
    like = Like.create(author_id: @user.id, post_id: post4.id)
    visit user_posts_path(@user.id)
  end

  it 'shows the post title' do
    expect(page).to have_content('test title 6')
    expect(page).to have_content('test title 5')
    expect(page).to have_content('test title 4')
  end

  it 'shows who wrote the post' do
    expect(page).to have_content('otsama')
  end

  it 'shows number of comments a post has' do
    expect(page).to have_content('1')
  end

  it 'shows number of likes a post has' do
    expect(page).to have_content('1')
  end

  it 'shows post body' do
    expect(page).to have_content('test text')
  end

  it 'shows username of each commentor' do
    expect(page).to have_content('otsama')
  end
end
