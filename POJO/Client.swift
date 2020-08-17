//
//  Client.swift
//  IFSPRAV4
//
//  Created by DC UFSCar on 04/07/19.
//  Copyright © 2019 DC UFSCar. All rights reserved.
//


import Foundation

class Client{
    
    var id: Int = 0
    var name: String = ""
    var email: String = ""
    var password: String = ""
    
    
    init(){}
    
    
    
    public func setName(name: String){
        self.name = name
    }
    
    func getName() -> String{
        return self.name
    }
    
    
    
    public func setEmail(email: String){
        self.email = email
    }
    
    func getEmail() -> String{
        return self.email
    }
    
    
    public func setPassword(password: String){
        self.name = password
    }
    
    func getPassword() -> String{
        return self.password
    }
    
    public func setId(id: Int){
        self.id = id
    }
    
    func getId() -> Int{
        return self.id
    }
    
    
}

