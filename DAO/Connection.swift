//
//  Connection.swift
//  IFSPRAV4
//
//  Created by DC UFSCar on 24/06/19.
//  Copyright © 2019 DC UFSCar. All rights reserved.
//

import Foundation
import SQLite3


class Connection{


    static func openConnection() -> OpaquePointer?{
        var db: OpaquePointer?
        
        //Criando o banco de dados
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("Ecommerce.sqlite")
        
        //Conexão com o banco de dados
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        }
        return db

    }
    
    
    
    
    
}
