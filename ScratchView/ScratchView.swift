//
//  ScratchView.swift
//  ScratchView
//
//  Created by Sathish Kumar RS on 15/08/23.
//

import SwiftUI

struct ScratchView: View {
    let strScartchReveal = "Scartch to Reveal"
    var body: some View {
        VStack() {
            ScratchViewOverlay()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.orange.ignoresSafeArea())
        .overlay(alignment: .top) {
            scartchToReveal
        }
    }
    
    var scartchToReveal: some View {
        Text(strScartchReveal)
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(.white)
    }
}

struct ScratchView_Previews: PreviewProvider {
    static var previews: some View {
        ScratchView()
    }
}
