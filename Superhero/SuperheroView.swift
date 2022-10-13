//
//  SuperheroView.swift
//  Superhero
//
//  Created by Youssef Eldeeb on 13/10/2022.
//

import SwiftUI

struct SuperheroView: View {
    let gredient: [Color] = [Color("ColorHulk01"), Color("ColorHulk02")]
    @State var isAletPressented: Bool = false
    
    var body: some View {
        ZStack{
            Image("hulk")
                .resizable()
                .scaledToFit()
            
            VStack{
                Text("Hulk")
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
                    .background(LinearGradient(gradient: Gradient(colors: gredient), startPoint: .bottomTrailing, endPoint: .topLeading))
                    .clipShape(Capsule())
                    .shadow(radius: 10)
                    .alert(isPresented: $isAletPressented) {
                        Alert(title: Text("Hulk"), message: Text("Hulk is very big and green"), dismissButton: .default(Text("OK")))
                    }
                }//: label
            }//: VStack
            .offset(x: 0, y: 150)
        }//: ZStack
        .background(LinearGradient(gradient: Gradient(colors: gredient), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(16)
        .shadow(color: .black, radius: 2, x: 2, y: 2)
        
    }
}

struct SuperheroView_Previews: PreviewProvider {
    static var previews: some View {
        SuperheroView()
    }
}
