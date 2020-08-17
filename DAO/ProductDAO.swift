//
//  ProductDAO.swift
//  IFSPRAV4
//
//  Created by DC UFSCar on 21/06/19.
//  Copyright © 2019 DC UFSCar. All rights reserved.
//

import Foundation
import SQLite3

class ProductDAO{
    
    
    
    internal let SQLITE_STATIC = unsafeBitCast(0, to: sqlite3_destructor_type.self)
    internal let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
    

    static func creatingTableProduct() {
        
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("Ecommerce.sqlite")
        
        var db: OpaquePointer?
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")}
        
        
        if sqlite3_exec(db, "create table if not exists product (id integer primary key autoincrement, name text, description text, price re  al, shortDescription text, stock integer, featured integer, weight real, picture1 text, picture2 text, subCategoryIDSubCategory integer, dateTimeRegister text, ar integer, pictureMap text, idSubCategory integer, subCategoryName text, categoryIDCategory integer, idCategory integer, categoryName text, picture text)", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
        }
        
        
        print("\n Tabela product criada: \n")

    }
    
    
    
    func saveDataSQLite(objProduct: Product){
        
        var db: OpaquePointer?
        db = Connection.openConnection()
        
        var statement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, "insert into product (name, description, price, shortDescription, stock, featured, weight, picture1, picture2, subCategoryIDSubCategory, dateTimeRegister, ar, pictureMap, idSubCategory, subCategoryName, categoryIDCategory, idCategory, categoryName, picture) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
        }
        
        if sqlite3_bind_text(statement, 1, objProduct.name, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding name: \(errmsg)")
        }
        
        if sqlite3_bind_text(statement, 2, objProduct.description, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding description: \(errmsg)")
        }
        
        if sqlite3_bind_double(statement, 3, objProduct.price) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding price: \(errmsg)")
        }
        
        if sqlite3_bind_text(statement, 4, objProduct.shortDescription, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding shortDesc: \(errmsg)")
        }
        
        if sqlite3_bind_int(statement, 5, Int32(objProduct.stock)) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding stock: \(errmsg)")
        }
        
        if sqlite3_bind_int(statement, 6, objProduct.featured ? 0 : 1) !=    SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding featured: \(errmsg)")
        }
        
        //--aqui--
        
        if sqlite3_bind_double(statement, 7, objProduct.weight) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding weight: \(errmsg)")
        }
        
        if sqlite3_bind_text(statement, 8, objProduct.picture1, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding picture1: \(errmsg)")
        }
        
        if sqlite3_bind_text(statement, 9, objProduct.picture2, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding picture2: \(errmsg)")
        }
        
        if sqlite3_bind_int(statement, 10, Int32(objProduct.subCategoryIDSubCategory)) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding subCategoryIDSubCategory: \(errmsg)")
        }
        
        if sqlite3_bind_text(statement, 11, objProduct.dateTimeRegister, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding dateTimeReg: \(errmsg)")
        }
        
        
        if sqlite3_bind_int(statement, 12, objProduct.ar ? 0 : 1) !=    SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding ar: \(errmsg)")
        }
        
        if sqlite3_bind_text(statement, 13, objProduct.pictureMap, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding pictMap: \(errmsg)")
        }
        
        
        if sqlite3_bind_int(statement, 14, Int32(objProduct.idSubCategory)) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding idSubCat: \(errmsg)")
        }
        
        if sqlite3_bind_text(statement, 15, objProduct.subCategoryName, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding subCatName: \(errmsg)")
        }
        
        if sqlite3_bind_int(statement, 16, Int32(objProduct.categoryIDCategory)) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding catIDCat: \(errmsg)")
        }
        
        if sqlite3_bind_int(statement, 17, Int32(objProduct.idCategory)) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding idCat: \(errmsg)")
        }
        
        if sqlite3_bind_text(statement, 18, objProduct.categoryName, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding catName: \(errmsg)")
        }
        

        if sqlite3_bind_text(statement, 19, objProduct.picture, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding picture: \(errmsg)")
        }
        

        
        if sqlite3_step(statement) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting table: \(errmsg)")
        }
        
        
        print("\n Etapa 1: Dados inseridos em Produtos: \(String(describing: objProduct.name)) e \(String(describing: objProduct.description))")

    }
    
    func s(teste: [Float]){
        
    }
    
    

    func saveObject(prod: [String: Any]) -> Product{
        
        var product: Product
        
        let idProduct: Int = prod["idProduct"] as? Int ?? 0
        let name: String = prod["Name"] as? String ?? "null"
        let description: String = prod["Description"] as? String ?? "null"
        let price: Double = prod["Price"] as? Double ?? 0
        let shortDescription: String = prod["ShortDescription"] as? String ?? "null"
        let stock: Int = prod["Stock"] as? Int ?? 0
        let featured: Bool = prod["featured"] as? Bool ?? false
        let weight: Double = prod["weight"] as? Double ?? 0
        let picture1: String = prod["picture1"] as? String ?? "null"
        let picture2: String = prod["picture2"] as? String ?? "null"
        let subCategoryIDSubCategory: Int = prod["subCategoryIDSubCategory"] as? Int ?? 0
        let dateTimeRegister: String = prod["dateTimeRegister"] as? String ?? "null"
        let ar: Bool = prod["ar"] as? Bool ?? false
        let pictureMap: String = prod["pictureMap"] as? String ?? "null"
        let idSubCategory: Int = prod["idSubCategory"] as? Int ?? 0
        let subCategoryName: String = prod["subCategoryName"] as? String ?? "null"
        let categoryIDCategory: Int = prod["categoryIDCategory"] as? Int ?? 0
        let categoryName: String = prod["categoryName"] as? String ?? "null"
        let picture: String = prod["picture"] as? String ?? "null"
        
        product = Product(idProduct: idProduct, name: name, description: description, price: price, shortDescription: shortDescription, stock: stock, featured: featured, weight: weight, picture1: picture1, picture2: picture2, subCategoryIDSubCategory: subCategoryIDSubCategory, dateTimeRegister: dateTimeRegister, ar: ar, pictureMap: pictureMap, idSubCategory: idSubCategory, subCategoryName: subCategoryName, categoryIDCategory: categoryIDCategory, idCategory: idSubCategory, categoryName: categoryName, picture: picture)
        
        
        print(" Etapa B >> Objeto produto criado")
        
        return product
        
    }
    
/*
    func teste(objPerson: Person) -> String{
        let t: String
        let r: String
        let obj = Person()
        //let objP = Product(name2: "teste")
        
        //let objPerson = Person()
        //let namePerson: String = objPerson.getName()
        print("Seu nome é \(objPerson.getName())")
        
        //print(
        /*
        for p in objPerson.getListNomes(){
            print("\n Nome \(p)")
        }*/
        
        
        
        t = ""
        r = "c"
        
        var n: Int
        n=1
        repeat{
            
            n=n+1
        }while n < 10
        
        
        let d: Int
        for d in (1...5).reversed() {
            print(d)
        }
        
        if (t == r) {
            
        }
        
        
        var v:Int
        v = 1
        while v < 10 {
            
            
            v-=1
        }
        
    
        
        
        var c: Int
        c = 3
        var list = [Int]()
        list.append(c)
        print(list[c])
        
        
        return t
        
        
        
        
    }*/
    
    
    func getDataSQLite() -> [Product]{
        

        var db: OpaquePointer?
        db = Connection.openConnection()
        var productsList = [Product]()
        
        
    
        

        //this is our select query
        //let queryString = "SELECT id, name, description, price, shortDescription, stock, featured, weight, picture1 FROM Product"
        let queryString = "SELECT id, name, description, price, shortDescription, stock, featured, weight, picture1, picture2, subCategoryIDSubCategory, dateTimeRegister, ar, pictureMap, idSubCategory, subCategoryName, categoryIDCategory, idCategory, categoryName, picture FROM Product"
        
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
            let name = String(cString: sqlite3_column_text(stmt, 1))
            let description = String(cString: sqlite3_column_text(stmt, 2))
            let price = Double(sqlite3_column_double(stmt, 3))
            let shortDescription = String(cString: sqlite3_column_text(stmt, 4))
            let stock = sqlite3_column_int(stmt, 5)
            let featured = sqlite3_column_int(stmt, 6)
            
            let weight = Double(sqlite3_column_double(stmt, 7))
            let picture1 = String(cString: sqlite3_column_text(stmt, 8))
            let picture2 = String(cString: sqlite3_column_text(stmt, 9))
            let subCategoryIDSubCategory = sqlite3_column_int(stmt, 10)
            let dateTimeRegister = String(cString: sqlite3_column_text(stmt, 11))
            let ar = sqlite3_column_int(stmt, 12)
            let pictureMap = String(cString: sqlite3_column_text(stmt, 13))
            let idSubCategory = sqlite3_column_int(stmt, 14)
            let subCategoryName = String(cString: sqlite3_column_text(stmt, 15))
            let categoryIDCategory  = sqlite3_column_int(stmt, 16)
            let idCategory = sqlite3_column_int(stmt, 17)
            let categoryName = String(cString: sqlite3_column_text(stmt, 18))
            let picture = String(cString: sqlite3_column_text(stmt, 19))
            
            
            productsList.append(Product(idProduct: Int(id), name: name, description: description, price: price, shortDescription: shortDescription, stock: Int(stock), featured: Bool(truncating: featured as NSNumber), weight: weight, picture1: picture1, picture2: picture2, subCategoryIDSubCategory: Int(subCategoryIDSubCategory), dateTimeRegister: dateTimeRegister, ar: Bool(truncating: ar as NSNumber), pictureMap: pictureMap, idSubCategory: Int(idSubCategory), subCategoryName: subCategoryName, categoryIDCategory: Int(categoryIDCategory), idCategory: Int(idCategory), categoryName: categoryName, picture: picture))
        
        }
        
        return productsList
            
            
        
        
    }


}

