//
//  ViewController.swift
//  Api-Alamofire
//
//  Created by markus corgosinho on 10/07/19.
//  Copyright © 2019 markus corgosinho. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    //Outletts
    @IBOutlet weak var idadeUsuario: UITextField!
    
    @IBOutlet weak var ImagemDocumentoSalvar: UIImageView!
    @IBOutlet weak var txtDatePicker: UITextField!
   
    let datePicker = UIDatePicker()

    //Variable for API handler
    var APIHandller = NetworkAPI()
    var apiKey = "b7483bb4-f7f9-4521-a047-223fc550a1cb"
    var apiKeyCNH = "e58a4197-fd3d-44f0-bd71-b96a40201ef4"
    var urlBeneficios = "https://gateway.gr1d.io/sandbox/travelace/v1/beneficios?idioma=Ingl%C3%AAs&tipoTarifa=1&nacional=true"
    
    //Handler beneficios
    var beneficios:Any!
    var cotacao:Any!
    
    //Varible for the imagem chosen
    var imageChoosen = UIImage()
    
    //Struct to cotacaoes
    var cotacaoRecebida:Cotacoes!
    
    //Struct to documentes saved
    var documentosSalvos:[documentosArmazenamento]!
    
    //Struct data from user
    var dadosUsuario = DadosCadastro(nomeUsuario: "Markus", sobrenomeUsuario: "Lopes Corgosinho", sexoUsuario: "masc", documentoUsuario: "03072589654", dataDenascimento: "1998-09-02", emailUsuario: "markus.corgosinho@gmail.com")
    
    //User defults
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        idadeUsuario.delegate = self
        // Do any additional setup after loading the view.
        
        //here commented a function to clen UserDefults
        //                let domain = Bundle.main.bundleIdentifier!
        //                UserDefaults.standard.removePersistentDomain(forName: domain)
        //                UserDefaults.standard.synchronize()
        
        
        APIHandller.makeRequest(url: urlBeneficios, apiKey: apiKey) { (result, error) in

            self.beneficios = result
        
        }
        APIHandller.makeCotação(url:"https://gateway.gr1d.io/sandbox/travelace/v1/Cotacao", apiKey: apiKey, dadosUsuario: dadosUsuario) { (cotacaoAnalise, error) in
            
//            print(cotacaoAnalise)
            self.cotacao = cotacaoAnalise as? [String:Any]
            
            self.cotacaoRecebida =  Cotacoes.init(despesas: ""  , despesasOdonto: "", despesasFarma: "", invalidez: "")
            
        }
        APIHandller.makeAnaliseDocument(url:"https://gateway.gr1d.io/sandbox/compline/cnh/v1/job/create", apiKey: apiKeyCNH) { (response, error) in
            
//            print(response)
        }
        
        if let imagemGurdada = defaults.object(forKey: "documento") as? UIImage{
            
            imageChoosen = imagemGurdada
        }
    }
   
    
    func uberPromo()  {
        
        if let appURL = URL(string: "uber://"){
            let canOpen = UIApplication.shared.canOpenURL(appURL)
            print(canOpen)
            
            let urlDesconto = URL(string: "uber://?action=applyPromo&client_id=oR0w9lRbIYHRTf3qWtVuRYfIL4j9vU0h&promo=CUPONOMIA_20")
            
            if UIApplication.shared.canOpenURL(urlDesconto!){
                
                UIApplication.shared.open(urlDesconto!, options: [:], completionHandler: nil)
            }
        }
    }

    @IBAction func saveDocumentes(_ sender: Any) {
        
        performSegue(withIdentifier: "backWithDocuments", sender: self)
        
    }
    
    @IBAction func UberCall(_ sender: UIButton) {
        uberPromo()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var ano = 2019 - 21
        
        dadosUsuario.dataDeNascimento = "\(ano)-07-12"
        
        return false
    }
}

