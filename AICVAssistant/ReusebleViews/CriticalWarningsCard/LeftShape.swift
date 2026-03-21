//
//  LeftShape.swift
//  AICVAssistant
//
//  Created by Farid Rustamov on 21.03.26.
//

import Foundation
import SwiftUI

struct LeftCapsule: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let radius = rect.width / 2
        
        // start top-right
        path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
        
        // sağ tərəf aşağı
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        
        // aşağı sol curve
        path.addArc(
            center: CGPoint(x: rect.minX + radius, y: rect.maxY - radius),
            radius: radius,
            startAngle: .degrees(90),
            endAngle: .degrees(180),
            clockwise: false
        )
        
        // sol tərəf yuxarı
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + radius))
        
        // yuxarı sol curve
        path.addArc(
            center: CGPoint(x: rect.minX + radius, y: rect.minY + radius),
            radius: radius,
            startAngle: .degrees(180),
            endAngle: .degrees(270),
            clockwise: false
        )
        
        // bağla
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        
        return path
    }
}
