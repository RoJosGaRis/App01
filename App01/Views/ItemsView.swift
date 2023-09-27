//
//  ItemsView.swift
//  App01
//
//  Created by Alumno on 27/09/23.
//

import SwiftUI

struct ItemsView: View {
    
    @StateObject var equipmentList = ItemsViewModel()
    
    @State private var currentSearch = ""
    
    init(){
        UISearchBar.appearance().tintColor = UIColor.white
        UISearchBar.appearance().barTintColor = UIColor.white
    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.teal.ignoresSafeArea()
                VStack{
                    
                    List(itemResults){
                        item in
                        Text(item.name).font(.title).padding().foregroundColor(.white).listRowBackground(Color.teal)                    }.navigationTitle("Items")
                        .navigationBarTitleDisplayMode(.inline).scrollContentBackground(.hidden)
                }
            }
                
            }.task {
                do{
                    try await equipmentList.getClassData()
                } catch {
                    print("error")
                }
            }.foregroundColor(Color.white).searchable(text: $currentSearch)
        }
    var itemResults: [ResultsDetailsModel] {
            if currentSearch.isEmpty {
                return equipmentList.itemsArray
            } else {
                return equipmentList.itemsArray.filter { $0.name.contains(currentSearch) }
            }
        }
    }

struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsView()
    }
}
