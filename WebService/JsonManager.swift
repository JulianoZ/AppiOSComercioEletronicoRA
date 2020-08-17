//
//  JsonManager.swift
//  IFSPRAV4
//
//  Created by DC UFSCar on 21/06/19.
//  Copyright © 2019 DC UFSCar. All rights reserved.
//

import Foundation



class JsonManager{
    
    
    //https://medium.com/@nimjea/json-parsing-in-swift-2498099b78f
    //Json
    func getJsonArray(urlAddress : String) {
        //guard let url = URL(string: ”https://jsonplaceholder.typicode.com/todos") else {return}
        guard let url = URL(string: urlAddress) else
        {
            print("Url conversion issue.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: [])
                //print(jsonResponse) //Response result
                
                
                //Manipular itens do Json. Converter o Json no array jsonArray
                guard let jsonArray = jsonResponse as? [[String: Any]] else {
                    return
                }
                //print(jsonArray)
                
                
                //Salvando objetos no sqlite
                for productIndividual in jsonArray{
                    let objProductDAO = ProductDAO()
                    let product: Product = objProductDAO.saveObject(prod: productIndividual)
                    let objProdDAO = ProductDAO()
                    objProdDAO.saveDataSQLite(objProduct: product)
                    
                    
                    print(" Saida objeto 1 \(product.name)") //Output
                    print(" Saida objeto 2 \(product.idProduct)") //Output
                    //print(" Retorno método saveDataSQLite \(msgReturn)") //Output
                    
                }
                
                
                
                
                
                
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
        print(" Etapa A >> Json obtido")
    }
    
    
    
    
   
    func getJsonOrderFinalizedArray(urlAddress : String) {
        //guard let url = URL(string: ”https://jsonplaceholder.typicode.com/todos") else {return}
        guard let url = URL(string: urlAddress) else
        {
            print("Url conversion issue.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: [])
                //print(jsonResponse) //Response result
                
                
                //Manipular itens do Json. Converter o Json no array jsonArray
                guard let jsonArray = jsonResponse as? [[String: Any]] else {
                    return
                }
                //print(jsonArray)
                
                
                //Salvando objetos no sqlite
                
                for orderIndividual in jsonArray{
                    let objOrderFinalizedDAO = OrderFinalizedDAO()
                    let orderFinalized: OrderFinalized = objOrderFinalizedDAO.saveObject(orderF: orderIndividual)
                    
                    objOrderFinalizedDAO.saveDataSQLite(objOrderFinalized: orderFinalized)
                    
                    //orderF["idOrderedFinalized"]
                    //print("orderIndividual \(orderIndividual)")
                    //print(" Saida objeto Order 1 \(String(describing: orderIndividual["idOrderedFinalized"])) ") //Output
                    //print(" Saida objeto Order 1 \(String(describing: orderIndividual["DateTimeOrdered2"])) ") //Output
         
                    //print(" Retorno método saveDataSQLite \(msgReturn)") //Output
                    
                }
                
                
                
                
                
                
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
        print(" Etapa B >> Json Order Finalized obtido")
    }
    
    
}
