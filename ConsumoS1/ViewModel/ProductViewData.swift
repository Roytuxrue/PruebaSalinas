//
//  ProductViewData.swift
//  ConsumoS1
//
//  Created by Roytuxrue on 01/10/25.
//


import Foundation

struct ProductViewData: Identifiable {
    let id: String
    let name: String
    let imageUrl: String
    let finalPrice: String
    let regularPrice: String
    let discountMessage: String
    let category: String
}
