//
//  DetailViewController.swift
//  Misrecetas
//
//  Created by Jordi Carbonell on 1/3/18.
//  Copyright © 2018 Jordi Carbonell. All rights reserved.
//

import UIKit
//UITableViewDataSource

class DetailViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var recipeImageView: UIImageView!
    var recipe: Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.recipeImageView.image = self.recipe.image

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailRecipeCell", for: indexPath) as! RecipeDetailViewCell
        
        switch indexPath.row {
        case 0:
            cell.KeyLabel.text = "Nombre"
            cell.KeyValue.text = self.recipe.name
        case 1:
            cell.KeyLabel.text = "Tiempo"
            cell.KeyValue.text = "\(self.recipe.time!) min"
            
        case 2:
            cell.KeyLabel.text = "Favorito"
            
            if recipe.isFavorite{
                cell.KeyValue.text = "SI"
            }
            else{
                cell.KeyValue.text = "No"
            }
            
            
        default:
            break
        }
        
        return cell
        
        
    }
    

    

}
