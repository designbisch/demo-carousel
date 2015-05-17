# Week 2 Homework - Carousel Demo

**Time Spent:** 8+

**Description:** Description: A walkthrough of the iOS App Carousel showing the steps for signing in into an existing account, viewing the welcome tutorial, viewing the photo feed and creating a new account.

###**Completed user stories:**

Intro
- Static photo tiles on the initial screen

Sign In
- Tapping on email/password reveals the keyboard and shifts the scrollview and Sign In button up.
- User sees an error alert when no email is present or no password is present.
- User sees a loading screen upon tapping the Sign In button.
- User sees an error alert when entering the wrong email/password combination.
- User is taken to the tutorial screens upon entering the correct email/password combination.

Tutorial Screens
- User can page between the screens

Image Timeline
- Display a scrollable view of images.
- User can tap on the conversations button to see the conversations screen (push).
- User can tap on the profile image to see the settings view (modal from below).

Settings
- User can dismiss the settings screen.
- User can log out

###**Completed Optionals:**
Intro
- Photo tiles move with scrolling

Sign In
- When the keyboard is visible, if the user pulls down on the scrollview, it will dismiss the keyboard.
- Tapping in the form reveals the keyboard and shifts the scrollview and "Create a Dropbox" button up.
- User can tap "forgot password"

Sign Up
- Tapping on first/last/email/password reveals the keyboard and shifts the scrollview and create button up. 
- User sees an error alert if any field is empty.
- Terms opens webview w/ mobile terms of service page.
- Shake terms check box if user hasn't accepted the terms when they try to create an account
- Tapping the Agree to Terms checkbox selects the checkbox.

Welcome Tutorial
- User can page between the screens with updated dots
- Upon reaching the 4th page, hide the dots and show the "Take Carousel for a Spin" button.

Settings
- When user signs out display signout alert with delay before returning to the intro screen

###**Preview:**
<img src="https://github.com/designbisch/demo-carousel/blob/master/demo-carousel.gif?raw=true"></img>
