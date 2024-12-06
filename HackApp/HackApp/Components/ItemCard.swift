//
//  ItemCard.swift
//  HackApp
//
//  Created by Zoey Jin on 12/6/24.
//

import SwiftUI

struct ItemCard: View {
    @EnvironmentObject var cartManager: CartManager
    var menuItem: MenuItem
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            ZStack(alignment: .bottom) {
                Image(menuItem.image)
                    .resizable()
                    .cornerRadius(10)
                    .frame(width: 180)
                    .scaledToFit()
                
                VStack(alignment: .leading){
                    Text(menuItem.name)
                        .bold()
                    Text("$\(menuItem.price)")
                        .font(.caption)
                    
                }
                .padding()
                .frame(width: 180, alignment: .leading)
                .background(.white)
            }
            .frame(width: 100, height: 250)
            .shadow(radius: 3)
            
            Button {
                cartManager.addToCart(menuItem: menuItem)
            } label: {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.black)
                    .background(.white)
                    .cornerRadius(50)
//                    .alignmentGuide(.leading, computeValue: { dimension in
//                            -100
//                        })
                    .padding(10)
                
            }
        }
    }
}

#Preview {
    ItemCard(menuItem: itemList[0])
        .environmentObject(CartManager())
}
