//
//  PedidosViewController.swift
//  IFSPRAV4
//
//  Created by DC UFSCar on 01/10/19.
//  Copyright © 2019 DC UFSCar. All rights reserved.
//

import UIKit

class PedidosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var pedidosTableView: UITableView!
    
    
    private var touchedIndex: Int?
    
    
    
    var orderFinalizedList = [OrderFinalized]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pedidosTableView.delegate = self
        pedidosTableView.dataSource = self

        // Do any additional setup after loading the view.
        readDataSQLite()
        print("Acessou o ReadData OrderFinalized")
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    func readDataSQLite() {
        
        let objOrderFDAO = OrderFinalizedDAO()
        
        
        orderFinalizedList = objOrderFDAO.getDataSQLite()
        for obj in orderFinalizedList {
            print("\n")
            print(" Read data nome \(obj.getUser().getName())")
            print(" Read data id \(obj.id)")
            print(" Read data value \(obj.valueTotal)")
        }
        
    }
    
    
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderFinalizedList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomPedidosTableViewCell", for: indexPath) as! CustomPedidosTableViewCell
        
        cell.nomeLbl.text = orderFinalizedList[indexPath.row].getUser().getName()
        cell.dataLbl.text = orderFinalizedList[indexPath.row].getDateTime()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.touchedIndex = indexPath.row
        
        //self.performSegue(withIdentifier: "showDetail", sender: self)
    }
    

    
    

}
