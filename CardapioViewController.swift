//
//  CardapioViewController.swift
//  IFSPRAV4
//
//  Created by DC UFSCar on 19/06/19.
//  Copyright © 2019 DC UFSCar. All rights reserved.
//

import UIKit
import SQLite3

class CardapioViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var cardapioTableView: UITableView!
    

    private var touchedIndex: Int?
    var productList = [Product]()



    
    override func viewDidLoad() {
        super.viewDidLoad()

        readDataSQLite()
        print("Acessou o ReadData")
        
        cardapioTableView.delegate = self
        cardapioTableView.dataSource = self
        
        // Do any additional setup after loading the view.

    }
    

    func readDataSQLite() {
        
        let objProdDAO = ProductDAO()
        

        productList = objProdDAO.getDataSQLite()
        for obj in productList {
            print("\n")
            print(" Read data nome \(obj.name)")
            
            /*
            print(" Read data desc \(obj.description)")
            print(" Read data price \(obj.price)")
            print(" Read data shortDescription \(obj.shortDescription)")
            print(" Read data stock \(obj.stock)")
            print(" Read data featured \(obj.featured)")
            print(" Read data weight \(obj.weight)")
            print(" Read data p1 \(obj.picture1)")
            print(" Read data p2 \(obj.picture2)")
            print(" Read data subCategoryIDSubCategory \(obj.subCategoryIDSubCategory)")
            print(" Read data datetime \(obj.dateTimeRegister)")
            print(" Read data ar \(obj.ar)")
            print(" Read data pictMap \(obj.pictureMap)")
            print(" Read data idSubCat \(obj.idSubCategory)")
            print(" Read data subCatName \(obj.subCategoryName)")
            print(" Read data catIDCat \(obj.categoryIDCategory)")
            print(" Read data idCat \(obj.idCategory)")
            print(" Read data catName \(obj.categoryName)")
            print(" Read data picture \(obj.picture)")
            */
            
        }

    }
    
    
    
    @IBAction func btnAtualizar(_ sender: Any) {
        
        readDataSQLite()
        print("Atualizando table ...")
    }
    
    
    
    @IBAction func linkCarrinho(_ sender: Any) {
        
        //showCarrinho
        
         //dismiss(animated: true, completion: nil) //Volta a tela inicial
         self.performSegue(withIdentifier: "showCarrinho", sender: self)

        
    }
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell

        cell.nameLbl.text = productList[indexPath.row].name
        cell.precoLbl.text = String(format:"%0.2f", productList[indexPath.row].price)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.touchedIndex = indexPath.row
        
        self.performSegue(withIdentifier: "showCarrinho", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showCarrinho"){
            let controller: CarrinhoViewController = segue.destination as! CarrinhoViewController
            controller.selectedIndex = touchedIndex
            if touchedIndex != nil{
              controller.nameProd = productList[touchedIndex!].name
              controller.descriptionProd = productList[touchedIndex!].description
              controller.priceProd = productList[touchedIndex!].price
              controller.codProd = productList[touchedIndex!].idProduct
            }
        }
    }
    
    
    
    
    
    
    
    
    
 /*
    func readValues(){
        
        //first empty the list of heroes
        productsList.removeAll()
        
        //this is our select query
        //let queryString = "SELECT id, name, description, price, shortDescription, stock, featured, weight, picture1 FROM Product"
        let queryString = "SELECT id, name, description, price, shortDescription, stock, featured, weight, picture1, picture2, subCategoryIDSubCategory, dateTimeRegister, ar, pictureMap, idSubCategory, subCategoryName, categoryIDCategory, idCategory, categoryName, picture FROM Product"
        
        //statement pointer
        var stmt:OpaquePointer?
        
        //preparing the query
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
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
            
            
            
            
            
            //productListId.append(Int(id))
            //productsList.append(name + " " + description + " id:" + String(id))
            print(" Read data nome \(name)")
            print(" Read data desc \(description)")
            print(" Read data id \(id)")
            print(" Read data price \(price)")
            print(" Read data shortDescription \(shortDescription)")
            print(" Read data stock \(stock)")
            print(" Read data featured \(featured)")
            
            
            print(" Read data weight \(weight)")
            print(" Read data p1 \(picture1)")
            print(" Read data p2 \(picture2)")
            print(" Read data subCategoryIDSubCategory \(subCategoryIDSubCategory)")
            print(" Read data datetime \(dateTimeRegister)")
            print(" Read data ar \(ar)")
            print(" Read data pictMap \(pictureMap)")
            print(" Read data idSubCat \(idSubCategory)")
            print(" Read data subCatName \(subCategoryName)")
            print(" Read data catIDCat \(categoryIDCategory)")
            print(" Read data idCat \(idCategory)")
            print(" Read data catName \(categoryName)")
            print(" Read data picture \(picture)")
            
            
            
            
            
            print(" \n ")
            
            
            //self.tableViewData.reloadData()
            
            
            
            /*
             productsList.append(Product(idProduct: Int(id), name: name, welcomeDescription: description, price: priceP, shortDescription: "0", stock: 0, featured: false, weight: 0, picture1: "0", picture2: "0", subCategoryIDSubCategory: 0, dateTimeRegister: "0", ar: false, pictureMap: "0", idSubCategory: 0, subCategoryName: "0", categoryIDCategory: 0, idCategory: 0, categoryName: "0", picture: "0"))
             */
            
            //adding values to list
            //productsList.append()
        }
        
    }
 */
    
    

}
