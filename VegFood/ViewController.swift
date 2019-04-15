//
//  ViewController.swift
//  VegFood
//
//  Created by Kanchan chatrath on 4/14/19.
//  Copyright © 2019 Kanchan chatrath. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var dishes: [NSManagedObject]  = []
    
    let reciepeNames = ["Vegetables", "Curry", "Rice", "Cheese", "Naan", "Snacks", "Yogurt"]
    
    
    @IBOutlet weak var tableview: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createDish()
       
    }

    func createDish() {

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext

        let recipeEntity = NSEntityDescription.entity(forEntityName: "Dishes", in: managedContext)!

        let reciepeNames = ["Vegetables", "Curry", "Rice", "Cheese", "Naan", "Snacks", "Yogurt"]

        for reciepp in reciepeNames {
            let reciepe = NSManagedObject(entity: recipeEntity, insertInto: managedContext)
            reciepe.setValue(reciepp, forKeyPath: "dishesName")



            do {
                try managedContext.save()
                dishes.append(reciepe)
                //                dishesImage.append(reciepe)
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        //2
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Dishes")
        
        //3
        do {
            dishes = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    
}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return reciepeNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let allDishes = dishes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let label = cell.viewWithTag(1000) as! UILabel
        
        label.text = allDishes.value(forKey: "dishesName") as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let allDishes = dishes[indexPath.row]
        let vc = storyboard?.instantiateViewController(withIdentifier: "VegTableViewController") as? VegTableViewController
        vc?.name = allDishes.value(forKey: "dishesName") as! String
        self.navigationController?.pushViewController(vc!, animated: true)
    }


    
    
    

}

