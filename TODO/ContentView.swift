//
//  ContentView.swift
//  TODO
//
//  Created by Kameron Keel on 8/27/20.
//  Copyright © 2020 Kameron Keel. All rights reserved.
//

import SwiftUI



struct ChecklistView: View {
    
    @State var newChecklistItemViewIsVisible = false
    @ObservedObject var checklist = Checklist()
    
    var body: some View {
        NavigationView{
            
        List{
            ForEach(checklist.items){
                index in RowView(checklistItem: self.$checklist.items[index])
                }
                
            .onDelete(perform: checklist.deleteListItem)
            .onMove(perform: checklist.moveListItem)
            
            
        }
        .navigationBarItems(leading: Button(action: { self.newChecklistItemViewIsVisible = true}){
            HStack{
                Image(systemName: "plus.circle.fill")
                Text("Add item")
            }
        },trailing: EditButton())
            .navigationBarTitle("Checklist", displayMode: .inline)
            .onAppear(){
                self.checklist.printChecklistContents()
            
            }
        }
        .sheet(isPresented: $newChecklistItemViewIsVisible){
            NewChecklistItemView(checklist: self.checklist)
        }
    }

    
   
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}

}
