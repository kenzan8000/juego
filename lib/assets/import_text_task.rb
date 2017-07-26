class ImportTextTask

  # import database from text
  #
  # @param language_set_id LanguageSet#id
  # @param file_name string
  def perform(language_set_id, file_name)
    file = File.read(file_name)
    lines = file.gsub(/\r\n?/, "\n")
    lines.each_line do |line|
      texts = line.split(',', 2)
      word = Word.find_or_create_by(language_set_id: language_set_id, text_in: texts.first, text_out: texts.last)
      word.save if word.valid?
    end
  end

end

