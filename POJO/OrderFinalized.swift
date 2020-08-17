//
//  OrderFinalized.swift
//  IFSPRAV4
//
//  Created by DC UFSCar on 03/07/19.
//  Copyright © 2019 DC UFSCar. All rights reserved.
//

import Foundation

class OrderFinalized{
    
    
    var id: Int = 0
    var valueTotal: Double = 0
    var client_idClients: Int = 0
    var dateTime: String = ""
    var zipCodeDelivery_idZipCodeDelivery: Int = 0
    var valueChange: Float = 0
    var payment_idPayment: Int = 0
    var statusOrdered: Int = 0
    var statusOrderLocal: Int = 0
    var note: String = ""
    var primaryKey: Int = 0
    var user: Client = Client()
    
    init(){
        
    }
    
    

    
    
    public func  getId()  -> Int {
        return self.id
    }
    
    public func setId(id: Int) {
        self.id = id
    }
    
    
    
    public func  getValueTotal()  -> Double {
        return self.valueTotal
    }
    
    public func setValueTotal(valueTotal: Double) {
        self.valueTotal = valueTotal
    }
    
    
    
    public func  getClient_idClients()  -> Int {
        return self.client_idClients
    }
    
    public func setClient_idClients(client_idClients: Int) {
        self.client_idClients = client_idClients
    }
    
    
    
    public func  getDateTime()  -> String {
        return self.dateTime
    }
    
    public func setDateTime(dateTime: String) {
        self.dateTime = dateTime
    }
    
    
    
    public func  getZipCodeDelivery_idZipCodeDelivery()  -> Int {
        return self.zipCodeDelivery_idZipCodeDelivery
    }
    
    public func setZipCodeDelivery_idZipCodeDelivery(zipCodeDelivery_idZipCodeDelivery: Int) {
        self.zipCodeDelivery_idZipCodeDelivery = zipCodeDelivery_idZipCodeDelivery
    }
    
    
    
    public func  getValueChange()  -> Float {
        return self.valueChange
    }
    
    public func setValueChange(valueChange: Float) {
        self.valueChange = valueChange
    }
    
    
    
    public func  getPayment_idPayment()  -> Int {
        return self.payment_idPayment
    }
    
    public func setPayment_idPayment(payment_idPayment: Int) {
        self.payment_idPayment = payment_idPayment
    }
    
    
    
    public func  getStatusOrdered()  -> Int {
        return self.statusOrdered
    }
    
    public func setStatusOrdered(statusOrdered: Int) {
        self.statusOrdered = statusOrdered
    }
    
    
    
    public func  getStatusOrderLocal()  -> Int {
        return self.statusOrderLocal
    }
    
    public func setStatusOrderLocal(statusOrderLocal: Int) {
        self.statusOrderLocal = statusOrderLocal
    }

    
    
    
    public func  getNote()  -> String {
        return self.note
    }
    
    public func setNote(note: String) {
        self.note = note
    }
    private var tableNumber: Int = 0
    
    
    public func  getTableNumber()  -> Int {
        return self.tableNumber
    }
    
    public func setTableNumber(tableNumber: Int) {
        self.tableNumber = tableNumber
    }
    private var checkout: Bool = true
    
    
    public func  getCheckout()  -> Bool {
        return self.checkout
    }
    
    public func setCheckout(checkout: Bool) {
        self.checkout = checkout
    }
    
    
    

    
    public func  getPrimaryKey()  -> Int {
        return self.primaryKey
    }
    
    public func setPrimaryKey(primaryKey: Int) {
        self.primaryKey = primaryKey
    }
    
    
    public func  getUser()  -> Client {
        return self.user
    }
    
    public func setUser(user: Client) {
        self.user = user
    }
    
    
    
    

    
    
 /*
     
     private int idOrderedFinalized;
     private double ValueTotal;
     private String DateTimeOrdered;
     private int StatusOrdered;
     private String Name;
     private String PaymentMethod;
     private int StatusOrderLocal;
     private String DateTimeOrdered2;
 
 
 */
    
    
}
