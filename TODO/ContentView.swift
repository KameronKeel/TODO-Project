//
//  ContentView.swift
//  TODO
//
//  Created by Kameron Keel on 8/27/20.
//  Copyright © 2020 Kameron Keel. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            
        List{
            
            Section(header: Text("High Priority")){
                
                Group{
            Text("Walk The Dog")
            Text("Brush my teeth")
            Text("Learn iOS development")
            Text("Make Dinner")
            Text("Do Laundry")
            Text("Pay Bills")
                }
                
                Group{
            Text("Finish Homework")
            Text("Change internet provider")
            Text("Read Raywenderlich.com")
            Text("Clean the kitchen")
            Text("Wash the car")
                }
            }
            
            Section(header: Text("Low Priority")){
            Text("Soccer practice")
            Text("Eat ice cream")
            Text("Take vocal lessons")
            Text("Record hit single")
            Text("Learn every martial art")
            Text("Design Custome")
            Text("Design crime-fighting vehicle")
            Text("Come up with super hero name")
            Text("Befriend the space raccoon")
            Text("Save the world")
                
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("Checklist")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
