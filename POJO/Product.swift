//
//  Product.swift
//  IFSPRAV4
//
//  Created by DC UFSCar on 21/06/19.
//  Copyright © 2019 DC UFSCar. All rights reserved.
//

import Foundation



class Product{
    
    var idProduct: Int
    var name: String
    var description: String
    let price: Double
    let shortDescription: String
    let stock: Int
    let featured: Bool
    let weight: Double
    let picture1: String
    let picture2: String
    let subCategoryIDSubCategory: Int
    let dateTimeRegister: String
    let ar: Bool
    let pictureMap: String
    let idSubCategory: Int
    let subCategoryName: String
    let categoryIDCategory, idCategory: Int
    let categoryName: String
    
    var picture: String
    
    func setPicture(picture: String){
        self.picture = picture
    }
    
    func getPicture() -> String{
        return picture
    }
    
    
   
    
    
    init(idProduct: Int, name: String, description: String, price: Double, shortDescription: String, stock: Int, featured: Bool, weight: Double, picture1: String, picture2: String, subCategoryIDSubCategory: Int, dateTimeRegister: String, ar: Bool, pictureMap: String, idSubCategory: Int, subCategoryName: String, categoryIDCategory: Int, idCategory: Int, categoryName: String, picture: String) {
        self.idProduct = idProduct
        self.name = name
        self.description = description
        self.price = price
        self.shortDescription = shortDescription
        self.stock = stock
        self.featured = featured
        self.weight = weight
        self.picture1 = picture1
        self.picture2 = picture2
        self.subCategoryIDSubCategory = subCategoryIDSubCategory
        self.dateTimeRegister = dateTimeRegister
        self.ar = ar
        self.pictureMap = pictureMap
        self.idSubCategory = idSubCategory
        self.subCategoryName = subCategoryName
        self.categoryIDCategory = categoryIDCategory
        self.idCategory = idCategory
        self.categoryName = categoryName
        self.picture = picture
    }
    
    
}
