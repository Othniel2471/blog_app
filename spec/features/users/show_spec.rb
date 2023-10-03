require 'rails_helper'

RSpec.describe 'Users show', type: :feature do
  before :each do
    @user = User.create(name: 'otsama', photo: 'photo', bio: 'software developer', posts_counter: 5)
    @post4 = Post.create(title: 'test title 4', text: 'test text', comment_counter: 1, likes_counter: 1,
                         author_id: @user.id)
    @post5 = Post.create(title: 'test title 5', text: 'test text', comment_counter: 1, likes_counter: 1,
                         author_id: @user.id)
    @post6 = Post.create(title: 'test title 6', text: 'test text', comment_counter: 1, likes_counter: 1,
                         author_id: @user.id)
    visit user_path(@user)
  end

  it "it shows the user's profile picture" do
    expect(page).to have_css('img')
  end

  it "it shows the user's name" do
    expect(page).to have_content('otsama')
  end

  it 'shows the number of posts' do
    expect(page).to have_content('5')
  end

  it "shows the user's bio" do
    expect(page).to have_content('software developer')
  end

  it "shows the user's first 3 posts" do
    expect(page).to have_content('test title 6')
    expect(page).to have_content('test title 5')
    expect(page).to have_content('test title 4')
  end

  it "shows a button to view all user's posts" do
    expect(page).to have_link('See All Posts')
  end

  it "When I click a user's post, it redirects me to that post's show page" do
    click_on 'test title 4'
    expect(page).to have_content('test title 4')
  end

  it "when click on 'See All Posts', it redirects to user's posts index page" do
    click_link('See All Posts')
    expect(page).to have_content('test title 6')
    expect(page).to have_content('test title 5')
    expect(page).to have_content('test title 4')
  end
end
