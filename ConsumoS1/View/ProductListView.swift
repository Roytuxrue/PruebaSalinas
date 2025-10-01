//
//  ProductListView.swift
//  ConsumoS1
//
//  Created by Roytuxrue on 01/10/25.
//


import SwiftUI

struct ProductListView: View {
    @StateObject private var viewModel = ProductViewModel()
    
    @Environment(\.dismiss) var dismiss
    
    let onProductSelected: (ProductViewData) -> Void
    
    var body: some View {
        VStack {
            if viewModel.products.isEmpty && viewModel.errorMessage == nil {
                ProgressView("Cargando productos...")
            }
            
            if let errorMessage = viewModel.errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
                    .padding()
            }
            
            List(viewModel.products) { product in
                Button(action: {
                    onProductSelected(product)
                    dismiss()
                }) {
                    ProductCardView(product: product)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .navigationTitle("Selecciona un Producto")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.loadProducts()
        }
    }
}
