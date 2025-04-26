//
//  Clipping.swift
//  Dozer
//
//  Created by Brett May on 26/4/2025.
//
import Foundation
import Neo

private enum Region: Int {
    case inside = 0b0000
    case left   = 0b0001
    case right  = 0b0010
    case bottom = 0b0100
    case top    = 0b1000
}

//    1001 | 1000 | 1010
//   ------+------+------
//    0001 | 0000 | 0010
//   ------+------+------
//    0101 | 0100 | 0110
//
private func calculateRegionCode(point p: CGPoint, window: CGRect) -> Int {
    var regionCode = Region.inside.rawValue
    
    if p.x < window.minX {
        regionCode |= Region.left.rawValue
    }
    else if p.x > window.maxX {
        regionCode |= Region.right.rawValue
    }
    
    if p.y < window.minY {
        regionCode |= Region.bottom.rawValue
    }
    else if p.y > window.maxY {
        regionCode |= Region.top.rawValue
    }
    
    return regionCode
}

// Cohen Sutherland clip algorithm
//
public func clipLine(_ point1: CGPoint, _ point2: CGPoint, viewPort: CGRect) -> (CGPoint, CGPoint)? {
    
    var p1 = point1
    var p2 = point2
    
    var p1Code = calculateRegionCode(point: p1, window: viewPort)
    var p2Code = calculateRegionCode(point: p2, window: viewPort)

    repeat {
        // Both points in thw window
        if p1Code == 0 && p2Code == 0 { return (p1, p2) }
        
        // Outside window and in same region
        if p1Code & p2Code != 0 { return nil }
        
        // Pick which endpoint is outside the window (could be both)
        let regionCode = p1Code != 0 ? p1Code : p2Code
        var x: CGFloat = 0
        var y: CGFloat = 0
        
        // Find intersection point:
        //   y = y1 + slope * (x - x1)
        //   x = x1 + (1 / slope) * (y - y1)

        if regionCode & Region.top.rawValue != 0 {
            // Point is above window
            x = p1.x + (p2.x - p1.x) * (viewPort.maxX - p1.y) / (p2.y - p1.y)
            y = viewPort.maxY
        }
        else if regionCode & Region.bottom.rawValue != 0 {
            // Point is below window
            x = p1.x + (p2.x - p1.x) * (viewPort.minY - p1.y) / (p2.y - p1.y)
            y = viewPort.minY
        }
        else if regionCode & Region.left.rawValue != 0 {
            // Point is to the left of the window
            y = p1.y + (p2.y - p1.y) * (viewPort.minX - p1.x) / (p2.x - p1.x)
            x = viewPort.minX
        }
        else if regionCode & Region.right.rawValue != 0 {
            // Point is to the right of the window
            y = p1.y + (p2.y - p1.y) * (viewPort.maxX - p1.x) / (p2.x - p1.x)
            x = viewPort.maxX
        }
        
        // Substitute interection for point outside the window
        if regionCode == p1Code {
            p1 = CGPoint(x: x, y: y)
            p1Code = calculateRegionCode(point: p1, window: viewPort)
        }
        else {
            p2 = CGPoint(x: x, y: y)
            p2Code = calculateRegionCode(point: p2, window: viewPort)
        }
    } while (p1Code != 0 || p2Code != 0)
    
    return (p1, p2)
}
