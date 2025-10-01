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
    @Published var products: [Product] = []
    @Published var errorMessage: String? = nil
    
    private let remoteDataSource: ProductRemoteDataSourceProtocol
    
    init(remoteDataSource: ProductRemoteDataSourceProtocol = ProductRemoteDataSource()) { //TO DO : Eliminar Warning :V
        self.remoteDataSource = remoteDataSource
    }
    
    func loadProducts() async {
        do {
            let fetchedProducts = try await remoteDataSource.fetchProducts()
            self.products = fetchedProducts
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
}
