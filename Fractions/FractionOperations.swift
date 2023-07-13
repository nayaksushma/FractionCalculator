//
//  FractionOperations.swift
//  Fractions
//
//  Created by Sushma Nayak on 12/07/23.
//

import Foundation

protocol FractionOperations {
  func addFractions(_ fraction1: Fraction, _ fraction2: Fraction) -> Fraction
  func subtractFractions(_ fraction1: Fraction, _ fraction2: Fraction) -> Fraction
  func multiplyFractions(_ fraction1: Fraction, _ fraction2: Fraction) -> Fraction
  func divideFractions(_ fraction1: Fraction, _ fraction2: Fraction) -> Fraction
}

extension FractionOperations {
  // Function to perform the addition of two fractions
  func addFractions(_ fraction1: Fraction, _ fraction2: Fraction) -> Fraction {
      let numerator = fraction1.numerator * fraction2.denominator + fraction2.numerator * fraction1.denominator
      let denominator = fraction1.denominator * fraction2.denominator
      return Fraction(numerator: numerator, denominator: denominator)
  }

  // Function to perform the subtraction of two fractions
  func subtractFractions(_ fraction1: Fraction, _ fraction2: Fraction) -> Fraction {
      let numerator = fraction1.numerator * fraction2.denominator - fraction2.numerator * fraction1.denominator
      let denominator = fraction1.denominator * fraction2.denominator
      return Fraction(numerator: numerator, denominator: denominator)
  }

  // Function to perform the multiplication of two fractions
  func multiplyFractions(_ fraction1: Fraction, _ fraction2: Fraction) -> Fraction {
      let numerator = fraction1.numerator * fraction2.numerator
      let denominator = fraction1.denominator * fraction2.denominator
      return Fraction(numerator: numerator, denominator: denominator)
  }

  // Function to perform the division of two fractions
  func divideFractions(_ fraction1: Fraction, _ fraction2: Fraction) -> Fraction {
      let numerator = fraction1.numerator * fraction2.denominator
      let denominator = fraction1.denominator * fraction2.numerator
      return Fraction(numerator: numerator, denominator: denominator)
  }
}
