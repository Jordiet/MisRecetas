//
//  Recipe.swift
//  Misrecetas
//
//  Created by Jordi Carbonell on 20/1/18.
//  Copyright © 2018 Jordi Carbonell. All rights reserved.
//
import Foundation
import UIKit

class Recipe: NSObject {
    
    var name : String!
    var image : UIImage!
    var time : Int!
    var ingredients : [String]!
    var steps : [String]!
    var isFavorite : Bool = false
    
    
    
    init(name:String, image:UIImage, time: Int, ingredients: [String], steps: [String]) {
        self.name = name
        self.image = image
        self.time = time
        self.ingredients = ingredients
        self.steps = steps
    }
    

}
