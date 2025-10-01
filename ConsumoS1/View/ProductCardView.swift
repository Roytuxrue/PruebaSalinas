//
//  ProductCardView.swift
//  ConsumoS1
//
//  Created by Roytuxrue on 30/09/25.
//
// TO DO: Crar archivo de Constantes.

import SwiftUI

struct ProductCardView: View {
    let product: ProductViewData

    var body: some View {
        HStack(spacing: 15) {
            AsyncImage(url: URL(string: product.imageUrl)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: 80, height: 80)
            .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(product.name)
                    .font(.headline)
                    .lineLimit(2)
                
                Text(product.regularPrice)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .strikethrough()

                Text(product.finalPrice)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.green)
                
                Text("Category: \(product.category)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 5)
        }
    }
}
