//
//  OrderFinalizedDAO.swift
//  IFSPRAV4
//
//  Created by DC UFSCar on 03/07/19.
//  Copyright © 2019 DC UFSCar. All rights reserved.
//

import Foundation
import SQLite3



class OrderFinalizedDAO{
    
    internal let SQLITE_STATIC = unsafeBitCast(0, to: sqlite3_destructor_type.self)
    internal let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
    
    
    /*
     private var id: Int = 0
     private var valueTotal: Float = 0
     private var client_idClients: Int = 0
     private var dateTime: String = ""
     private var zipCodeDelivery_idZipCodeDelivery: Int = 0
     private var valueChange: Float = 0
     private var payment_idPayment: Int = 0
     private var statusOrdered: Int = 0
     private var statusOrderLocal: Int = 0
     private var note: String = ""
     private var primaryKey: Int = 0
     private var user: Person = Person()
     

     
     
     name text, description text, price re  al, shortDescription text, stock integer, featured integer, weight real, picture1 text, picture2 text, subCategoryIDSubCategory integer, dateTimeRegister text, ar integer, pictureMap text, idSubCategory integer, subCategoryName text, categoryIDCategory integer, idCategory integer, categoryName text, picture text)
 
 
 */
    
    
    static func creatingTableOrderFinalized() {
        
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("Ecommerce.sqlite")
        
        var db: OpaquePointer?
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")}
        
        
        if sqlite3_exec(db, "create table if not exists orderFinalized (id integer primary key autoincrement, client_idClients integer, name text, valueTotal real, dateTime text, statusOrdered integer, statusOrderLocal integer)", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
        }
        
        
        print("\n Tabela orderFinalized criada: \n")
        
    }
    
  
    func saveObject(orderF: [String: Any]) -> OrderFinalized{
        
        let orderFinalized: OrderFinalized
        orderFinalized = OrderFinalized()
        
  
        
        let id: Int = orderF["idOrderedFinalized"] as? Int ?? 0
        let name: String = orderF["Name"] as? String ?? "null"
        let dateTime: String = orderF["DateTimeOrdered2"] as? String ?? "null"
        let valueTotal: Double = orderF["ValueTotal"] as? Double ?? 0
        let statusOrdered: Int = orderF["StatusOrdered"] as? Int ?? 0
        let statusOrderLocal: Int = orderF["StatusOrderLocal"] as? Int ?? 0
        
        //print(" Order Json >> DateTimeOrdered2:  \(orderF["DateTimeOrdered2"])")
        
        orderFinalized.setId(id: id)
        orderFinalized.user.setName(name: name)
        orderFinalized.setDateTime(dateTime: dateTime)
        orderFinalized.setValueTotal(valueTotal: valueTotal)
        orderFinalized.setStatusOrdered(statusOrdered: statusOrdered)
        orderFinalized.setStatusOrderLocal(statusOrderLocal: statusOrderLocal)
        

        print(" Etapa B >> Objeto OrderFinalized criado")
        
        return orderFinalized
        
    }
 
    
    
    
    
    
    
    func saveDataSQLite(objOrderFinalized: OrderFinalized){
        
        var db: OpaquePointer?
        db = Connection.openConnection()
        
        var statement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, "insert into orderFinalized (client_idClients, name, valueTotal, dateTime, statusOrdered, statusOrderLocal) values (?, ?, ?, ?, ?, ?)", -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
        }
        
        if sqlite3_bind_int(statement, 1, Int32(objOrderFinalized.client_idClients)) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding client_idClients: \(errmsg)")
        }
        
        

        if sqlite3_bind_text(statement, 2, objOrderFinalized.getUser().getName(), -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding name: \(errmsg)")
        }
        
        if sqlite3_bind_double(statement, 3, objOrderFinalized.valueTotal) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding valueTotal: \(errmsg)")
        }
        
        if sqlite3_bind_text(statement, 4, objOrderFinalized.dateTime, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding dateTime: \(errmsg)")
        }
        
        if sqlite3_bind_int(statement, 5, Int32(objOrderFinalized.statusOrdered)) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding statusOrdered: \(errmsg)")
        }
        
        if sqlite3_bind_int(statement, 6, Int32(objOrderFinalized.statusOrderLocal)) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding statusOrderLocal: \(errmsg)")
        }
        

        if sqlite3_step(statement) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting table: \(errmsg)")
        }
        
        
        print("\n Etapa Persistencia : Dados inseridos em OrderFinalized: \(String(describing: objOrderFinalized.getUser().name)) e \(String(describing: objOrderFinalized.id)))")
        
    }
    
    
    
    
    func getDataSQLite() -> [OrderFinalized]{
        
        
        var db: OpaquePointer?
        db = Connection.openConnection()
        var orderFinalizedList = [OrderFinalized]()
        
        

        //this is our select query
        //let queryString = "SELECT id, name, description, price, shortDescription, stock, featured, weight, picture1 FROM Product"
        let queryString = "SELECT id, client_idClients, name, valueTotal, dateTime, statusOrdered, statusOrderLocal FROM orderFinalized"
        
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
            let client_idClients = sqlite3_column_int(stmt, 1)
            let name = String(cString: sqlite3_column_text(stmt, 2))
            let valueTotal = Double(sqlite3_column_double(stmt, 3))
            let dateTime = String(cString: sqlite3_column_text(stmt, 4))
            let statusOrdered = sqlite3_column_int(stmt, 5)
            let statusOrderLocal = sqlite3_column_int(stmt, 6)
            
            let orderFinalized: OrderFinalized
            orderFinalized = OrderFinalized()
            
            orderFinalized.setId(id: Int(id))
            orderFinalized.setClient_idClients(client_idClients: Int(client_idClients))
            orderFinalized.user.setName(name: name)
            orderFinalized.setDateTime(dateTime: dateTime)
            orderFinalized.setValueTotal(valueTotal: valueTotal)
            orderFinalized.setStatusOrdered(statusOrdered: Int(statusOrdered))
            orderFinalized.setStatusOrderLocal(statusOrderLocal: Int(statusOrderLocal))
            
            orderFinalizedList.append(orderFinalized)

        }
        
        return orderFinalizedList
        
        
        
        
    }
    
    
    
}
