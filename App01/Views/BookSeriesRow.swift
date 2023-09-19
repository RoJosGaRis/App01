//
//  BookSeriesRow.swift
//  App01
//
//  Created by Alumno on 19/09/23.
//

import SwiftUI

struct BookSeriesRow: View {
    var bookSeries: BookSeries
    
    var body: some View {
        let bookCount = bookSeries.books.count
        VStack{
            Text(bookSeries.name).font(.title).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).bold()
            HStack{
                Text(bookSeries.writer).frame(maxWidth: .infinity, alignment: .leading)
                Text("Libros: \(bookCount)")
            }
        }
        .padding().foregroundColor(.white).background(Color.red.opacity(0.3))
            
    }
}

struct BookSeriesRow_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color(.black)
            BookSeriesRow(bookSeries: bookSeries[1])
        }
    }
}
