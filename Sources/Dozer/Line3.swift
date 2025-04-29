//
//  Line3.swift
//  Dozer
//
//  Created by Brett May on 29/4/2025.
//
import Neo

public struct Line3 {
    public var start: Point3
    public var end: Point3
        
    public init(start: Point3, end: Point3) {
        self.start = start
        self.end = end
    }

    public var asVector3 : Vector3 {
        return end - start
    }
}

