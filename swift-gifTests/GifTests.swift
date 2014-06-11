//
//  GifTests.swift
//  swift-gif
//
//  Created by Arne Bahlo on 12.06.14.
//  Copyright (c) 2014 Arne Bahlo. All rights reserved.
//

import XCTest
import UIKit
import ImageIO

class GifTests: XCTestCase {

    var imageData: NSData?
    var source: CGImageSourceRef?

    override func setUp() {
        super.setUp()

        imageData = NSData(contentsOfURL: NSBundle.mainBundle().URLForResource("test", withExtension: "gif"))

        let cfImageData = imageData! as CFDataRef
        source = CGImageSourceCreateWithData(cfImageData, nil).takeRetainedValue()
    }

    override func tearDown() {
        imageData = nil

        super.tearDown()
    }

    func testGCDForPair() {
        let values = (9, 4011)
        let result = UIImage.gcdForPair(values.0, values.1)
        let expected = 3

        XCTAssert(result == expected, "UIImage.gcdForPair(\(values.0), \(values.1)) = \(result), but should be \(expected)")
    }

    func testGCDForArray() {
        let values = [13, 17_381, 169]
        let result = UIImage.gcdForArray(values)
        let expected = 13

        XCTAssert(result == expected, "UIImage.gcdForArray(\(values)) = \(result), but should be \(expected)")
    }

    func testDelayForImageAtIndex() {
        let result = UIImage.delayForImageAtIndex(0, source: source!)
        let expected = 0.5

        XCTAssert(result == expected, "UIImage.delayForImageAtIndex(0, source) = \(result), but should be \(expected)")
    }

}
