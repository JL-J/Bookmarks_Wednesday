feature 'index page' do
  scenario 'shows bookmarks on page' do
    visit '/'
    expect(page).to have_content('Bookmark page')
  end

  scenario 'views bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('www.makersacademy.com', 'Makers Academy');")
    visit '/bookmarks'
    expect(page).to have_content ('www.makersacademy.com')
    expect(page).to have_content ('Makers Academy')
  end

  scenario 'allows user to add a bookmark and then view it in bookmarks page' do
    visit '/'
    click_button 'Add bookmark'
    fill_in('url', with: 'www.bbc.com' )
    fill_in('title', with: 'BBC' )
    click_button 'submit'
    click_button 'view all'
    expect(page).to have_content ('www.bbc.com')
    expect(page).to have_content ('BBC')
  end
end
