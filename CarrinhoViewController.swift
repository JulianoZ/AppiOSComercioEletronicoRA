//
//  CarrinhoViewController.swift
//  IFSPRAV4
//
//  Created by DC UFSCar on 24/06/19.
//  Copyright © 2019 DC UFSCar. All rights reserved.
//

import UIKit

class CarrinhoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,  UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    @IBOutlet weak var numMesaPickerView: UIPickerView!
    
 
    
    @IBOutlet weak var fechamentoView: UIView!
    
    
    @IBOutlet weak var nomeLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var precoLbl: UILabel!
    @IBOutlet weak var codLbl: UILabel!
    
    
    
    @IBOutlet weak var cartTableView: UITableView!
    
    var selectedIndex: Int?
    var nameProd: String?
    var codProd: Int?
    var priceProd: Double?
    var descriptionProd : String?
    
    
    var cartList = [Cart]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        

       if codProd != nil {
         printScreen()        //imprime os dados dos produtos na tela
         saveCart()           //Salva os dados no carrinho
       }
        
        readDataSQLiteCart()  //Carrega os dados do banco e salva na lista. Mostra os dados da tabela cart na tela
        
        cartTableView.delegate = self
        cartTableView.dataSource = self
        
        
        numMesaPickerView.delegate = self
        numMesaPickerView.dataSource = self
 
    }
    
    
    func printScreen(){
        nomeLbl.text = nameProd
        if (priceProd != nil){
            precoLbl.text = String(format:"%0.2f", priceProd!)
        }
    }
    
    func saveCart(){
        let idCart = 0
        let idProd: Int = codProd!
        let quant: Int = 1
        
        var cart: Cart
        cart = Cart(idCart: idCart, codProd: idProd, quant: quant, dateTime: getDateTime(), bought: 0, idFinalized: 0)
        let cartDAO = CartDAO()
        cartDAO.saveDataSQLite(objCart: cart)
     }
    
    
    func readDataSQLiteCart() {
        
        let objCartDAO = CartDAO()
        
        cartList = objCartDAO.getDataSQLite()
        for obj in cartList{
            print("\n")
            print(" Read data idCart \(obj.idCart)")
            print(" Read data idProd \(obj.codProd)")
            print(" Read data quant \(obj.quant)")
            print(" Read data dateTime \(obj.dateTime)")
            
        }
  
    }
    
    
    func getDateTime() -> String{
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let formattedDate = format.string(from: date)
        return formattedDate
        
    }
    

    @IBAction func contComprandoBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "showCardapio", sender: self)
    }
    
    
    

    
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCartTableViewCell", for: indexPath) as! CustomCartTableViewCell
        
        if (cartList[indexPath.row].bought == 0) {
            cell.nameLbl.text = getDataProduct(idProd: indexPath.row)
        }
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let idCart = cartList[indexPath.row].idCart
        let objCartDAO = CartDAO()
        objCartDAO.deleteData(idCart: idCart)
        refresh()
        
        
        
        
        //self.performSegue(withIdentifier: "showCarrinho", sender: self)
    }
    
    
    
    func refresh(){
        readDataSQLiteCart()
        print("refreshed")
        self.cartTableView.reloadData()

    }
    

    
    func getDataProduct(idProd: Int) -> String{
        let objProdDAO = ProductDAO()
        let productList = objProdDAO.getDataSQLite()
        var nome: String = ""

        for objP in productList{
            var objProduct: Product
            objProduct = objP
            if objProduct.idProduct == cartList[idProd].codProd{
                nome = objProduct.name

            }
        }
        return nome
    }
    
    

    
    
    func getIdCart(idProd: Int) -> Int{
        let idCart: Int = 0

        return idCart
    }
    
    
    
    @IBAction func delItem(_ sender: UIButton) {
        
        var superview = sender.superview
        while let view = superview, !(view is CustomCartTableViewCell) {
            superview = view.superview
        }
        guard let cell = superview as? UITableViewCell else {
            print("button is not contained in a table view cell")
            return
        }
        guard let indexPath = cartTableView.indexPath(for: cell) else {
            print("failed to get index path for cell containing button")
            return
        }
        // We've got the index path for the cell that contains the button, now do something with it.
        print("button is in row \(indexPath.row)")
        
        
        let idCart = cartList[indexPath.row].idCart
        let objCartDAO = CartDAO()
        objCartDAO.deleteData(idCart: idCart)
        refresh()
        
        
        
    }
    
    
    

    
    
    
    let pickerViewData = ["1","2","3","4","5","6","7","8","9","10"]
    
    //Funções do pickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewData.count
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        

    }
    
    
    
    @IBAction func finalizaCompraBtn(_ sender: Any) {
        fechamentoView.layer.zPosition = 2
        self.fechamentoView.bringSubviewToFront(fechamentoView)
        
        numMesaPickerView.layer.zPosition = 1
        self.numMesaPickerView.bringSubviewToFront(numMesaPickerView)
        
        fechamentoView.isHidden = false
    }
    
    

    @IBAction func enviarPedido(_ sender: Any) {
        
        
        let selectedRow = self.numMesaPickerView.selectedRow(inComponent: 0)
        let desiredValue = pickerViewData[selectedRow]
        
        
        
        
        self.performSegue(withIdentifier: "showFechamento", sender: self)
  
        
    }
    


}
