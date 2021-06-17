//
//  NewRow.swift
//  SwiftUIDemo
//
//  Created by Ajay Girolkar on 16/06/21.
//

import SwiftUI

struct ItemRow: View {
    
    let item: MenuItem
    let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
            VStack(alignment: .leading) {
                Text(item.name)
                Text("$ \(item.price)")
            }
            Spacer()
            ForEach(item.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .padding(5)
                    .background(colors[restriction, default: .black])
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
        }
        
    }
}

struct NewRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
