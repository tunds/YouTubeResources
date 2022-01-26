//
//  ContentView.swift
//  SwipeActions
//
//  Created by Tunde on 02/08/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = MessagesViewModel()
    
    var body: some View {
        NavigationView  {
            List {
                ForEach(vm.data) { item in
                    InboxItemView(item: item)
                        .swipeActions(edge: .leading) {
                            Button {
                                // TODO: Handle the toggling of read and unread
                                print("Toggle the state of the message")
                                vm.toggleRead(for: item)
                            } label: {
                                
                                if item.isRead {
                                 
                                    Label("Read", systemImage: "envelope.open")
                                } else {
                                    
                                    Label("Unread", systemImage: "envelope.badge")
                                }
                            }
                            .tint(.accentColor)
                        }
                        .swipeActions(edge: .trailing,
                                      allowsFullSwipe: !item.isFlagged) {
                            
                            if item.isFlagged {
                                
                                Button {
                                    vm.toggleFlagged(for: item)
                                } label: {
                                    Label("Flag", systemImage: "flag.slash")
                                        .symbolVariant(.fill)
                                }
                                .tint(Color("darkRed"))
                                
                                Button {
                                    print("Present More")
                                } label: {
                                    Label("More", systemImage: "ellipsis")
                                        .symbolVariant(.circle.fill)
                                }
                                
                            } else {
                                
                                Button(role: .destructive) {
                                    withAnimation {
                                        vm.delete(item)
                                    }
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                                
                                Button {
                                    vm.toggleFlagged(for: item)
                                } label: {
                                    Label("Flag", systemImage: "flag")
                                        .symbolVariant(.fill)
                                }
                                .tint(Color("darkRed"))
                                
                                Button {
                                    print("Present More")
                                } label: {
                                    Label("More", systemImage: "ellipsis")
                                        .symbolVariant(.circle.fill)
                                }
                            }
                        }
                }
            }
            .searchable(text: .constant(""), prompt: "Search")
            .listStyle(.plain)
            .navigationTitle("Inbox")
            .toolbar {
                // Add in Navigation Edit Button
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Text("Edit")
                    }
                    .tint(.blue)
                }
                
                ToolbarItemGroup(placement: .bottomBar) {
                    Button {} label: {
                        Image(systemName: "line.3.horizontal.decrease")
                            .symbolVariant(.circle)
                            .foregroundColor(.accentColor)
                    }
                    Spacer()
                    VStack {
                        Text("Updated just now")
                            .font(.caption)
                        Text("80,000 unread")
                            .font(.footnote)
                            .opacity(0.6)
                    }
                    Spacer()
                    Button {} label: {
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(.accentColor)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
