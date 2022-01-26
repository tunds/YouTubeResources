//
//  ContentView.swift
//  Await MVVM Example
//
//  Created by Tunde on 09/08/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = CharacterViewModelImpl(
        service: CharacterServiceImpl()
    )
    
    var body: some View {
        
        NavigationView {
            
            switch vm.state {
                
            case .success(let data):
                List {
                    ForEach(data,
                            id: \.id) { item in
                        Text(item.name)
                    }
                }
                .navigationBarTitle("Characters")
            case .loading:
                ProgressView()
            default:
                EmptyView()
            }
        }
        .alert("Error",
               isPresented: $vm.hasError,
               presenting: vm.state) { detail in
  
            Button("Retry") {
                Task {
                    await vm.getCharacters()
                }
            }

        } message: { detail in
            
            if case let .failed(error) = detail {
            
                Text(error.localizedDescription)
            }
        }
        .task {
            await vm.getCharacters()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
