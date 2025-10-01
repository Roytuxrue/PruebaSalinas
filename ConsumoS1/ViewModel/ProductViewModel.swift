//
//  ProductViewModel.swift
//  ConsumoS1
//
//  Created by Roytuxrue on 30/09/25.
//



import Combine
import SwiftUI

@MainActor
class ProductViewModel: ObservableObject {
    @Published var products: [ProductViewData] = []
    @Published var errorMessage: String? = nil
    
    private let remoteDataSource: ProductRemoteDataSourceProtocol
    
    init(remoteDataSource: ProductRemoteDataSourceProtocol = ProductRemoteDataSource()) {
        self.remoteDataSource = remoteDataSource
    }
    
    func loadProducts() async {
        do {
            let fetchedProducts = try await remoteDataSource.fetchProducts()
            self.products = transform(products: fetchedProducts)
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
    
    private func transform(products: [Product]) -> [ProductViewData] {
        return products.compactMap { product in
            guard let id = product.id else {
                return nil
            }
            
            let name = product.name ?? "Producto sin nombre"
            let imageUrl = product.imageUrls?.first ?? ""
            let finalPrice = String(format: "$%.2f", product.finalPrice ?? 0.0)
            let regularPrice = String(format: "$%.2f", product.regularPrice ?? 0.0)
            
            let discountMessage: String
            if let discount = product.discountPercentage, discount > 0 {
                discountMessage = "¡\(Int(discount))% de descuento!"
            } else {
                discountMessage = ""
            }
            
            let category = product.categoryCode ?? "Sin categoría"

            return ProductViewData(
                id: id,
                name: name,
                imageUrl: imageUrl,
                finalPrice: finalPrice,
                regularPrice: regularPrice,
                discountMessage: discountMessage,
                category: category
            )
        }
    }
}

