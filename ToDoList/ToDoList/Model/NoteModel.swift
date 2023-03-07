//
//  NoteMode.swift
//  ToDoList
//
//  Created by Bluyin  on 7/3/23.
//

import Foundation

struct NoteModel: Codable {
    let id: String
    var isFavorited: Bool
    let description: String
    
    //Inicializador del  modelo con parametros por defecto:
    
    init(id: String = UUID().uuidString, isFavorited: Bool = false, description: String) {
        self.id = id
        self.isFavorited = isFavorited
        self.description = description
    }
}
