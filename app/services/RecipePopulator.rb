class RecipePopulator

  attr_reader :filename

  def self.populate_with(filename)
    new(filename).populate
  end

  def initialize(filename)
    @filename = filename
  end

  def populate
    File.read(filename).lines.each do |line|
      Recipe.create creation_params(line)
    end
  end
    
  def creation_params(line)
    h = JSON.parse line.chomp
    h.merge('searchable_ingredients' => h['ingredients'].to_json)
     .except('tags', 'image', 'nb_comments', 'author_tip', 'ingredients')
  end

end
