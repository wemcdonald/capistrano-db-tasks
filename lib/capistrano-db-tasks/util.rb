module Util
  def self.prompt(msg, prompt = "(y)es, (n)o ")
    return true if ENV['SKIP_CAPISTRANO_DB_PROMPT']
    ask(:answer, "#{msg} #{prompt} ? ")
    (fetch(:answer) =~ /^y$|^yes$/i) == 0
  end
end
