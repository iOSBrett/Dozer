//
//  Point3.swift
//  Dozer
//
//  Created by Brett May on 29/4/2025.
//

import CoreGraphics
import Neo

// Should I make a Point3 type? 🤔

public typealias Point3 = Vector3

public extension Point3 {
    var asCGPoint: CGPoint {
        CGPoint(x: CGFloat(x), y: CGFloat(y))
    }
}
