class Word < ApplicationRecord
  validates_presence_of :language_set_id, :text_in, :text_out
end
