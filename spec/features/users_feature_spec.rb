require 'rails_helper'

feature 'User can sign in and out' do
  
  context 'when not signed in and on the homepage' do
    scenario 'user can see sign in and sign up links, and not see sign out link' do
      visit '/posts'
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
      expect(page).not_to have_link('Sign out')
    end
  end

  context 'when user signed in' do
    scenario 'user cannot see sign in or sign up links, but can see sign out link' do
      sign_up
      visit '/posts'
      expect(page).to have_link('Sign out')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end

end