require_relative('../db/sql_runner')

class Album

  attr_reader :id
  attr_accessor :title, :quantity

  def initialize(options) 
    @id = options['id'].to_i
    @title = options['title']
    @quantity = options['quantity'].to_i
  end

end