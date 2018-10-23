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
end
