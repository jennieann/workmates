module PersonsHelper
  def fullname ( person )
    "#{person.name} #{person.lastname}"
  end
end
