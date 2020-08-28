//
//  NewChecklistItemView.swift
//  TODO
//
//  Created by Kameron Keel on 8/28/20.
//  Copyright © 2020 Kameron Keel. All rights reserved.
//

import SwiftUI

struct NewChecklistItemView: View {
    var checklist: Checklist
    @State var newItemName = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            Text("Add new item")
            Form {
                TextField("Enter new item name here", text: $newItemName)
                Button(action:{var newChecklistItem = ChecklistItem(name: self.newItemName)
                    self.checklist.items.append(newChecklistItem)
                    self.checklist.printChecklistContents()
                    self.presentationMode.wrappedValue.dismiss()
                }){
                HStack{
                    Image(systemName: "plus.circle.fill")
                    Text("Add new item")
                }
            }
                .disabled(newItemName.count == 0)
            }
            Text("Swipe down to cancel")
        }
    }
}

struct NewChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewChecklistItemView(checklist: Checklist())
    }
}
