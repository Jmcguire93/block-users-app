# SingleOps Engneering Recruitment Exercise

## License

All source code in the [Ruby on Rails Tutorial](https://www.railstutorial.org/)
is available jointly under the MIT License and the Beerware License. See
[LICENSE.md](LICENSE.md) for details.

All modifications and extra code is made available under the MIT License.

## Getting started

First define a variable for your GitHub username (this gets used in later steps)

```
$ export GITHUB_USER="[replace this with your GitHub user name]"
```



To get started with the app, first clone the repo and `cd` into the directory:

```
$ git clone https://github.com/SingleOps/recruitment_exercise_app_${GITHUB_USER}.git
$ cd recruitment_exercise_app_${GITHUB_USER}
```

Also make sure you’re using a compatible version of Node.js:

```
$ nvm install 16.13.0
$ node -v
v16.13.0
```

Then install the needed packages (while skipping any Ruby gems needed only in production):

```
$ yarn add jquery@3.5.1 bootstrap@3.4.1
$ gem install bundler -v 2.2.17
$ bundle _2.2.17_ config set --local without 'production'
$ bundle _2.2.17_ install
```

> _Note: _You may run into problems with the `yarn add jquery@3.5.1 bootstrap@3.4.1
` step if you have the newest version of Node.js installed. This Stack Overflow page should help you solve that problem: https://stackoverflow.com/questions/67241196/error-no-template-named-remove-cv-t-in-namespace-std-did-you-mean-remove ._
>
> _You should be able to use any regular Rails development setup (ruby, rbenv, etc.) to get this working (being able to use Google and Stack Overflow to solve these sorts of issues is a useful skill to have so consider that part of the exercise.  That said if you get really stuck and nothing you try is working just let us know)_

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you’ll be ready to seed the database with sample users and run the app in a local server:

```
$ rails db:seed
$ rails server
```

You can then log in as the sample administrative user with the email `engineering-test@singleops.com` and password `SingleOps`.

## Original source

This example app is derived from  the sample application from
[*Ruby on Rails Tutorial:
Learn Web Development with Rails*](https://www.railstutorial.org/)
(6th Edition)
by [Michael Hartl](http://www.michaelhartl.com/).

