//
//  UILabel+html.swift
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___

import UIKit
import QMobileUI

extension UILabel {

    @objc dynamic var htmlText: String? {
        get {
            return self.text // N.B. no reverse transformation
        }
        set {
            self.attributedText = newValue?.htmlToAttributedString
        }
    }

}

fileprivate extension String {

    var htmlToAttributedString: NSAttributedString {
        let data = Data(self.utf8)
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil) {
            return attributedString
        }
        return NSAttributedString(string: self) // failed to decode, just return the text
    }
}
