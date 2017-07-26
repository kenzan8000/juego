class ImportTextTask

  # import database from text
  #
  # @param file_name string
  def perform(file_name)
    file = File.read(file_name)
    lines = file.gsub(/\r\n?/, "\n")
    lines.each_line do |line|
      texts = line.split(',', 2)
#      texts.first
#      texts.last
    end
  end

end

import_text_task = ImportTextTask.new
import_text_task.perform('lib/assets/spanish top1000 sem ser google c audio.txt')
