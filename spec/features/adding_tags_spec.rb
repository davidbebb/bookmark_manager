require 'spec_helper'



feature 'Adding tags' do
  before(:each) do
     Link.create(url: 'http://www.makersacademy.com',
                 title: 'Makers Academy',
                 tags: [Tag.first_or_create(name: 'education, ruby')])
     Link.create(url: 'http://www.google.com',
                 title: 'Google',
                 tags: [Tag.first_or_create(name: 'search')])
     Link.create(url: 'http://www.zombo.com',
                 title: 'This is Zombocom',
                 tags: [Tag.first_or_create(name: 'bubbles')])
     Link.create(url: 'http://www.bubble-bobble.com',
                 title: 'Bubble Bobble',
                 tags: [Tag.first_or_create(name: 'bubbles')])
   end

  scenario 'I can filter links by tag' do
    visit '/tags/bubbles'
    within 'ul#links' do
      expect(page).not_to have_content('Makers Academy')
      expect(page).not_to have_content('Code.org')
      expect(page).to have_content('This is Zombocom')
      expect(page).to have_content('Bubble Bobble')
    end
  end

  scenario 'I can add multiple tags to a new link' do
    visit '/links/new'
    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name).to_s).to include('education', 'ruby')
  end

end
