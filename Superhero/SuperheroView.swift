//
//  SuperheroView.swift
//  Superhero
//
//  Created by Youssef Eldeeb on 13/10/2022.
//

import SwiftUI

struct SuperheroView: View {
    
    var superH: Superhero
    
    @State var isScaling: Bool = false
    @State var isSliding: Bool = false
    @State var isAletPressented: Bool = false
    
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    var body: some View {
        ZStack{
            Image(superH.image)
                .resizable()
                .scaledToFill()
                .scaleEffect(isScaling ? 1 : 0.7)
                .animation(.easeOut(duration: 0.9), value: isScaling)
            
            VStack{
                Text(superH.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                Button {
                    isAletPressented.toggle()
                    hapticImpact.impactOccurred()
                } label: {
                    HStack{
                        Text("Start")
                        Image(systemName: "arrow.right.circle")
                    }//: HStack
                    .padding()
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(LinearGradient(colors: superH.gradientColors, startPoint: .bottomTrailing, endPoint: .topLeading))
                    .clipShape(Capsule())
                    .shadow(radius: 10)
                    .alert(isPresented: $isAletPressented) {
                        Alert(title: Text("More about \(superH.title)"), message: Text(superH.message), dismissButton: .default(Text("OK")))
                    }
                }//: label
            }//: VStack
            .offset(x: 0, y: isSliding ? 150 : 350)
            .animation(.easeOut(duration: 2), value: isSliding)
        }//: ZStack
        .frame(width: 335, height: 545, alignment: .center)
        .background(LinearGradient(colors: superH.gradientColors, startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(16)
        .shadow(color: .black, radius: 2, x: 2, y: 2)
        .onAppear {
            isScaling = true
            isSliding = true
        }
        
    }
}

struct SuperheroView_Previews: PreviewProvider {
    static var previews: some View {
        SuperheroView(superH: superherosData[3])
    }
}
