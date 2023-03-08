//
//  ContentView.swift
//  ToDoList
//
//  Created by Bluyin  on 7/3/23.
//

import SwiftUI

struct ContentView: View {
    @State var descriptionNote: String = ""
    @StateObject var notesViewModel = NotesViewModel()
    var body: some View {
        NavigationView {
            VStack {
                Text("Añade una pregunta")
                    .underline()
                    .foregroundColor(.gray)
                    .padding(.horizontal, 16)
                    .padding()
                    .padding(.bottom, 20)
                    .font(.system(size: 18, weight: .light, design: .serif))
                    .italic()
                TextEditor(text: $descriptionNote)
                    .foregroundColor(.gray)
                    .frame(width: 340, height: 100)
                    .overlay (
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.white, lineWidth: 2)
                    )
                    .padding(.horizontal, 15)
                    .cornerRadius(3.0)
                
                HStack {
                    Button("Añadir") {
                        notesViewModel.saveNote(description: descriptionNote)
                        descriptionNote = ""
                    }
                    .disabled(descriptionNote.isEmpty)
                    .padding()
                    .buttonStyle(.bordered)
                    .tint(.green)
                    
                    Button("Eliminar todas") {
                        
                    }
                    .buttonStyle(.bordered)
                    .tint(.red)
                }
                
                Spacer()
                List {
                    ForEach($notesViewModel.notes, id: \.id) { $note in
                        HStack {
                            if note.isFavorited {
                                Text("⭐️")
                            }
                            Text(note.description)
                        }
                        .swipeActions(edge: .trailing) {
                            Button {
                                notesViewModel.updateFavoritedNote(note: $note)
                            } label: {
                                Label("Favorito", systemImage: "star.fill")
                            }
                            .tint(.yellow)
                        }
                        .swipeActions(edge: .leading) {
                            Button {
                                notesViewModel.removeNote(withId: note.id)
                            } label: {
                                Label("Borrar", systemImage: "trash.fill")
                            }
                            .tint(.red)
                        }
                    }
                }
            }
            .navigationTitle("MY LESSONS")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Text(notesViewModel.getNumbersOfNotes())
            }
        }.preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        
    }
}
