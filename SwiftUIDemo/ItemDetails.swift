//
//  ItemDetails.swift
//  SwiftUIDemo
//
//  Created by Ajay Girolkar on 17/06/21.
//

import SwiftUI

struct ItemDetails: View {
    let item: MenuItem
    @EnvironmentObject var order: Order
    
    var body: some View {
        
        VStack {
            ZStack(alignment: .bottomTrailing) {
            Image(item.mainImage)
                .resizable()
                .scaledToFit()
                Text("Photo credit: \(item.photoCredit)")
                    .font(.caption)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding()
            Button("Add this") {
                order.add(item: item)
            }
            .font(.headline)
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        ItemDetails(item: MenuItem.example)
            .environmentObject(Order())
        }
    }
}
