require 'bookmark'

describe Bookmark do
  it 'returns a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url) VALUES ('www.makersacademy.com');")
    bookmark = Bookmark.create
    expect(bookmark.view).to include "www.makersacademy.com"
  end

  

end
