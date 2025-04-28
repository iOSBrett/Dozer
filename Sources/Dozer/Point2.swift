//
//  Point2.swift
//  Dozer
//
//  Created by Brett May on 26/4/2025.
//
import CoreGraphics
import Neo

// Should I make a Point2 type? 🤔

public typealias Point2 = Vector2

public extension Point2 {
    var asCGPoint: CGPoint {
        CGPoint(x: CGFloat(x), y: CGFloat(y))
    }
}

public extension CGPoint {
    var asPoint2: Point2 {
        Point2(x: Float(x), y: Float(y))
    }
}
