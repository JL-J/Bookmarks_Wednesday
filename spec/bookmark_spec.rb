require 'bookmark'

describe Bookmark do
  it 'returns a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('www.makersacademy.com', 'Makers Academy');")
    bookmark = Bookmark.create
    expect(bookmark.view).to include "www.makersacademy.com"
    expect(bookmark.view).to include "Makers Academy"
  end

  it 'adds a new bookmark' do
    bookmark = Bookmark.create
    bookmark.add('www.bbc.com', 'BBC')
    expect(bookmark.view).to include 'www.bbc.com'
    expect(bookmark.view).to include 'BBC'
  end

  it 'removes a bookmark' do
    bookmark = Bookmark.create
    bookmark.add('www.bbc.com', 'BBC')
    bookmark.remove('BBC')
    expect(bookmark.view).not_to include 'BBC'
  end

end
