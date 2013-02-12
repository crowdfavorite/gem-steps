# cf_steps

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
      // stuff you want to do
    end
```

Nested steps are supported

### Options

  **Exit if step fails**

```ruby
    def step "Super Important", :vital => true do
      // vital stuff
    end
```

  **Manually bail out of step**
  
```ruby
    def step "Do Something" do
      // do something
      if you_want_to_bail
        raise "This is the error Message"
      end
    end
```
  **Custom Complete Message**

```ruby
    def step "Do Something" do
      // do something
      "This is the success Message"
    end
```
