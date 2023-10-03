require 'rails_helper'

RSpec.describe 'Users index', type: :feature do
  before :each do
    User.create(name: 'otsama', photo: 'photo', posts_counter: 5)
    User.create(name: 'otsama', photo: 'photo', posts_counter: 5)
    User.create(name: 'otsama', photo: 'photo', posts_counter: 5)
    User.create(name: 'otsama', photo: 'photo', posts_counter: 5)
    User.create(name: 'otsama', photo: 'photo', posts_counter: 5)
    User.create(name: 'otsama', photo: 'photo', posts_counter: 5)
    visit users_path
  end

  it 'shows username for all users' do
    expect(page).to have_content('otsama', count: 6)
  end

  it 'shows photo for all users' do
    expect(page).to have_css('img', count: 6)
  end

  it 'shows number of posts for all users' do
    expect(page).to have_content('5', count: 6)
  end

  it 'when click on username, it redirects to user profile' do
    click_link('otsama', match: :first)
    expect(page).to have_content('otsama')
  end
end
