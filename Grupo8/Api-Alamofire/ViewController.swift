//
//  ViewController.swift
//  Api-Alamofire
//
//  Created by markus corgosinho on 10/07/19.
//  Copyright © 2019 markus corgosinho. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    //Variable for API handler
    var APIHandller = NetworkAPI()
    var apiKey = "b7483bb4-f7f9-4521-a047-223fc550a1cb"
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        APIHandller.makeRequest(url: "https://gateway.gr1d.io/sandbox/travelace/v1/destinos", apiKey: apiKey) { (result, error) in
            print(result)
        }
        APIHandller.makeCotação(url: "https://gateway.gr1d.io/sandbox/travelace/v1/Cotacao", apiKey: apiKey) { (cotacao, error) in
            print(cotacao)
        }
//        APIHandller.makeAPost(url: "https://jsonplaceholder.typicode.com/posts")
        
        
//        let user = "user"
//        let password = "password"
//
//        Alamofire.request("https://httpbin.org/basic-auth/\(user)/\(password)")
//            .authenticate(user: user, password: password)
//            .responseJSON { response in
//                debugPrint(response)
////        }
//         var image = UIImage()
//        Alamofire.download("https://httpbin.org/image/png")
//            .downloadProgress { progress in
//                print("Download Progress: \(progress.fractionCompleted)")
//            }
//            .responseData { response in
//                if let data = response.result.value {
//                    image = UIImage(data: data)!
//                   
//                }
//        }
//        let imageData = image.pngData()!
//        
//        Alamofire.upload(imageData, to: "https://httpbin.org/post").responseJSON { response in
//            debugPrint(response)
//        }
        
       


    }


}

