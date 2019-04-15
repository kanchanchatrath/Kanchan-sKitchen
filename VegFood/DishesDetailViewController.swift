//
//  DishesDetailViewController.swift
//  VegFood
//
//  Created by Kanchan chatrath on 4/14/19.
//  Copyright © 2019 Kanchan chatrath. All rights reserved.
//

import UIKit

class DishesDetailViewController: UIViewController {

    @IBOutlet weak var dishName: UILabel!
    
    @IBOutlet weak var dishIngredients: UITextView!
    
    @IBOutlet weak var dishPrepartion: UITextView!
    
    var name = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        dishName.text = name
        // Do any additional setup after loading the view.
    }
    
    
    //    func createDish() {
    //
    //        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
    //            return
    //        }
    //        let managedContext = appDelegate.persistentContainer.viewContext
    //
    //        let recipeEntity = NSEntityDescription.entity(forEntityName: "Dishes", in: managedContext)!
    //
    //        let reciepeNames = ["Vegetables", "Curry", "Rice", "Cheese", "Naan", "Snacks", "Yogurt"]
    //
    //        for reciepp in reciepeNames {
    //            let reciepe = NSManagedObject(entity: recipeEntity, insertInto: managedContext)
    //            reciepe.setValue(reciepp, forKeyPath: "dishesName")
    //
    //
    //
    //            do {
    //                try managedContext.save()
    //                dishes.append(reciepe)
    //                //                dishesImage.append(reciepe)
    //            } catch let error as NSError {
    //                print("Could not save. \(error), \(error.userInfo)")
    //            }
    //        }
    //    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
