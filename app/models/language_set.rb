class LanguageSet < ApplicationRecord
  validates_presence_of :language_in_id, :language_out_id
end
