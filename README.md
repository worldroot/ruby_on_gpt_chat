# Chat System with Rooms

This is a chat system that allows users to create rooms and chat with other users in real-time. The system utilizes broadcasting to send and receive messages and includes tests using RSpec to ensure its functionality.

## Features

- User authentication with Devise
- Ability to create and join chat rooms
- Real-time messaging using broadcasting
- Tests using RSpec to ensure functionality
- Utilizes Git Flow for development workflow
- TDD using `bundle exec guard`

## Getting Started

Before getting started with the chat system, you'll need to set up your environment variables by creating a `.env` file based on the `.env.example` file that already exists in the root directory of the project. Once that's done, follow these steps:

1. Clone the repository to your local machine.
2. Run `bundle install` to install the necessary gems.
3. Run `rails db:create db:migrate db:seed` to set up the database.
4. Run `bin/dev` to start the server.
5. Open your web browser and go to `http://localhost:3000`.

You should now be able to use the chat system to create and join chat rooms and chat with other users in real-time.

## Technologies Used

The chat system was built using Ruby on Rails, with the following technologies:

- Devise for user authentication
- Action Cable for real-time messaging using broadcasting
- RSpec for testing

## Testing

Testing is done using RSpec with TDD (Test Driven Development) approach. To run the tests, simply execute `bundle exec guard` in the terminal. This will run the tests automatically whenever there's a change in the code.

## Contributing

If you would like to contribute to the chat system, please fork the repository and submit a pull request.
