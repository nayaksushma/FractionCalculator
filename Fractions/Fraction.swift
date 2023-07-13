//
//  Fraction.swift
//  Fractions
//
//  Created by Sushma Nayak on 12/07/23.
//

import Foundation

// Structure to represent a fraction
struct Fraction: Equatable {
    let wholeNumber: Int
    let numerator: Int
    let denominator: Int
    
    init(wholeNumber: Int, numerator: Int, denominator: Int) {
        self.wholeNumber = wholeNumber
        self.numerator = numerator
        self.denominator = denominator
    }
    
    init(numerator: Int, denominator: Int) {
        self.init(wholeNumber: 0, numerator: numerator, denominator: denominator)
    }
    
    // Function to simplify the fraction
    func simplified() -> Fraction {
        let gcd = greatestCommonDivisor(numerator, denominator)
        return Fraction(wholeNumber: wholeNumber, numerator: numerator / gcd, denominator: denominator / gcd)
    }
    
    // Function to calculate the greatest common divisor using Euclid's algorithm
    private func greatestCommonDivisor(_ a: Int, _ b: Int) -> Int {
      let absA = abs(a)
      let absB = abs(b)
      
      if absB == 0 {
          return absA
      }
      
      return greatestCommonDivisor(absB, absA % absB)
    }
  
   static func == (lhs: Fraction, rhs: Fraction) -> Bool {
       return lhs.wholeNumber == rhs.wholeNumber &&
              lhs.numerator == rhs.numerator &&
              lhs.denominator == rhs.denominator
   }
}
