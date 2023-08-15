//
//  ScratchViewOverlay.swift
//  ScratchView
//
//  Created by Sathish Kumar RS on 15/08/23.
//

import SwiftUI

struct ScratchViewOverlay: View {
    @State var isScratched: Bool = false
    @State private var startingPoint: CGPoint = .zero
    @State private var points: [CGPoint] = []
    @GestureState var gestureLocation: CGPoint = .zero
    @State var cursorSize: CGFloat = 50
    
    var body: some View {
        ZStack {
            scartchImage
            revealedContent
                .mask(
                    ZStack {
                        if !isScratched {
                            ScratchMask(points: points, startingPoint: startingPoint)
                                .stroke(style: StrokeStyle(lineWidth: cursorSize, lineCap: .round, lineJoin: .round))
                        } else {
                            Rectangle()
                        }
                    }
                )
                .gesture(
                    DragGesture()
                        .updating($gestureLocation) { value, out, _ in
                            out = value.location
                            
                            DispatchQueue.main.async {
                                if startingPoint == .zero {
                                    startingPoint = value.location
                                }
                                points.append(value.location)
                            }
                        }
                        .onEnded({ value in
                            withAnimation {
                                isScratched = true
                            }
                        })
                )
        }
        .frame(width: 300, height: 300)
        .cornerRadius(20)
    }
    
    var scartchImage: some View {
        Image("scartchImage")
            .resizable()
            .aspectRatio(contentMode: .fill)
    }
    
    var revealedContent: some View {
        VStack {
            Image("awardImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            Text("You've Won")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.black)
            Text("$ 250")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .padding(.top, 5)
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
    }
}

struct ScratchViewOverlay_Previews: PreviewProvider {
    static var previews: some View {
        ScratchViewOverlay()
    }
}
