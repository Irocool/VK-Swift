//
//  Product.swift
//  GBShop
//
//  Created by Irina Kuligina on 10.08.2021.
//

import Foundation
import Alamofire

class Product: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension Product: ProductRequestFactory {
    func catalog(completionHandler: @escaping (AFDataResponse<[ProductResult]>) -> Void) {
        let requestModel = Catalog(baseUrl: self.baseUrl)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func product(by id: Int, completionHandler: @escaping (AFDataResponse<PurchasesResult>) -> Void) {
        let requestModel = Good(baseUrl: self.baseUrl, id: id)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Product {
    struct Catalog: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "catalogData.json"
    
        var parameters: Parameters? {
            return [:]
        }
    }
    
    struct Good: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getPurchseById.json"
    
        let id: Int
        var parameters: Parameters? {
            return [
                "id": id,
            ]
        }
    }
}
