class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(attr_hash = {})
        attr_hash.each do |key, value|
            self.send("#{key}=", value) if respond_to?("#{key}=")
        end
    end

    def self.save(name, type, db)
        # if self.id 
        #     self.update
        # else
        sql = <<-SQL 
        INSERT INTO pokemon (name, type) VALUES (?, ?)
        SQL
        db.execute(sql, name, type)
        #@id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
        
        # end
        #self
     end

     def self.find(id, db)
        sql = <<-SQL
        SELECT * 
        FROM pokemon
        WHERE id = ?
        --LIMIT 1
        SQL
        pokemon = db.execute(sql, id).flatten
        Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db)
        #binding.pry
        #Pokemon.new(pokemon)
        #     Pokemon.new(row)
        # end.first

     end



end
