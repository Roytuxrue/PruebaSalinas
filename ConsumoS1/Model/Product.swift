//
//  Product.swift
//  ConsumoS1
//
//  Created by Roytuxrue on 30/09/25.
//
//TO DO: Crear archivo por cada estructura Codable.

import Foundation

// Root
struct ProductResponse: Codable {
    let message: String?
    let warning: String?
    let result: ResultData?
    
    enum CodingKeys: String, CodingKey {
        case message = "mensaje"
        case warning = "advertencia"
        case result = "resultado"
    }
}

//  Result
struct ResultData: Codable {
    let pagination: Pagination?
    let category: String?
    let products: [Product]?
    
    enum CodingKeys: String, CodingKey {
        case pagination = "paginacion"
        case category = "categoria"
        case products = "productos"
    }
}

//  Pagination
struct Pagination: Codable {
    let page: Int?
    let totalPages: Int?
    let totalRecords: Int?
    let totalRecordsPerPage: Int?
    
    enum CodingKeys: String, CodingKey {
        case page = "pagina"
        case totalPages = "totalPaginas"
        case totalRecords = "totalRegistros"
        case totalRecordsPerPage = "totalRegistrosPorPagina"
    }
}

// Product
struct Product: Codable, Identifiable {
    let id: String?
    let lineId: Int?
    let categoryCode: String?
    let modalityId: Int?
    let relevance: Int?
    let creditLine: String?
    let mainWeeklyPayment: Double?
    let mainTerm: Int?
    let creditAvailable: Bool?
    let weeklyPayments: [WeeklyPayment]?
    let sku: String?
    let name: String?
    let imageUrls: [String]?
    let regularPrice: Double?
    let finalPrice: Double?
    let discountPercentage: Double?
    let hasDiscount: Bool?
    let creditPrice: Double?
    let discountAmount: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case lineId = "idLinea"
        case categoryCode = "codigoCategoria"
        case modalityId = "idModalidad"
        case relevance
        case creditLine = "lineaCredito"
        case mainWeeklyPayment = "pagoSemanalPrincipal"
        case mainTerm = "plazoPrincipal"
        case creditAvailable = "disponibleCredito"
        case weeklyPayments = "abonosSemanales"
        case sku, name = "nombre"
        case imageUrls = "urlImagenes"
        case regularPrice = "precioRegular"
        case finalPrice = "precioFinal"
        case discountPercentage = "porcentajeDescuento"
        case hasDiscount = "descuento"
        case creditPrice = "precioCredito"
        case discountAmount = "montoDescuento"
    }
    
    var displayImage: String {
        imageUrls?.first ?? ""
    }
}

// Weekly Payment
struct WeeklyPayment: Codable {
    let term: Int?
    let paymentAmount: Double?
    let paymentDiscountAmount: Double?
    let lastPaymentAmount: Double?
    let finalCreditAmount: Double?
    let promotionId: Int?
    let elektraDiscountAmount: Double?
    let bankDiscountAmount: Double?
    let price: Double?
    let digitalPaymentAmount: Double?
    
    enum CodingKeys: String, CodingKey {
        case term = "plazo"
        case paymentAmount = "montoAbono"
        case paymentDiscountAmount = "montoDescuentoAbono"
        case lastPaymentAmount = "montoUltimoAbono"
        case finalCreditAmount = "montoFinalCredito"
        case promotionId = "idPromocion"
        case elektraDiscountAmount = "montoDescuentoElektra"
        case bankDiscountAmount = "montoDescuentoBanco"
        case price
        case digitalPaymentAmount = "montoAbonoDigital"
    }
}
