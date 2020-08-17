//
//  Cart.swift
//  IFSPRAV4
//
//  Created by DC UFSCar on 28/06/19.
//  Copyright © 2019 DC UFSCar. All rights reserved.
//

import Foundation

class Cart{
    
    var idCart: Int
    var codProd: Int
    var quant: Int
    let dateTime: String
    let bought: Int
    let idFinalized: Int
    //let product: Product
    
    

    init(idCart: Int, codProd: Int, quant: Int, dateTime: String, bought: Int, idFinalized: Int){
        
        self.idCart = idCart
        self.codProd = codProd
        self.quant = quant
        self.dateTime = dateTime
        self.bought = bought
        self.idFinalized = idFinalized
        //self.product = product
        
    }
    
    
    /*
    init(idCart: Int, codProd: Int, quant: Int, dateTime: String){
        
        self.idCart = idCart
        self.codProd = codProd
        self.quant = quant
        self.dateTime = dateTime
        
    }*/
    


    
    
}
