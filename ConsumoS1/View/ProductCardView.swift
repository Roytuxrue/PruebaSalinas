//
//  ProductCardView.swift
//  ConsumoS1
//
//  Created by Roytuxrue on 30/09/25.
//
// TO DO: Crar archivo de Constantes.

import SwiftUI

struct ProductCardView: View {
    let product: Product
    
    var body: some View {
        HStack(spacing: 15) {
            AsyncImage(url: URL(string: product.displayImage)) { image in
                image.resizable()
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
                Text("Price: $\(product.finalPrice, specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundColor(.green)
                Text("Category: \(product.categoryCode)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 5)
    }
}
