module Util
  def self.prompt(msg, prompt = "(y)es, (n)o ")
    return true if ENV['SKIP_CAPISTRANO_DB_PROMPT']
    answer = Capistrano::CLI.ui.ask("#{msg} #{prompt} ? ") do |q|
      q.overwrite = false
      q.validate = /^y$|^yes$|^n$|^no$/i
      q.responses[:not_valid] = prompt
    end
    (answer =~ /^y$|^yes$/i) == 0
  end
end
