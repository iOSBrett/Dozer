//
//  Rect.swift
//  Dozer
//
//  Created by Brett May on 27/4/2025.
//
import Foundation
import Neo

public struct Rect2 : Equatable {
    public var x : Float
    public var y : Float
    public var width : Float
    public var height : Float
    
    public var minX : Float { return x }
    public var midX : Float { return x + width / 2.0 }
    public var maxX : Float { return x + width }

    public var minY : Float { return y }
    public var midY : Float { return y + height / 2.0 }
    public var maxY : Float { return y + height }
    
    public init(x: Float, y: Float, width: Float, height: Float) {
        self.x = x
        self.y = y
        self.width = width
        self.height = height
    }

    public init(origin: Point2, size: Size2) {
        self.x = origin.x
        self.y = origin.y
        self.width = size.width
        self.height = size.height
    }
    
    public var center : Point2 {
        Point2(x: midX, y: midY)
    }
    
    public var origin : Point2 {
        Point2(x: x, y: y)
    }

    public var size : Size2 {
        Size2(width: width, height: height)
    }
    
    public func insetBy(dx: Float, dy: Float) -> Rect2 {
        .init(x: x + dx,
              y: y + dy,
              width: width - 2 * dx,
              height: height - 2 * dy)
    }
}

public extension CGRect {
    func toRect() -> Rect2 {
        return Rect2(x: Float(origin.x),
                     y: Float(origin.y),
                     width: Float(size.width),
                     height: Float(size.height))
    }
}
