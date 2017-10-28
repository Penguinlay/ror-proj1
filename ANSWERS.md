## Question 0

### Why is this error being thrown?

Pokemon model has not been created yet.

---

## Question 1

### How are the random Pokemon appearing? What is the common factor between all the possible Pokemon that appear? *

The random Pokemon are appearing because in ` home_controller.rb `,

```ruby
def index
  trainerless_pokemon = Pokemon.where(trainer: nil)
  @pokemon = trainerless_pokemon.sample
end
```

it was defined to generate a random Pokemon as sample for a request on Pokemon without specifying a trainer.

The common factor each time a Pokeball is thrown is the common string "A wild * has appeared!" with * denoting the name of a random Pokemon.

---

## Question 2A

### What does the following line do ` <%= button_to "Throw a Pokeball!", capture_path(id: @pokemon), :class => "button medium", :method => :patch %> `? Be specific about what ` capture_path(id: @pokemon) ` is doing. If you're having trouble, look at the Help section in the README.

It generates a medium sized button with text "Throw a Pokeball!", which upon click will redirect to ` capture ` page with ` capture ` function perimeter ` pokemon ID `, which will then be rendered by controller after router patches the request as specified.

---

## Question 3

### What would you name your own Pokemon?

Penguinlay

---

## Question 4

### What did you pass into the ` redirect_to `? If it is a path, what did that path need? If it is not a path, why is it okay not to have a path here?

I passed prefix path ` trainer_path(pokemon.trainer) ` into the ` redirect_to `. The path needed trainer ID so that it could redirect to profile of a specific trainer.

---

## Question 5

### Explain how putting this line ` flash[:error] = @pokemon.errors.full_messages.to_sentence ` shows error messages on your form.

By specifying validations in model like presence and uniqueness, the system generates error messages if one of them goes wrong. Usually, you can halt the app ending up error page with those messages using ` save! ` instead of ` save ` or ` create! ` instead of ` create `. Instead, if we put the above line, then the error message is pretty printed on the screen to user without having to stop the application at error page.

---

## Give us feedback on the project and decal below!

This assignment is fun!

---

## Extra credit

### Link your Heroku deployed app.

Only one extra credit is done. I implemented healing action.

---

## Custom Settings

### For detail implementations, limitations, assumptions, and/or known bugs, see ` NOTES.md `.

---

## GitHub Repo Page URL

https://github.com/Penguinlay/ror-proj1
