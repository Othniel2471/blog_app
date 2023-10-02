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
    visit user_posts_path(@user.id)
  end

  it "shows the user's profile picture" do
    expect(page).to have_css('img')
  end

  it "shows the user's name" do
    expect(page).to have_content('otsama')
  end

  it 'shows the number of posts' do
    expect(page).to have_content('5')
  end

  it 'shows posts title' do
    expect(page).to have_content('test title 6')
    expect(page).to have_content('test title 5')
    expect(page).to have_content('test title 4')
  end

  it "shows some of the post's body" do
    expect(page).to have_content('test text')
  end

  it 'shows the first comments on a post' do
    expect(page).to have_content('test text')
  end

  it 'shows the number of comments' do
    expect(page).to have_content('1')
  end

  it 'shows the number of likes' do
    expect(page).to have_content('1')
  end

  it 'shows pagination' do
    expect(page).to have_css('ul.pagination')
  end

  it 'clicked on post title, it redirects to post show page' do
    click_link('test title 6')
    expect(page).to have_content('test title 6')
  end
end
