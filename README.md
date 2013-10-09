# steps

## General

A gem that produces simple user feedback in scripting environments.

Integrates with:

  - Capistrano Tasks
  - Rake Tasks
  - Generic Ruby shell scripting

## Installation

    gem install steps

## Usage

```ruby
require 'steps'
```

To define a "step" in your scripting process simply surround the grouping of operations like this.

```ruby
    step "Do Something" do
      # stuff you want to do
    end
```

Nested steps are supported

### Other

  **Exit if step fails.  If nested, fail parent step.**

```ruby
    step "Super Important", :vital => true do
      # vital stuff
    end
```

  **Manually bail out of a step**

```ruby
    step "Do Something" do
      # do something
      if you_want_to_bail
        raise "This is the error Message"
      end
    end
```

  **Custom Complete Message**

```ruby
    step "Do Something" do
      # do something
      "This is the success Message"
    end
```

  **Provide feedback**

```ruby
    step "Do Something" do
      # do something
      report "The user would like to see this info"
      # do more stuff
    end
```

### Getting User Feedback (highline integration)

#### confirm

Function similar to highline agree function, except it plays nice with our output.

It also accepts a `:vital` option if you want to exit with a negative response (No).

```ruby
    step "Confirm Blue" do
      if confirm "Do you like blue?"
        # bail out if they are not sure they like blue
        confirm "Are you sure you like blue?", :vital => true
      end
    end
```

#### retrieve

The retrieve function is essentially a shadow of the highline ask function, except it plays nice with our output

```ruby
    step "Get Favorite Color" do
      feedback = retrieve "What is your favorite color?"
    end
```

### Print stacktraces for errors - Debug Mode

To get more information while debugging you may activate the debug mode. The gem will print the stacktraces for exceptions while in debug mode.

```ruby
    step "Do something", :debug => true do
      # ...
    end
```

Debug mode is inherited by all nested steps.


### Capistrano Deployment Integration

If you want to quiet down your Capistrano output and use this to provide the output, you can manually quiet the Capistrano logger and use this gem in the following way.

```ruby
  require 'steps'

  logger.level = Logger::IMPORTANT      # or Capistrano::Logger::IMPORTANT

  # ... omitted ..

  before "deploy:update_code"       do start_to "Deploy" end
  after "deploy:update_code"        do success end

  before "bundle:install"           do start_to "Bundle" end
  after "bundle:install"            do success end

  before "deploy:migrate"           do start_to "Migrate Database" end
  after "deploy:migrate"            do success end

  before "deploy:assets:clean"      do start_to "Clean" end
  after "deploy:assets:clean"       do success end

  before "deploy:assets:precompile" do start to "Compile Assets" end
  after "deploy:assets:precompile"  do success end

  before "deploy:restart"           do start_to "Restart" end
  after "deploy:restart"            do success end
```

### Development

    rake test
    rake
    rake install

