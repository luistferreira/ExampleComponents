//
//  CheckBoxTests.swift
//  ComponentsTests
//
//  Created by Luis Ferreira on 21/09/21.
//

import XCTest

@testable import Components

class CheckBoxTests: XCTestCase {

    var mock: CheckBoxMock!
    
    override func setUp() {
        self.mock = CheckBoxMock()
    }

    func testShouldValidadeIsChecked() {
        XCTAssertEqual(mock.checkBox.checked(), false)
    }
    
    func testShouldValidadeSetCheckedIsCalled() {
        mock.setChecked()
        XCTAssertEqual(mock.checkBox.checked(), true)
    }
    
    func testShouldValidadeSetUncheckedIsCalled() {
        mock.setUnchecked()
        XCTAssertEqual(mock.setUncheckedIsCalled, true)
    }
    
    func testShouldValidadeSetTitleIsCalled() {
        mock.setTitle()
        XCTAssertEqual(mock.setTitleIsCalled, true)
    }
    
    func testShouldValidadeDidPressButtonForChecked() {
        mock.didPressButton()
        XCTAssertEqual(mock.didPressIsCalled, true)
        XCTAssertEqual(mock.checkBox.checked(), true)
    }
    
    func testShouldValidadeDidPressButtonForUnchecked() {
        mock.setChecked()
        mock.didPressButton()
        XCTAssertEqual(mock.didPressIsCalled, true)
        XCTAssertEqual(mock.checkBox.checked(), false)
    }    
}

class CheckBoxMock: CheckBox {
    
    var checkBox = CheckBox(style: .light, isChecked: false)
    var setCheckedIsCalled = false
    var setUncheckedIsCalled = false
    var setTitleIsCalled = false
    var didPressIsCalled = false
    
    func setChecked() {
        checkBox.set(isChecked: true)
        setCheckedIsCalled = true
    }
    
    func setUnchecked() {
        checkBox.set(isChecked: false)
        setUncheckedIsCalled = true
    }
    
    func setTitle() {
        checkBox.setTitle("Test", for: .normal)
        setTitleIsCalled = true
    }
    
    func didPressButton() {
        checkBox.sendActions(for: .touchUpInside)
        didPressIsCalled = true
    }
}
