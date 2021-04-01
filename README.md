# Ruby on Rails Capstone Project.

In this project, I have used HTML and CSS to produce a website that looks closely like the old Twitter website.

The project functions in a way that forces every user to first create an account or login, if the user has an account. The user has a photo to show on his profile and a cover image that shows on his profile. When the user doesn't provide an image, then the first letter of the users username is displayed. Also when the user has no cover image, the user's fullname and username is displayed instead. 

Logged in the user see a timeline with only opinions of the ones he follows and his own opinions.

There is another view for the user profile, that shows a cover image above the specific user opinions and profile information on the right.

The functionality to follow/unfollow is very intuitive. '+' buttons to follow, '-' button to unfollow a user.

A user (when logged in) can either only like or dislike an opinion

# Screen Home Page

## Main Page
![Screenshot Main Page](./app/assets/images/homepage.png)


## Built With

   - Ruby,
   - Ruby on Rails,
   - SCSS,
   - Bootstrap,
   - Font Awesome,
   - RSpec(Testing)
   - Factory Bot Rails

## Live Demo

[Live Demo Link](https://boiling-escarpment-77933.herokuapp.com/)

## Video Presentation


https://user-images.githubusercontent.com/59238133/111859228-9aeb7800-893f-11eb-9c56-30ebe7616a81.mp4



## Getting Started

You can get a local copy of the repository please run the following commands on your terminal:

```
$ cd <folder>

$ git clone git@github.com:gabrie-lhilarion/opinorea.git
```

You need to add Yarn

```
$ yarn init
```

You need to install the required gems:

```
$ bundle install
```

Migrate the database

```
$ rake db:migrate
```

And run the server:

```
$ rails server
```


To navigate on the app you can enter http://localhost:3000/ on your browser, create a new account.

## Tests

The tests were created with RSpec, to run the tests you should open the app folder on console and run 
 
```
$ bundle exec rspec
```

It will run the following test files:

- spec/feature/features_spec.rb
- spec/models/following_spec.rb
- spec/models/user_spec.rb
- spec/models/like_spec.rb

👤 **Author**

Gabriel Hilarion

- Github: [@gabrie-lhilarion](https://github.com/gabrie-lhilarion)
- E-mail: [Gabriel Hilarion](mailto:gabrielhilarion@gmail.com)
- Linkedin: [Gabriel Hilarion](https://linkedin.com/in/gabrielhilarion/)
- Twitter: [@GabrielDeman](https://twitter.com/GabrielDeman)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

   - Project Capstone from Microverse HTML & CSS curriculum
   - Design idea (layout, colors, font) was inspired by Gregoire Vella, you can find the original idea on [Behance](https://www.behance.net/gregoirevella)
