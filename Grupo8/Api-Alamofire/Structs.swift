//
//  Struct-cotacao .swift
//  Api-Alamofire
//
//  Created by markus corgosinho on 13/07/19.
//  Copyright © 2019 markus corgosinho. All rights reserved.
//

import Foundation

struct Cotacoes {
    
    var despesasMedicas:String
    var despesasOdontologicas:String
    var despesasFarmaceuticas:String
    var invalidezPermanente:String
    var total:String
    
    init(despesas:String, despesasOdonto:String, despesasFarma:String, invalidez:String){
        despesasMedicas = "$60,000.00"
        despesasOdontologicas = "$500.00"
        despesasFarmaceuticas = "$800.00"
        invalidezPermanente = "$40,000.00"
        total = "R$ 856,41"
    }
}
struct DadosCadastro {
    
    var nome:String
    var sobrenome:String
    var sexo:String
    var documento:String
    var dataDeNascimento:String
    var email:String
    
    init(nomeUsuario:String, sobrenomeUsuario:String, sexoUsuario:String, documentoUsuario:String, dataDenascimento:String, emailUsuario:String) {
        nome = nomeUsuario
        sobrenome = sobrenomeUsuario
        sexo = sexoUsuario
        documento = documentoUsuario
        dataDeNascimento = dataDenascimento
        email = emailUsuario
        
    }
}

struct Endereço {
    var endereço:String
    var cep:String
    var cidade:String
    var estado:String
    
    init(endereçoUsuario:String, cepUsuario:String, cidadeUsuario:String, estadoUsuario:String) {
        endereço = endereçoUsuario
        cep = cepUsuario
        cidade = cidadeUsuario
        estado = estadoUsuario
    }
    
}

struct DadosPagamento {
    var bandeira:String
    var nomeTitulas:String
    var cpfTitular:String
    var numeroDoCartao:String
    var cvv:String
    var mesValidade:String
    var anoValidade:String
    
}
