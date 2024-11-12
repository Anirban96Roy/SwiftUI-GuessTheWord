# Hangman Game in SwiftUI

A simple **Hangman Game** built with **SwiftUI**, where players attempt to guess a randomly selected word one letter at a time. Guess correctly and reveal the word, but make too many incorrect guesses and you’ll lose the game!

## Features

- **Random Word Selection**: The game randomly picks a word from a preset list.
- **Guess Tracking**: Displays the number of remaining attempts and shows all guessed letters.
- **Win/Lose Messages**: Shows a winning or losing message based on the game outcome.
- **New Game Option**: Easily restart the game by pressing "New Game" after a round ends.

## Game Rules

- You begin with **7 attempts** to guess the word correctly.
- Each letter guessed is either added to the displayed word or reduces the remaining attempts if incorrect.
- The game ends either when you guess the word or when you run out of attempts.

## How to Play

1. Run the app, and a random word will be selected in the background.
2. Type a letter in the input field and press "Guess" to make a guess.
3. Correct guesses reveal the letter's position(s) in the word.
4. Incorrect guesses reduce the remaining attempts by 1.
5. The game concludes once the word is revealed or attempts run out.

## Code Structure

- **`words`**: A preset list of possible words to guess.
- **`@State` properties**: Variables to track the game’s state (selected word, displayed word, attempts left, guessed letters, etc.).
- **`startNewGame()`**: Initializes or resets the game.
- **`makeGuess(letter:)`**: Processes each letter guess, updating attempts and guessed letters.
- **`updateDisplayedWord()`**: Builds the display of guessed letters and underscores for unguessed ones.

## Installation

To install and run the app:

1. Clone the repository:
   ```bash
   git clone https://github.com/username/repo-name.git
   ```
2. Open the project in **Xcode**.
3. Ensure you’re using **Xcode with SwiftUI** support.
4. Run the app on a simulator or device.

## Screenshots
![Screenshot 1](![1](https://github.com/user-attachments/assets/96eae9cf-8ad5-4258-bf05-c88edb743a57)
)
![Screenshot 2](![2](https://github.com/user-attachments/assets/d0780a78-5dd2-4104-9357-14bf342e5ed5)
)
![Screenshot 3](![3](https://github.com/user-attachments/assets/0f124860-280b-4c86-961d-eec3422d71cd)
)


## Future Improvements

- Add custom word lists or difficulty levels.
- Add animations or sound effects to enhance gameplay experience.
- Implement a score-tracking system across multiple games.

## License

Feel free to use, modify, or distribute this project as you wish.
