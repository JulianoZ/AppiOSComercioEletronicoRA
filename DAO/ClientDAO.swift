//
//  ClientDAO.swift
//  IFSPRAV4
//
//  Created by DC UFSCar on 04/07/19.
//  Copyright © 2019 DC UFSCar. All rights reserved.
//

import Foundation

class ClientDAO{
    
    static func authentication(Login: String, Senha: String) -> Bool{
        var retorno: Bool = false
        //if (Login == "juliano_z@yahoo.com.br" && Senha == "12345"){
        if (Login == "J" && Senha == "1"){
            //self.performSegue(withIdentifier: "segueHome", sender: nil)
            retorno = true
        }else{
            retorno = false
        }
        return retorno
}
    
    
}
