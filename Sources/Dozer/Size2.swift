//
//  Size2.swift
//  Dozer
//
//  Created by Brett May on 27/4/2025.
//
import Foundation
import Neo

public struct Size2 : Equatable {
    public var width : Float
    public var height : Float
    
    public init(width: Float, height: Float) {
        self.width = width
        self.height = height
    }
}

public extension Size2 {
    func toCGSize() -> CGSize {
        return CGSize(width: CGFloat(width), height: CGFloat(height))
    }
    var center : Point2 {
        return Point2(x: width/2.0, y: height/2.0)
    }
}

public extension Size2 {
    var asVector2 : Vector2 {
        return Vector2(x: width, y: height)
    }
}

public extension CGSize {
    func toSize2() -> Size2 {
        return Size2(width: Float(width), height: Float(height))
    }
}

public extension CGSize {
    var center : CGPoint {
        return CGPoint(x: width/2.0, y: height/2.0)
    }
}

