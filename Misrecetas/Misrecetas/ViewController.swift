//
//  ViewController.swift
//  Misrecetas
//
//  Created by Jordi Carbonell on 17/1/18.
//  Copyright © 2018 Jordi Carbonell. All rights reserved.
// este es el primer proyecto que he subido a GITHUB
//

import UIKit

class ViewController: UITableViewController {
    
    var recipes : [Recipe] = []

    override func viewDidLoad() {
       super.viewDidLoad()
        var recipe = Recipe(name:"Tortilla de patatas",
                            image: #imageLiteral(resourceName: "tortilla"),
                            time: 20,
                            ingredients: ["Patatas", "Huevos", "Cebollas"],
                            steps: ["Pelar las patatas y la cebolla",
                                    "Sofreir todos los ingredientes",
                                    "Batir los huevos y durante 2 minutos mantener en la sartén"]
        )
        
        recipes.append(recipe)
        
        //print(recipe.name)
        
        recipe = Recipe(name:"Pizza margarita",
                        image:#imageLiteral(resourceName: "pizza"),
                        time: 40,
                        ingredients: ["Harina", "Tomate", "Queso", "Champiñones"],
                        steps: ["Preparar la harina",
                                "Colocar tomate, queso y champiñones sobre la masa",
                                "Hornear 10 minutos"]
        )
        
        recipes.append(recipe)
        recipe = Recipe(name:"Hamburguesa",
                        image: #imageLiteral(resourceName: "hamburguesa"),
                        time: 15,
                        ingredients: ["Carne vacuno", "lechuga", "Pan de molde"],
                        steps: ["Poner la carne a la plancha",
                                "Colocar la carne y la lechuga en el pan de molde"]
            
            )
        
        recipes.append(recipe)
        recipe = Recipe(name:"Ensalada Cesar",
                        image:#imageLiteral(resourceName: "ensalada"),
                        time: 5,
                        ingredients: ["tomate", "canónigos", "salsa cesar"],
                        steps: ["Enplatar todos los ingredientes"]
        )
        
        recipes.append(recipe)
        
        
     
        
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print(recipes.count)
        return self.recipes.count
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellId = "RecipeCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RecipeCell
        /*cell.textLabel?.text = recipe.name
        cell.imageView?.image = recipe.image*/
        cell.imagenReceta.image = recipe.image
        cell.nameLabel.text = recipe.name
        cell.timeLabel.text = "Tiempo :  \(String(recipe.time ))" + " minutos"
        cell.ingredientesLabel.text = "Ingredientes : \(recipe.ingredients.count)" + " ingredientes"
        cell.imagenReceta.layer.cornerRadius = 35
        cell.imagenReceta.clipsToBounds = true
        
        
        if recipe.isFavorite{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        
        
        
        return cell
        
        
        
    }
    
    override func tableView( _: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt IndexPath: IndexPath){
        
        if editingStyle == .delete {
            self.recipes.remove(at: IndexPath.row)
            //self.tableView.reloadData()
            self.tableView.deleteRows(at: [IndexPath], with: .fade)
            
        }
    }
    
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //Accion de compartir
        let shareAction = UITableViewRowAction(style: .default, title: "Compartir") { (action, indexPath) in
            
            let shareDefaulText = "Estoy mirando la receta de \(self.recipes[indexPath.row].name) del curso de IOS"
            let ActivityController = UIActivityViewController(activityItems: [shareDefaulText], applicationActivities: nil)
            self.present(ActivityController, animated: true, completion: nil)
            
            //shareAction.backgroundColor = UIColor (red: 30.0/255.0, green: 160.0/255.0, blue: 254.0/255.0, alpha: 1.0)
            
        }
        //Borrar
        let deleteAction = UITableViewRowAction(style: .default, title: "Borrar") { (action, indexPath) in
            
            self.recipes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
        
        
        
        return[shareAction,deleteAction]
        
    }
    
    
    // MARK: _ UITABLEVIEDELEGATE
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print ("Has seleccionado esta fila: \(indexPath.row)" )
        /*let recipe = self.recipes[indexPath.row]
        
        let alertController = UIAlertController(title: recipe.name, message: "Valora este plato", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
        
        var favoriteActionTitle = "favorito"
        if recipe.isFavorite{
            favoriteActionTitle = "No favorito"
        }
        
        let favoriteAction = UIAlertAction(title: favoriteActionTitle, style: .default) { (action) in
            let recipe = self.recipes[indexPath.row]
            recipe.isFavorite = !recipe.isFavorite
            self.tableView.reloadData()
            
        }
        alertController.addAction(favoriteAction)
    */
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeDetail"{
            if let indexPath = self.tableView.indexPathForSelectedRow{
                let selectedRecipe = self.recipes[indexPath.row]
                let destinationViewController = segue.destination as! DetailViewController
                destinationViewController.recipe = selectedRecipe
            }
        }
        
    }
    
    
    /*
    override func prefersStatusBarhidden()-> Bool{
        return true
    }
    */
}

