//
//  CardView.swift
//  Learn By Doing
//
//  Created by Itunu Raimi on 19/02/2021.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    let card: Card
    @State private var fadeIn = false
    @State private var moveDownward = false
    @State private var moveUpward = false
    @State private var showAlert = false
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Image(card.imageName)
                .opacity(fadeIn ? 1.0 : 0.0)
            
            VStack(alignment: .center, spacing: nil, content: {
                Text(card.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Text(card.headline)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .italic()
            }) //: VSTACK
            .offset(y: moveDownward ? -218 : -300)
            
            Button(action: {
                playSound(sound: "sound-chime", type: "mp3")
                hapticImpact.impactOccurred()
                showAlert.toggle()
            }, label: {
                HStack {
                    Text(card.callToAction.uppercased())
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .accentColor(.white)
                    
                    Image(systemName: "arrow.right.circle")
                        .font(Font.title.weight(.medium))
                        .accentColor(.white)
                } //: HSTACK
                .padding(.vertical)
                .padding(.horizontal, 24)
                .background(
                    LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .leading, endPoint: .trailing)
                )
                .clipShape(Capsule())
                .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
            }) //: BUTTON
            .offset(y: moveUpward ? 210 : 300)
            
        } //: ZSTACK
        .frame(width: 335, height: 545, alignment: .center)
        .background(
            LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom)
        )
        .cornerRadius(16)
        .shadow(radius: 8)
        .onAppear() {
            withAnimation(.linear(duration: 1.2)) {
                fadeIn.toggle()
            }
            withAnimation(.linear(duration: 0.8)) {
                moveDownward.toggle()
                moveUpward.toggle()
            }
        }
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text(card.title), message: Text(card.message), dismissButton: .default(Text("OK")))
        })
    }
}

// MARK: - PREVIEW
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: cardData[2])
    }
}
