//
//  ProductView.swift
//  ConsumoS1
//
//  Created by Roytuxrue on 30/09/25.
//


import SwiftUI

struct ProductView: View {
    @State private var selectedProduct: ProductViewData? = nil
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
             
                if let product = selectedProduct {
                    Text("Producto Seleccionado:")
                        .font(.headline)
                    ProductCardView(product: product)
                } else {
                    Text("No se ha seleccionado ningún producto.")
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                // segunda pantalla
                NavigationLink(destination: ProductListView(onProductSelected: { product in
                    
                    self.selectedProduct = product
                })) {
                    Text("Buscar Productos")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
            }
            .padding()
            .navigationTitle("Pantalla Principal")
        }
    }
}
