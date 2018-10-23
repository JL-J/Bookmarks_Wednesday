require 'pg'

class Bookmark

  def self.create
    @bookmark || Bookmark.new
  end

  def view
    con = connect_to_database
    rs = con.exec 'SELECT url FROM bookmarks'
    rs.map { |e| e["url"] }.join(' ')
  end

  def add(url)
    con = connect_to_database
    con.exec "INSERT INTO bookmarks (url) VALUES ('#{url}');"
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
