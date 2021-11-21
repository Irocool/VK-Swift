//
//  ProductRequestFactory.swift
//  GBShop
//
//  Created by Irina Kuligina on 10.08.2021.
//

import Alamofire

protocol ProductRequestFactory {
    func catalog(completionHandler: @escaping (AFDataResponse<[ProductResult]>) -> Void)
    func product(by id: Int, completionHandler: @escaping (AFDataResponse<PurchasesResult>) -> Void)
}
