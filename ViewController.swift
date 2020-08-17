//
//  ViewController.swift
//  IFSPRAV4
//
//  Created by DC UFSCar on 19/06/19.
//  Copyright © 2019 DC UFSCar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lblLogin: UITextField!
    @IBOutlet weak var lblSenha: UITextField!
    
    @IBOutlet weak var lblMessage: UILabel!
    
    let urlAddressJson = "https://ecommercemult.tk/WebService/ProductList"
    let urlAddressJsonOrders = "https://ecommercemult.tk/WebService/OrderList"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProductDAO.creatingTableProduct() //Criando a tabela produtos no banco Ecommerce.sqlite
        CartDAO.creatingTableCart()
        OrderFinalizedDAO.creatingTableOrderFinalized()
        // Do any additional setup after loading the view.
        
     
        
        let objJson = JsonManager()
        objJson.getJsonArray(urlAddress: urlAddressJson) //Obtendo dados do json e armazenando no SQLite
        objJson.getJsonOrderFinalizedArray(urlAddress: urlAddressJsonOrders) //Obtendo dados do json e armazenando no SQLite
        
    }


    @IBAction func btnEnviar(_ sender: Any) {
        
        
        if(ClientDAO.authentication(Login: lblLogin.text!, Senha: lblSenha.text!)){
            lblMessage.text = "Acesso autorizado"
            self.performSegue(withIdentifier: "segueHome", sender: nil)
        }else{
            lblMessage.isHidden = false
            lblMessage.text = "Falha de acesso"
        }
        
        
        /*
        if (lblLogin.text == "juliano_z@yahoo.com.br" && lblSenha.text == "123"){
        self.performSegue(withIdentifier: "segueHome", sender: nil)
        }else{
            lblMessage.isHidden = false
            lblMessage.text = "Falha de acesso"
            
        }
 */

    }
}

