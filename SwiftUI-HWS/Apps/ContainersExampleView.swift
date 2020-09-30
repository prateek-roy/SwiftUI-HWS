//
//  ContainersExampleView.swift
//  SwiftUI-HWS
//
//  Created by Prateek Roy on 30/09/20.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach( 0 ..< rows) { row in
                HStack {
                    ForEach(0 ..< columns) { column in
                        content(row, column)
                    }
                }
                
            }
        }
    }
    
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}

struct ContainersExampleView: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { (row, column) in
            Image(systemName: "\(row * 4 + column).circle")
            Text("R\(row) C\(column)")
        }
    }
}

struct ContainersExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ContainersExampleView()
    }
}
