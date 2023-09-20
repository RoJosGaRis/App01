//
//  BookSeriesRow.swift
//  App01
//
//  Created by Alumno on 19/09/23.
//

import SwiftUI

struct BookSeriesRow: View {
    var booksSeries: BookSeries
    
    var body: some View {
        let bookCount = booksSeries.books.count
        VStack{
            Text(booksSeries.name).font(.title).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).bold()
            HStack{
                Text(booksSeries.writer).frame(maxWidth: .infinity, alignment: .leading)
                Text("Libros: \(bookCount)")
            }
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.red)
        .cornerRadius(25)
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.red, lineWidth: 2)
        )
            
    }
}

struct BookSeriesRow_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
