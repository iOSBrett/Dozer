//
//  Line2.swift
//  Dozer
//
//  Created by Brett May on 26/4/2025.
//
import Foundation
import Neo

public struct Line2 {
    public var p1: Point2
    public var p2: Point2
    
    public init(p1: Point2, p2: Point2) {
        self.p1 = p1
        self.p2 = p2
    }

    public var asVector2 : Vector2 {
        return p2 - p1
    }
}

