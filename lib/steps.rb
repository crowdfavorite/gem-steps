# encoding: utf-8
require 'steps/output'

def step(desc, options={}, &block)
  Steps::Output.singleton.step(desc, options, &block)
end

def confirm(message, options={})
  Steps::Output.singleton.confirm(message, options)
end

def retrieve(message, answer_type = String, &block)
  Steps::Output.singleton.retrieve(message, answer_type, &block)
end

def start_to(message)
  Steps::Output.singleton.start_to(message)
end

def success(message = "✔")
  Steps::Output.singleton.success(message)
end

def error(message = "X")
  Steps::Output.singleton.error(message)
end

def error_and_exit(message)
  Steps::Output.singleton.error_and_exit(message)
end

def report(message, color="blue", bold=true)
  Steps::Output.singleton.report(message, color, bold)
end

