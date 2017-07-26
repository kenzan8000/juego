require './lib/assets/import_text_task'


task :update_models => :environment do
  #
  LANGUAGE_JSONS = [
    {:id => 1, :name => 'English'},
    {:id => 2, :name => 'Spanish'},
  ]
  LANGUAGE_JSONS.each do |language_json|
    language = Language.find_or_create_by(id: language_json[:id])
    language_json.each { |key, value| language[key] = value }
    language.save if language.valid?
  end
  #
  LANGUAGE_SET_JSONS = [
    {:id => 1, :language_in_id => 2, :language_out_id => 1},
  ]
  LANGUAGE_SET_JSONS.each do |language_set_json|
    language_set = LanguageSet.find_or_create_by(id: language_set_json[:id])
    language_set_json.each { |key, value| language_set[key] = value }
    language_set.save if language_set.valid?
  end

  import_text_task = ImportTextTask.new
  import_text_task.perform(1, 'lib/assets/files/spanish_top1000_words.txt')
end
