require 'cf-steps/output'

def confirm(message, options={})
  CFSteps::Output.confirm(message, options)
end

def retrieve(message, answer_type = String, &block)
  CFSteps::Output.retrieve(message, answer_type, &block)
end

def confirm(message, options={})
  CFSteps::Output.confirm(message, options)
end

def error(message)
  CFSteps::Output.error(message)
end

def error_and_exit(message)
  CFSteps::Output.error_and_exit(message)
end

def step(desc, options={}, &block)
  CFSteps::Output.step(desc, options, &block)
end

def report(message)
  step message.bold.blue do " " end
end
