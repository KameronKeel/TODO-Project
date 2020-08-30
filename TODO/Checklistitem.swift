//
//  Checklistitem.swift
//  TODO
//
//  Created by Kameron Keel on 8/27/20.
//  Copyright © 2020 Kameron Keel. All rights reserved.
//

import Foundation

struct ChecklistItem: Identifiable, Codable{
    let id = UUID()
    var name: String
    var isChecked: Bool = false
}
