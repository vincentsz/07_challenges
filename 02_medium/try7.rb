require 'yaml'
MESSAGES = YAML.load_file(test.yml)
puts MESSAGES['welcome']