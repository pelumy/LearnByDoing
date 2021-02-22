//
//  ContentView.swift
//  Learn By Doing
//
//  Created by Itunu Raimi on 19/02/2021.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    var cards: [Card] = cardData
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 20) {
                ForEach(cards) { card in
                    CardView(card: card)
                } //: LOOP
            } //: HSTACK
            .padding(20)
        } //: SCROLL
            
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(cards: cardData)
            .previewDevice("iPhone 11")
    }
}
