//
//  ScratchMask.swift
//  ScratchView
//
//  Created by Sathish Kumar RS on 15/08/23.
//

import SwiftUI

struct ScratchMask: Shape {
    var points: [CGPoint]
    var startingPoint: CGPoint
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: startingPoint)
            path.addLines(points)
        }
    }
}

