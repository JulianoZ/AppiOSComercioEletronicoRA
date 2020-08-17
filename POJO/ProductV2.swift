//
//  ProductV2.swift
//  IFSPRAV4
//
//  Created by DC UFSCar on 09/09/19.
//  Copyright © 2019 DC UFSCar. All rights reserved.
//

import Foundation

class ProductV2{
    
    init(){}
    
    var idProduct: Int = 0
    
    public func setidProduct(name: Int){
        self.idProduct = name
    }
    
    func getidProduct() -> Int{
        return self.idProduct
    }

    var name: String = ""
    
    public func setName(name: String){
        self.name = name
    }
    
    func getName() -> String{
        return self.name
    }

    private var id: Int = 0
    
    public func  getId()  -> Int {
        return self.id
    }
    
    public func setId(id: Int) {
        self.id = id
    }

    private var description: String = ""
    
    public func  getDescription()  -> String {
        return self.description
    }
    
    public func setDescription(description: String) {
        self.description = description
    }
    private var shortDescription: String = ""
    
    public func  getShortDescription()  -> String {
        return self.shortDescription
    }
    
    public func setShortDescription(shortDescription: String) {
        self.shortDescription = shortDescription
    }
    private var price: Float = 0
    
    public func  getPrice()  -> Float {
        return self.price
    }
    
    public func setPrice(price: Float) {
        self.price = price
    }
    private var peso: Float = 0
    
    public func  getPeso()  -> Float {
        return self.peso
    }
    
    public func setPeso(peso: Float) {
        self.peso = peso
    }
    private var stock: Int = 0
    
    public func  getStock()  -> Int {
        return self.stock
    }
    
    public func setStock(stock: Int) {
        self.stock = stock
    }
    private var Featured: Bool = true
    
    public func  getFeatured()  -> Bool {
        return self.Featured
    }
    
    public func setFeatured(Featured: Bool) {
        self.Featured = Featured
    }
    private var Weight: Float = 0
    
    public func  getWeight()  -> Float {
        return self.Weight
    }
    
    public func setWeight(Weight: Float) {
        self.Weight = Weight
    }
    
    private var Picture1: String = ""
    
    public func  getPicture1()  -> String {
        return self.Picture1
    }
    
    public func setPicture1(Picture1: String) {
        self.Picture1 = Picture1
    }
    private var Picture2: String = ""
    
    
    public func  getPicture2()  -> String {
        return self.Picture2
    }
    
    public func setPicture2(Picture2: String) {
        self.Picture2 = Picture2
    }
    private var SubCategory_idSubCategory: Int = 0
    
    
    public func  getSubCategory_idSubCategory()  -> Int {
        return self.SubCategory_idSubCategory
    }
    
    public func setSubCategory_idSubCategory(SubCategory_idSubCategory: Int) {
        self.SubCategory_idSubCategory = SubCategory_idSubCategory
    }
    private var DateTimeRegister: String = ""
    
    
    public func  getDateTimeRegister()  -> String {
        return self.DateTimeRegister
    }
    
    public func setDateTimeRegister(DateTimeRegister: String) {
        self.DateTimeRegister = DateTimeRegister
    }
    private var AR: Bool = true
    
    
    public func  getAR()  -> Bool {
        return self.AR
    }
    
    public func setAR(AR: Bool) {
        self.AR = AR
    }
    private var PictureMap: String = ""
    
    
    public func  getPictureMap()  -> String {
        return self.PictureMap
    }
    
    public func setPictureMap(PictureMap: String) {
        self.PictureMap = PictureMap
    }
    
    
    /*
    private var order: Person = Person()
    
    
    public func  getOrder()  -> Person {
        return self.order
    }
    
    public func setOrder(order: Person) {
        self.order = order
    }
     
     /*
     var description: String
     let price: Double
     let shortDescription: String
     */
     
     */

}
