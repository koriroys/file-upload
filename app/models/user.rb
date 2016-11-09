class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :first_name, uniqueness: { scope: :last_name,
   message: "first name/last name combination already in use" }

  before_validation(on: :create) do
    self.first_name = first_name.capitalize if attribute_present?(:first_name)
    self.last_name = last_name.capitalize if attribute_present?(:last_name)
  end

# [x] Si même nom et prénom le contact ne doit être enregistré qu'un seul fois
# [x] Si même adresse email, le contact ne doit être enregistré qu'une seul fois
# [x] Si moins de 3 lettres dans le nom ou prénom cela doit être effacé
# [ ] Si l'adresse email est invalide le contact n'est pas enregistré
    # in a real app, would send an activation email, rather than try to validate an email
    # (basically anything with one @ sign might be a valid email address now)
# [ ] S'il y a des caractères invalides dans la liste ils doivent être corrigé
    # what constitutes an invalid character? What do you correct it to?
# [x] Les nom et prénoms doivent avoir le format suivant : Florian et non FLORIAN par exemple

end
