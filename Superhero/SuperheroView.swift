//
//  SuperheroView.swift
//  Superhero
//
//  Created by Youssef Eldeeb on 13/10/2022.
//

import SwiftUI

struct SuperheroView: View {
    
    var superH: Superhero
    
    @State var isAletPressented: Bool = false
    
    var body: some View {
        ZStack{
            Image(superH.image)
                .resizable()
                .scaledToFill()
            
            VStack{
                Text(superH.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                Button {
                    isAletPressented.toggle()
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
            .offset(x: 0, y: 150)
        }//: ZStack
        .frame(width: 335, height: 545, alignment: .center)
        .background(LinearGradient(colors: superH.gradientColors, startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(16)
        .shadow(color: .black, radius: 2, x: 2, y: 2)
        
    }
}

struct SuperheroView_Previews: PreviewProvider {
    static var previews: some View {
        SuperheroView(superH: superherosData[3])
    }
}
