//
//  BookSeriesList.swift
//  App01
//
//  Created by Alumno on 19/09/23.
//

import SwiftUI

struct BookSeriesList: View {
    
    var booksSeries: [BookSeries]
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack {
                    ForEach(booksSeries, id:\.self){
                        bookSerie in
                        NavigationLink{
                            BooksList(books: bookSerie.books)
                        } label: {
                            BookSeriesRow(booksSeries: bookSerie)
                        }
                        
                    }
                }
            }.padding().background(Color.red.opacity(0.5))
        }.navigationTitle("Books Series")
        
    }
}

struct BookSeriesList_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
