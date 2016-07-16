require 'rails_helper'

feature 'Posts' do
  
  context 'when no posts have been added' do
    scenario 'user can see message saying no posts added yet, and an Add Post link' do
      visit '/posts'
      expect(page).to have_content('No posts added yet')
      expect(page).to have_link('Add Post')
    end
  end

  context 'when one post has been added' do
    before {
      Post.create(title: 'Paris on the weekend!')
    }
    scenario 'user can see the text of the post' do
      visit '/posts'
      expect(page).to have_content('Paris on the weekend!')
    end
  end

  context 'creating a restaurant' do
    scenario 'user complete form for a new post and then see their post on the posts page' do
      visit '/posts'
      click_link 'Add Post'
      fill_in 'Title', with: 'Paris on the weekend!'
      click_button 'Create Post'
      expect(page).to have_content('Paris on the weekend!')
      expect(current_path).to eq('/posts')
    end
  end

  context 'reviewing a post' do
    
    let!(:post) { Post.create(title: 'Paris on the weekend!') }

    scenario 'user can click on a post and see see further details' do
      visit '/posts'
      click_link 'Paris on the weekend!'
      expect(page).to have_content('Paris on the weekend!')
      expect(current_path).to eq("/posts/#{post.id}")
    end
  
  end



end