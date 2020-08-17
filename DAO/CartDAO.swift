//
//  CartDAO.swift
//  IFSPRAV4
//
//  Created by DC UFSCar on 28/06/19.
//  Copyright © 2019 DC UFSCar. All rights reserved.
//

import Foundation
import SQLite3

class CartDAO{
    
    internal let SQLITE_STATIC = unsafeBitCast(0, to: sqlite3_destructor_type.self)
    internal let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
    
    
    static func creatingTableCart() {
        
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("Ecommerce.sqlite")
        
        var db: OpaquePointer?
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")}
        
 
        if sqlite3_exec(db, "create table if not exists cart (id integer primary key autoincrement, codProd integer, quant integer, datetime text, bought integer, idFinalized integer)", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
        }
        
        print("\n Tabela cart criada: \n")
        
    }
    
    
    
    func saveDataSQLite(objCart: Cart){
        
        var db: OpaquePointer?
        db = Connection.openConnection()
        
        var statement: OpaquePointer?
        
        /*
        
        var person = Person()
        var nomeTeste: String = ""
        person.product.setName(name: nomeTeste)
        */
        
        if sqlite3_prepare_v2(db, "insert into cart (codProd, quant, dateTime, bought, idFinalized) values (?, ?, ?, ?, ?)", -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
        }
        
        if sqlite3_bind_int(statement, 1, Int32(objCart.codProd)) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding codProd: \(errmsg)")
        }
        
        if sqlite3_bind_int(statement, 2, Int32(objCart.quant)) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding quant: \(errmsg)")
        }
        

        if sqlite3_bind_text(statement, 3, objCart.dateTime, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding dateTime: \(errmsg)")
        }
        
        if sqlite3_bind_int(statement, 4, Int32(0)) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding bought: \(errmsg)")
        }
        
        
        if sqlite3_bind_int(statement, 5, Int32(0)) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding idFinalized: \(errmsg)")
        }
        

        if sqlite3_step(statement) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting table: \(errmsg)")
        }
        
        
        print(" Etapa Cart: Dados inseridos: \(String(describing: objCart.codProd)) e \(String(describing: objCart.quant))")
        
    }
    
    
    
    
    
    func getDataSQLite() -> [Cart]{
        
        
        var db: OpaquePointer?
        db = Connection.openConnection()
        var cartList = [Cart]()

        //this is our select query
        //let queryString = "SELECT id, name, description, price, shortDescription, stock, featured, weight, picture1 FROM Product"
        let queryString = "SELECT id, codProd, quant, dateTime, bought, idFinalized  FROM cart"
        
        //statement pointer
        var stmt:OpaquePointer?
        
        //preparing the query
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            //return
        }
        
        //traversing through all the records
        while(sqlite3_step(stmt) == SQLITE_ROW){
            let id = sqlite3_column_int(stmt, 0)
            let codProd = sqlite3_column_int(stmt, 1)
            let quant = sqlite3_column_int(stmt, 2)
            let dateTime = String(cString: sqlite3_column_text(stmt, 3))
            let bought = sqlite3_column_int(stmt, 4)
            let idFinalized = sqlite3_column_int(stmt, 5)

            cartList.append(Cart(idCart: Int(id), codProd: Int(codProd), quant: Int(quant), dateTime: String(dateTime), bought: Int(bought), idFinalized: Int(idFinalized)))

        }
        
        return cartList

    }

    
    func deleteData(idCart: Int) {
        
        var db: OpaquePointer?
        db = Connection.openConnection()
        
        var statement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, "DELETE FROM cart WHERE id = ?;", -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing delete: \(errmsg)")
        }
        
        if sqlite3_bind_int(statement, 1, Int32(idCart)) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding idCart: \(errmsg)")
        }
        
        
        if sqlite3_step(statement) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure delete table: \(errmsg)")
        }
        
        
        
        
    }

    
    
}
