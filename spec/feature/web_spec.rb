feature 'index page' do
  scenario 'shows bookmarks on page' do
    visit '/'
    expect(page).to have_content('Bookmark page')
  end

  scenario 'views bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url) VALUES ('www.makersacademy.com');")
        connection.exec("INSERT INTO bookmarks (url) VALUES ('www.bookmark.com');")
    visit '/bookmarks'
    expect(page).to have_content ('www.bookmark.com')
  end

  scenario 'allows user to add a bookmark and recieve confirmation' do
    visit '/'
    click_button 'Add bookmark'
    fill_in('url', with: 'www.github.com' )
    click_button 'submit'
    expect(page).to have_content 'You have added a bookmark'
  end

  scenario 'allows user to add a bookmark and then view it in bookmarks page' do
    visit '/'
    click_button 'Add bookmark'
    fill_in('url', with: 'www.bbc.com' )
    click_button 'submit'
    click_button 'view all'
    expect(page).to have_content ('www.bbc.com')
  end
end
