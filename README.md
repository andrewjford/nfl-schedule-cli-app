# nfl-schedule-cli-app
A CLI ruby app to access NFL team's upcoming schedules.

Instructions to run:
-enter 'bundle install' in the main directory to get dependencies
-enter 'bin/run' to execute

Using the app:

The first prompt of the app asks for an NFL conference. The user can respond with 'a' to get a list of AFC teams or 'n' to get a list of NFC teams. Each team has an associated number when listed. Entering 'c' takes the user to the second section of the app.

The second prompt of the app accepts any number '1' to '32' or 'n'. The numbers refer to the team numbers from the previous team listings. Entering a number will bring up that team's current schedule. An input of 'n' will exit this menu.
