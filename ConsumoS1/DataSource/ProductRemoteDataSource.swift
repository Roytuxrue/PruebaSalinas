//
//  ProductRemoteDataSource.swift
//  ConsumoS1
//
//  Created by Roytuxrue on 30/09/25.
//

import Foundation

// Define tus errores personalizados aquí
enum NetworkError: Error {
    case badURL
    case invalidData
    case productsNotFound
}

protocol ProductRemoteDataSourceProtocol {
    func fetchProducts() async throws -> [Product]
}

class ProductRemoteDataSource: ProductRemoteDataSourceProtocol {
    private let urlString = "http://alb-dev-ekt-875108740.us-east-1.elb.amazonaws.com/apps/moviles/caso-practico/plp"

    func fetchProducts() async throws -> [Product] {
        guard let url = URL(string: urlString) else {
            throw NetworkError.badURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        do {
            let decoded = try JSONDecoder().decode(ProductResponse.self, from: data)
            
            // Usamos guard let para desenvolver de forma segura la lista de productos
            guard let products = decoded.result?.products else {
                // Si 'products' es nil, lanzamos un error claro y salimos.
                throw NetworkError.productsNotFound
            }
            
            // Si el guard let tiene éxito, 'products' es un array [Product] no opcional.
            return products

        } catch {
            // Si la decodificación falla por otra razón, relanzamos el error.
            throw error
        }
    }
}
