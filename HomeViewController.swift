//
//  HomeViewController.swift
//  IFSPRAV4
//
//  Created by DC UFSCar on 19/06/19.
//  Copyright © 2019 DC UFSCar. All rights reserved.
//

import UIKit
import SQLite3


class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var lblNome: UITextField!
    
    @IBOutlet weak var lblDescricao: UITextView!



    var productsList = [Product]()
    var db: OpaquePointer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarController?.selectedIndex = 1
        
        
        ////teste de programacao swift
        /*
        let objProdDao = ProductDAO()
        let objPerson = Person()
        objPerson.setName(name: "Juliano")
        
        var listNomes = [String]()
        listNomes.append("nome1")
        listNomes.append("nome2")
        objPerson.setListNomes(nomes: listNomes)
        
        let t: String = objProdDao.teste(objPerson: objPerson)
        ßprint(t)
        */
        print("acessado")
        //fim do teste
        

    }
    

 
    

}
