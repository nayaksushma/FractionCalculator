//
//  Calculator.swift
//  Fractions
//
//  Created by Sushma Nayak on 12/07/23.
//

import Foundation

protocol CalculatorOperations {
  func performOperation(_ operatorString: String, _ fraction1: Fraction, _ fraction2: Fraction) -> Fraction?
}

protocol OperandParser {
  func parseFraction(_ input: String) -> Fraction?
  func parseMixedFraction(_ input: String) -> Fraction?
}


struct Calculator {
  
  // Function to prompt the user for input and display the result
  func run() {
      while true {
          print("Enter an operation (or 'exit' to quit):")
          guard let input = readLine() else {
              continue
          }
          
          if input.lowercased() == "exit" {
              break
          }
          
        let components = input.components(separatedBy: " ").filter({$0 != ""})
          if components.count != 3 {
              print("Invalid input.")
              continue
          }
          
          guard let fraction1 = parseMixedFraction(components[0]), let operatorString = components[1].first, let fraction2 = parseMixedFraction(components[2]) else {
              print("Invalid input.")
              continue
          }
          
          if let result = performOperation(String(operatorString), fraction1.simplified(), fraction2.simplified()) {
              if result.numerator == 0 {
                if result.wholeNumber == 0 {
                  print("= 0")
                } else {
                  print("= \(result.wholeNumber)")
                }
              } else if result.wholeNumber == 0 {
                  print("= \(result.numerator)/\(result.denominator)")
              } else {
                  print("= \(result.wholeNumber)&\(result.numerator)/\(result.denominator)")
              }
          } else {
              print("Invalid operation.")
          }
      }
  }
}

extension Calculator: CalculatorOperations & FractionOperations {
  // Function to perform the requested operation on two fractions
  func performOperation(_ operatorString: String, _ fraction1: Fraction, _ fraction2: Fraction) -> Fraction? {
      var result: Fraction?
      
      switch operatorString {
      case "+":
          result = addFractions(fraction1, fraction2)
      case "-":
          result = subtractFractions(fraction1, fraction2)
      case "*":
          result = multiplyFractions(fraction1, fraction2)
      case "/":
          result = divideFractions(fraction1, fraction2)
      default:
          return nil
      }
      
      if let result = result {
          if result.numerator > result.denominator {
              let wholeNumber = result.numerator / result.denominator
              let numerator = result.numerator % result.denominator
              let simplifiedFraction = Fraction(numerator: numerator, denominator: result.denominator).simplified()
              return Fraction(wholeNumber: fraction1.wholeNumber + fraction2.wholeNumber + wholeNumber, numerator: simplifiedFraction.numerator, denominator: simplifiedFraction.denominator)
          } else {
              return Fraction(wholeNumber: fraction1.wholeNumber + fraction2.wholeNumber, numerator: result.numerator, denominator: result.denominator).simplified()
          }
      }
      
      return nil
  }
}


extension Calculator: OperandParser {
  // Function to parse and create a fraction from a string input
  func parseFraction(_ input: String) -> Fraction? {
      let components = input.components(separatedBy: "/")
      
      if components.count == 2, let numerator = Int(components[0]), let denominator = Int(components[1]) {
          return Fraction(numerator: numerator, denominator: denominator)
      }
      
      return nil
  }

  // Function to parse and create a mixed fraction from a string input
  func parseMixedFraction(_ input: String) -> Fraction? {
    if let wholeNumber = Int(input) {
         return Fraction(wholeNumber: 0, numerator: wholeNumber, denominator: 1)
     }
     
     let components = input.components(separatedBy: "&")
     
     if components.count == 2 {
         if let wholeNumber = Int(components[0]) {
             if let fraction = parseFraction(components[1]) {
                 let numerator = wholeNumber >= 0 ? (wholeNumber * fraction.denominator + fraction.numerator) : (wholeNumber * fraction.denominator - fraction.numerator)
                 return Fraction(numerator: numerator, denominator: fraction.denominator)
             }
         }
     } else if let fraction = parseFraction(input) {
         return fraction
     }
     
     return nil
  }
}
