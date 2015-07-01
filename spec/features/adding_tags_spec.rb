feature 'Adding tags' do
  scenario 'I can add a single tag to a link' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.makersacademy.com'
    fill_in 'title', with: 'Makers Academy'

    fill_in 'tag', with: 'Education'
    click_button 'Create Link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('Education')
  end
end
