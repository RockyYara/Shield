//
//  ParameterizedTest.swift
//  Shield
//
//  Copyright © 2021 Outfox, inc.
//
//
//  Distributed under the MIT License, See LICENSE for details.
//

import XCTest


class ParameterizedTestCase: XCTestCase {

  override class var defaultTestSuite: XCTestSuite {
    let testClass = self as XCTestCase.Type
    let testSuite = XCTestSuite(forTestCaseClass: self)
    (1 ..< parameterSets.count).forEach { parameterSetIdx in
      testInvocations.forEach { invocation in
        guard let testCase = testClass.init(invocation: invocation) as? ParameterizedTestCase else {
          fatalError("Must be ParameterizedTestCase")
        }
        testCase.parameterSetIdx = parameterSetIdx
        testSuite.addTest(testCase)
      }
    }
    return testSuite
  }

  open class var parameterSets: [Any] { [""] }

  public var parameterSetIdx: Int?

}
