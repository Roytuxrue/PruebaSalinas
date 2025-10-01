//
//  ProductRemoteDataSource.swift
//  ConsumoS1
//
//  Created by Roytuxrue on 30/09/25.
//

import Foundation

protocol ProductRemoteDataSourceProtocol {
    func fetchProducts() async throws -> [Product]
}

class ProductRemoteDataSource: ProductRemoteDataSourceProtocol {
    private let urlString = "https://alb-dev-ekt-875108740.us-east-1.elb.amazonaws.com/apps/moviles/caso-practico/plp"
    
    func fetchProducts() async throws -> [Product] {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoded = try JSONDecoder().decode(ProductResponse.self, from: data)
            return decoded.result.products
        } catch {
            throw error
        }
    }
}

