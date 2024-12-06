////
////  NetworkManager.swift
////  TakeOut
////
////  Created by Dicky Ning on 12/5/24.
////
//import Alamofire
//import Foundation
//
//class NetworkManager {
//    static let shared = NetworkManager()
//    private let baseURL = "http://127.0.0.1:8000"
//
//    func fetchDiningHalls(completion: @escaping ([DiningHall]?) -> Void) {
//        let url = "\(baseURL)/dining_halls"
//        AF.request(url).responseDecodable(of: [DiningHall].self) { response in
//            switch response.result {
//            case .success(let diningHalls):
//                completion(diningHalls)
//            case .failure(let error):
//                print("Error fetching dining halls: \(error)")
//                completion(nil)
//            }
//        }
//    }
//
//    func placeOrder(order: Order, completion: @escaping (Bool) -> Void) {
//        let url = "\(baseURL)/orders"
//        AF.request(url, method: .post, parameters: order, encoder: JSONParameterEncoder.default).response { response in
//            switch response.result {
//            case .success:
//                completion(true)
//            case .failure(let error):
//                print("Error placing order: \(error)")
//                completion(false)
//            }
//        }
//    }
//}
//
//
