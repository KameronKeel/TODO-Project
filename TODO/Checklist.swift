//
//  Checklist.swift
//  TODO
//
//  Created by Kameron Keel on 8/27/20.
//  Copyright © 2020 Kameron Keel. All rights reserved.
//

import Foundation
class Checklist: ObservableObject {
    @Published var items = [ChecklistItem(name: "Walk the dog"), ChecklistItem(name: "Brush my teeth"), ChecklistItem(name: "Learn iOS development", isChecked: true), ChecklistItem(name: "Soccer practice"), ChecklistItem(name:"Eat ice cream", isChecked: true),]
    
    func printChecklistContents(){
           for item in items{
               print(item)
           }
       }
       
       func deleteListItem(whichElement: IndexSet){
           items.remove(atOffsets: whichElement)
           printChecklistContents()
       }
       
       func moveListItem(whichElement: IndexSet, destination: Int){
           items.move(fromOffsets: whichElement, toOffset: destination)
           printChecklistContents()
       }
}
