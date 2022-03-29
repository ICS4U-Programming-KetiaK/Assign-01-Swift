//
// RockPaperScissors.swift
//
// created by Ketia Gaelle Kaze
// created on 2022-03-22
// version 1.0
// Copyright (c) Ketia Gaelle Kaze. ALl rights reserved.
// The rockPaperScissors program asks a 
// user to enter a number between 1 and 3
// then the random generator tells the 
// user if the win, lose or tie with the computer.
//

import Foundation

// exception at runtime
enum MyError: Error {
  case runtimeError(String)
}

// function that gives the exception
func catchString() throws {
  throw MyError.runtimeError("Enter a valid integer!")
}

// declaring constants
let ROCK = 1
let PAPER = 2
let SCISSORS = 3

// declaring variables
var userGuessInt = 0
var ranNum: Int
var tries = 0
var userGuessString: String
var loopCounter: Int = 0

// use loop to guess number
while loopCounter != 1 {
  // generate random number
  ranNum = Int.random(in: ROCK..<SCISSORS + ROCK)
  // get user input
  print("Choose 1 for rock, 2 for paper and 3 for scissors: ", terminator: "")
  userGuessString = readLine()!

  do {
    // convert user input from string to an int
    userGuessInt = Int(userGuessString) ?? 0
      if userGuessInt != Int(userGuessString) {
        try catchString()
      }
        // check if guess is between 1 and 3
        if userGuessInt >= ROCK && userGuessInt <= SCISSORS {
          // increment tries
          tries += 1
          // check guess
          if userGuessInt == ranNum {
            print("The computer guessed \(ranNum)")
            print("You guessed \(userGuessInt)")
            print("It is a tie!")

          } else if userGuessInt == ROCK && ranNum == PAPER {
            print("The computer guessed \(ranNum)")
            print("You guessed \(userGuessInt)")
            print("You lost")

          } else if userGuessInt == PAPER && ranNum == ROCK {
            print("The computer guessed \(ranNum)")
            print("You guessed \(userGuessInt)")
            print("You win!")
            loopCounter += 1

          } else if userGuessInt == ROCK && ranNum == SCISSORS {
            print("The computer guessed \(ranNum)")
            print("You guessed \(userGuessInt)")
            print("You win!")
            loopCounter += 1

          } else if userGuessInt == SCISSORS && ranNum == ROCK {
            print("The computer guessed \(ranNum)")
            print("You guessed \(userGuessInt)")
            print("You lost")

          } else if userGuessInt == PAPER && ranNum == SCISSORS {
            print("The computer guessed \(ranNum)")
            print("You guessed \(userGuessInt)")
            print("You lost")

          } else {
            print("The computer guessed \(ranNum)")
            print("You guessed \(userGuessInt)")
            print("You win")
            loopCounter += 1
          }

        } else {
          // display error meassage
          print("Input is not between 1 and 3")
        }
  } catch MyError.runtimeError(let errorMessage) {
    // catch invalid input
    print(errorMessage)
  }
}
