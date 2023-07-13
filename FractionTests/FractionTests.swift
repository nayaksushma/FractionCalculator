//
//  FractionTests.swift
//  FractionTests
//
//  Created by Sushma Nayak on 13/07/23.
//

import XCTest
@testable import Fractions

final class FractionCalculatorTests: XCTestCase {
  
    let fractionCalculator = Calculator()
    
    func testParseFraction() {
      XCTAssertEqual(fractionCalculator.parseFraction("3/4"), Fraction(numerator: 3, denominator: 4))
      XCTAssertEqual(fractionCalculator.parseFraction("-5/2"), Fraction(numerator: -5, denominator: 2))
      XCTAssertEqual(fractionCalculator.parseFraction("0/1"), Fraction(numerator: 0, denominator: 1))
      XCTAssertNil(fractionCalculator.parseFraction("invalid"))
    }
    
    func testParseMixedFraction() {
      XCTAssertEqual(fractionCalculator.parseMixedFraction("3&1/4"), Fraction(wholeNumber: 3, numerator: 1, denominator: 4))
      XCTAssertEqual(fractionCalculator.parseMixedFraction("-1&7/8"), Fraction(wholeNumber: -1, numerator: 7, denominator: 8))
      XCTAssertEqual(fractionCalculator.parseMixedFraction("2"), Fraction(wholeNumber: 2, numerator: 0, denominator: 1))
      XCTAssertNil(fractionCalculator.parseMixedFraction("invalid"))
    }
    
    func testAddFractions() {
        let fraction1 = Fraction(numerator: 1, denominator: 2)
        let fraction2 = Fraction(numerator: 3, denominator: 4)
      let result = fractionCalculator.addFractions(fraction1, fraction2)
        XCTAssertEqual(result, Fraction(numerator: 5, denominator: 4))
    }
    
    func testSubtractFractions() {
        let fraction1 = Fraction(numerator: 5, denominator: 4)
        let fraction2 = Fraction(numerator: 1, denominator: 2)
      let result = fractionCalculator.subtractFractions(fraction1, fraction2)
        XCTAssertEqual(result, Fraction(numerator: 1, denominator: 4))
    }
    
    func testMultiplyFractions() {
        let fraction1 = Fraction(numerator: 3, denominator: 4)
        let fraction2 = Fraction(numerator: 2, denominator: 5)
      let result = fractionCalculator.multiplyFractions(fraction1, fraction2)
        XCTAssertEqual(result, Fraction(numerator: 3, denominator: 10))
    }
    
    func testDivideFractions() {
        let fraction1 = Fraction(numerator: 3, denominator: 4)
        let fraction2 = Fraction(numerator: 1, denominator: 2)
      let result = fractionCalculator.divideFractions(fraction1, fraction2)
        XCTAssertEqual(result, Fraction(numerator: 3, denominator: 2))
    }
    
    func testPerformOperation() {
        let fraction1 = Fraction(wholeNumber: 3, numerator: 1, denominator: 4)
        let fraction2 = Fraction(numerator: 2, denominator: 5)
        
      let result1 = fractionCalculator.performOperation("+", fraction1, fraction2)
        XCTAssertEqual(result1, Fraction(wholeNumber: 3, numerator: 11, denominator: 20))
        
      let result2 = fractionCalculator.performOperation("-", fraction1, fraction2)
        XCTAssertEqual(result2, Fraction(wholeNumber: 2, numerator: 9, denominator: 20))
        
      let result3 = fractionCalculator.performOperation("*", fraction1, fraction2)
        XCTAssertEqual(result3, Fraction(numerator: 13, denominator: 20))
        
      let result4 = fractionCalculator.performOperation("/", fraction1, fraction2)
        XCTAssertEqual(result4, Fraction(numerator: 15, denominator: 2))
    }
    
    func testSimplifiedFraction() {
        let fraction = Fraction(numerator: 12, denominator: 8)
        let simplified = fraction.simplified()
        XCTAssertEqual(simplified, Fraction(wholeNumber: 1, numerator: 1, denominator: 2))
    }
    
}
