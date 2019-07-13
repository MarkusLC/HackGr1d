
//
//  File.swift
//  Api-Alamofire
//
//  Created by markus corgosinho on 11/07/19.
//  Copyright © 2019 markus corgosinho. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class NetworkAPI{
    
    
    typealias requestResponse = (Any?, Error?) -> Void
    
    func makeRequest(url: String, apiKey: String, completion:@escaping requestResponse){
        
        let headers: HTTPHeaders = ["X-Api-Key":apiKey,"accept":"application/json"]
        
        Alamofire.request(url, headers: headers).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Result: \(response.result)")                         // response serialization result
            
            
            if let jsonArray = response.result.value  {
                
                completion(jsonArray,nil)
               
            }else if let error = response.error {
                completion(nil,error)
            }
        }
        
    }
    
    func makeCotação(url: String, apiKey: String, completion:@escaping requestResponse) {
        
        
        let teste = "{ \"destinos\": [ \"string\" ], \"passageiros\": [ { \"nome\": \"string\", \"dataNascimento\": \"2019-07-13T22:05:38.954Z\" } ], \"dataSaida\": \"2019-07-13T22:05:38.954Z\", \"dataRetorno\": \"2019-07-13T22:05:38.954Z\", \"tipoViagem\": 1, \"tipoTarifa\": 2, \"produtoAvulso\": true, \"cupom\": \"string\", \"classificacoes\": [ 0 ]}"
        func convertToDictionary(text: String) -> [String: Any]? {
            if let data = text.data(using: .utf8) {
                do {
                    return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                } catch {
                    print(error.localizedDescription)
                }
            }
            return nil
        }
        
        let str =  "{ \"destinos\": [ \"AMERICA CENTRAL\" ], \"passageiros\": [ { \"nome\": \"Markus\", \"dataNascimento\": \"1998-07-13\" } ], \"dataSaida\": \"2019-08-13T22:05:38.954Z\", \"dataRetorno\": \"2019-09-13T22:05:38.954Z\", \"tipoViagem\": 0, \"tipoTarifa\": 0, \"produtoAvulso\": true, \"cupom\": \"string\", \"classificacoes\": [ 0 ]}"
        
        let dict = convertToDictionary(text: str)
        
      
        
        let headers: HTTPHeaders = ["X-Api-Key":apiKey,"accept":"application/json"]
       
        Alamofire.request(url, method: .post, parameters: dict, encoding: JSONEncoding.prettyPrinted, headers: headers).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Result: \(response.result)")                         // response serialization result
            
            
            if let jsonArray = response.result.value  {
                
                completion(jsonArray,nil)
                
            }else if let error = response.error {
                completion(nil,error)
            }
            
            
            
        }
        
        
        
        
        
    }
    func makeAPost (url: String){
        
        Alamofire.request(url, method: .post).responseJSON { (response) in
            print(response.result.value)
        }
    }
    
}
