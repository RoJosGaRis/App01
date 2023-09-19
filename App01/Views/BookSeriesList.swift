//
//  BookSeriesList.swift
//  App01
//
//  Created by Alumno on 19/09/23.
//

import SwiftUI

struct BookSeriesList: View {
    var body: some View {
        ZStack{
            Color(.black)
            
            ScrollView(.vertical) {
                VStack {
                    ForEach(bookSeries, id:\.self){
                        bookSerie in
                        BookSeriesRow(bookSeries: bookSerie)
                    }
                }
            }
        }.ignoresSafeArea()
    }
}

struct BookSeriesList_Previews: PreviewProvider {
    static var previews: some View {
        BookSeriesList()
    }
}
