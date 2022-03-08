//
//  UILabel+html.swift
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___

import UIKit
import XCTest
@testable import ___PRODUCT___

class TestUILabel_html: XCTestCase {

    let label = UILabel()

    override func setUp() {}

    override func tearDown() {}

    func testEmptyString() {
        label.htmlText = ""
        let attributedString = label.attributedText
        XCTAssertNotNil(attributedString)
        if let attributedString = attributedString {
            XCTAssertTrue(attributedString.length == 0)
        }
    }

    func testEmptyHtml() {
        label.htmlText = "<html></html>"
        let attributedString = label.attributedText
        XCTAssertNotNil(attributedString)
        if let attributedString = attributedString {
            XCTAssertTrue(attributedString.length == 0)
        }
    }

    func testSimpleText() {
        label.htmlText = "<html>text</html>"
        let attributedString = label.attributedText
        XCTAssertNotNil(attributedString)
        if let attributedString = attributedString {
            XCTAssertTrue(attributedString.string == "text")

            let attr =  attributedString.attributes(at: 0, effectiveRange: nil)
            //let paragraphStyle = attr[NSAttributedString.Key.paragraphStyle] as? NSParagraphStyle
            let font = attr[NSAttributedString.Key.font] as? UIFont
            XCTAssertFalse(font?.isBold ?? true)
        }
    }

    func testTextBold() {
        label.htmlText = "<html><b>text</b></html>"
        let attributedString = label.attributedText
        XCTAssertNotNil(attributedString)
        if let attributedString = attributedString {
            XCTAssertTrue(attributedString.string == "text")

            let attr =  attributedString.attributes(at: 0, effectiveRange: nil)
            //let paragraphStyle = attr[NSAttributedString.Key.paragraphStyle] as? NSParagraphStyle
            let font = attr[NSAttributedString.Key.font] as? UIFont
            XCTAssertTrue(font?.isBold ?? false)
        }
    }

    func testTextJapanese() {
        label.htmlText = "<html>大丈夫ですか</html>"
        let attributedString = label.attributedText
        XCTAssertNotNil(attributedString)
        if let attributedString = attributedString {
            XCTAssertTrue(attributedString.string == "大丈夫ですか")
        }
    }
}

fileprivate extension UIFont {
    var isBold: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitBold)
    }
    var isItalic: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitItalic)
    }
}
