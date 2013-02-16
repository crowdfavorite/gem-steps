# cf-steps

## General

A gem meant to aid in simple user feedback in scripting environments.

Works with:

  - Capistrano Tasks
  - Rake Tasks
  - Generic Ruby shell scripting

## Usage

To define a "step" in your scripting process simply surround the grouping of operations like this.

```ruby
    def step "Do Something" do
      # stuff you want to do
    end
```

Nested steps are supported

### Other

  **Exit if step fails**

```ruby
    def step "Super Important", :vital => true do
      # vital stuff
    end
```

  **Manually bail out of step**

```ruby
    def step "Do Something" do
      # do something
      if you_want_to_bail
        raise "This is the error Message"
      end
    end
```

  **Custom Complete Message**

```ruby
    def step "Do Something" do
      # do something
      "This is the success Message"
    end
```

  **Provide feedback**

```ruby
    def step "Do Something" do
      # do something
      report "The user would like to see this info"
      # do more stuff
    end
```
### Getting User Feedback (highline integration)

#### confirm

Function similar to highline agree function, except it plays nice with our output.

It also accepts a `:vital` option if you want to exit with a negative response (No).

#### retrieve

The retrieve function is essentially a shadow of the highline ask function, except it plays nice with our output

