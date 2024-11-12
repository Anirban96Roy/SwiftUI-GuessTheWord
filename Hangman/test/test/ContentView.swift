import SwiftUI

struct ContentView:View {
    private let words=["SWIFT","HANGMAN","APPLE","XCODE","CODING"]
    
    // Game state variables
    @State private var selectedWord:String =""
    @State private var displayedWord:String =""
    @State private var guessedLetters:[Character] =[]
    @State private var attemptsLeft=7
    @State private var gameOver=false
    @State private var gameResultMessage=""
    @State private var guess=""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Hangman Game")
                .font(.largeTitle)
                .bold()
            
            // Displayed word with underscores for unguessed letters
            Text(displayedWord)
                .font(.title)
                .padding()
            
            // Remaining attempts
            Text("Attempts left: \(attemptsLeft)")
                .font(.subheadline)
            
            // Guessed letters
            Text("Guessed letters: \(guessedLetters.map {String($0)}.joined(separator: ", "))")
                .padding(.top,10)
            
            // Input for letter guesses
            HStack {
                TextField("Enter a letter", text:$guess)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width:100)
                    .onChange(of:guess) { _ in
                        guess=String(guess.prefix(1)).uppercased() // Only allow single letters
                    }
                
                Button("Guess"){
                    if let letter=guess.first {
                        makeGuess(letter: letter)
                        guess=""
                    }
                }
                .disabled(gameOver||guess.isEmpty)
                .padding()
            }
            
            // Game result message
            if gameOver{
                Text(gameResultMessage)
                    .font(.title)
                    .foregroundColor(.red)
                    .padding()
                
                Button("New Game") {
                    startNewGame()
                }
            }
        }
        .padding()
        .onAppear {
            startNewGame()
        }
    }
    
    // Start a new game
    func startNewGame() {
        selectedWord=words.randomElement() ?? "SWIFT"
        displayedWord=String(repeating: "_ ", count: selectedWord.count).trimmingCharacters(in: .whitespaces)
        guessedLetters.removeAll()
        attemptsLeft=7
        gameOver=false
        gameResultMessage=""
    }
    
    // Handle a letter guess
    func makeGuess(letter:Character){
        if guessedLetters.contains(letter)||gameOver { return }
        
        guessedLetters.append(letter)
        
        if selectedWord.contains(letter){
            updateDisplayedWord()
            
            // Check if the player has won
            if !displayedWord.contains("_"){
                gameOver = true
                gameResultMessage = "You won! 🎉"
            }
        } else {
            // Incorrect guess reduces attempts
            attemptsLeft -=1
            if attemptsLeft==0 {
                gameOver=true
                gameResultMessage="You lost! The word was \(selectedWord)."
            }
        }
    }
    
    // Update displayed word with guessed letters
    func updateDisplayedWord() {
        var newDisplay=""
        for letter in selectedWord {
            if guessedLetters.contains(letter) {
                newDisplay += "\(letter) "
            } else {
                newDisplay += "_ "
            }
        }
        displayedWord=newDisplay.trimmingCharacters(in: .whitespaces)
    }
}
