require 'pg'

class Bookmark

  def initialize
  end

  def view
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => "bookmark_manager_test"
    else
      con = PG.connect :dbname => "bookmark"
    end
    rs = con.exec 'SELECT url FROM bookmarks'
    rs.map { |e| e["url"] }.join(' ')
  end

  def self.create
    @bookmark || Bookmark.new
  end

end
