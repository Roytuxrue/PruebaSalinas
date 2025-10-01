//
//  ProductView.swift
//  ConsumoS1
//
//  Created by Roytuxrue on 30/09/25.
//

import Foundation

import SwiftUI

struct ProductView: View {
    @StateObject private var viewModel = ProductViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                        .padding()
                }
                
                List(viewModel.products) { product in
                    ProductCardView(product: product)
                }
                
                Button(action: {
                    Task {
                        await viewModel.loadProducts()
                    }
                }) {
                    Text("Load Products")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .padding(.bottom)
            }
            .navigationTitle("Products")
        }
    }
}
