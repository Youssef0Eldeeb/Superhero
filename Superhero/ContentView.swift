//
//  ContentView.swift
//  Superhero
//
//  Created by Youssef Eldeeb on 13/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    var superhero: [Superhero] = superherosData
    
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                ForEach(superhero) { item in
                    SuperheroView(superH: item)
                }
            }//: HStack
            .padding(20)
        }//: StackView
    }
       
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
