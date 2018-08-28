class Pokemon
attr_accessor :id, :name, :type, :db

def initialize(id:, name:, type:, db:)
  @id = id
  @name = name
  @type = type
  @db = db
end

def self.save(name, type, db)
  db.execute("INSERT into pokemon (name, type) VALUES (?, ?);", name, type)
end

def self.find(id, db)
  new_poke = db.execute("SELECT #{id}, name, type FROM pokemon;")
  Pokemon.new(id: new_poke[0][0], name: new_poke[0][1], type: new_poke[0][2], db: db)
end

# def alter_hp(id, hp, db)
#   self.find(id, db)
#   db.execute("UPDATE pokemon set hp = #{hp} where id = #{id};")
# end

end
