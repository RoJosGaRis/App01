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
        VStack{
            Text(bookSeries.name).font(.title)
            Text(bookSeries.writer).frame(alignment: .leading)
        }.padding()
    }
}

struct BookSeriesRow_Previews: PreviewProvider {
    static var previews: some View {
        BookSeriesRow(bookSeries: bookSeries[1])
    }
}
