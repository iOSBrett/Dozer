//
//  Line2.swift
//  Dozer
//
//  Created by Brett May on 26/4/2025.
//
import Foundation
import Neo

public struct Line2 {
    public var start: Point2
    public var end: Point2
        
    public init(start: Point2, end: Point2) {
        self.start = start
        self.end = end
    }

    public var asVector2 : Vector2 {
        return end - start
    }
}

