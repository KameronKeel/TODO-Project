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
                ChecklistItem in HStack{
                    Text(ChecklistItem.name)
                    Spacer()
                    Text(ChecklistItem.isChecked ? "✅" : "🔲")
                }
                .background(Color.white)
                .onTapGesture{
                    if let matchingIndex = self.checklist.items.firstIndex(where: { $0.id == ChecklistItem.id} ){
                        self.checklist.items[matchingIndex].isChecked.toggle()
                    }
                    self.checklist.printChecklistContents()
                    }
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
