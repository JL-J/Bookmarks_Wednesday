require 'pg'

class Bookmark

  def self.create
    @bookmark || Bookmark.new
  end

  def view
    con = connect_to_database
    rs = con.exec 'SELECT url, title FROM bookmarks'
    rs.map do  |bookmark|
      "#{bookmark['title']}: #{bookmark['url']}\n"
    end.join("")
  end

  def add(url, title)
    con = connect_to_database
    con.exec "INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}');"
  end

  def remove(title)
    con = connect_to_database
    con.exec "DELETE FROM bookmarks WHERE title='#{title}';"
  end

  private

  def connect_to_database
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => "bookmark_manager_test"
    else
      con = PG.connect :dbname => "bookmark"
    end
  end

end
