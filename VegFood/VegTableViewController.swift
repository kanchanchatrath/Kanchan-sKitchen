//
//  VegTableViewController.swift
//  VegFood
//
//  Created by Kanchan chatrath on 4/14/19.
//  Copyright © 2019 Kanchan chatrath. All rights reserved.
//

import UIKit
import CoreData

class VegTableViewController: UIViewController {
    
    

    @IBOutlet weak var vegTableView: UITableView!
    
    
    var dishes: [NSManagedObject]  = []
    var name = ""
    
    let vegetableReciepeNames = ["Jeera_Aloo", "Beans_Aloo", "Cabbage_potatoes", "Capsicum_Potato", "Carrots_Peas", "Cauliflower_peas_Potatoes", "cauloflower_curry", "Cheese_Peas_Curry", "Fenugreek_Aloo", "Fry_masala_Okra", "Green_Beans", "Okra_onion", "Okra_Stuffed", "Peas_Carrot_Cheese"]
    let curryReciepeNames = ["Dal_Mkhni", "Masala_Soya", "Rajma_Curry", "White_chana_Chickpeas"]
    let riceReciepeNames = ["Jeera_Rice", "Veg_Pulao"]
    let cheeseReciepeNames = ["Masala_Paneer", "Paneer_Bhurji"]
    let naanReciepeNames = ["Aloo_Paratha", "Cauliflower_Paratha", "Roti"]
    let snacksReciepeNames = ["Bread_Roll", "Masala_Papad_Papadum", "Veg_Samosa"]
    let yogurtReciepeNames = ["Boondi_Raita", "Veg_Raita"]
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDish()

        // Do any additional setup after loading the view.
    }
    
    func createDish() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let vegrecipeEntity = NSEntityDescription.entity(forEntityName: "Vegetables", in: managedContext)!

        let vegetableReciepeNames = ["Jeera_Aloo", "Beans_Aloo", "Cabbage_potatoes", "Capsicum_Potato", "Carrots_Peas", "Cauliflower_peas_Potatoes", "cauloflower_curry", "Cheese_Peas_Curry", "Fenugreek_Aloo", "Fry_masala_Okra", "Green_Beans", "Okra_onion", "Okra_Stuffed", "Peas_Carrot_Cheese"]
        
        let  vegIngredients = ["5-6 Boiled potatoes, 1/4 cumin seeds, 1 tablespoon oil, Salt, 1/4 spoon cumin seed powder, 1/4 spoon coriander powder 1 chopped green chili (salt and green chili you can add as per your taste.)", "Diced potatoes 7-8, chopped beans 250 g,1 chopped onion, 2 table spoon Oil, 1/2 spoon cumin seed, 1/2 spoon cumin seed powder 1 chopped green chili, 1/2 spoon ginger and garlic paste, 1 table spoon fresh coriander, 1/4 spoon turmeric powder, salt & red chili you can add as per your taste.", "diced green cabbage, diced potatoes, 1 chopped onion, 1 chopped tomato, 2 table spoon Oil, 1/2 spoon cumin seed, cumin seed powder and coriander powder, 1 chopped green chili, 1/2 spoon ginger and garlic paste, 1 table spoon fresh coriander leaves, 1/4 spoon turmeric powder, salt & red chili you can add as per your taste.", "2 diced green capsicum, 4 diced potatoes, 1 chopped onion, 1 chopped tomato, 2 table spoon Oil, 1/2 spoon cumin seed, 1/2 spoon cumin seed powder, ½ spoon coriander powder, 1 chopped green chili, 1/2 spoon ginger and garlic paste, 1 table spoon fresh coriander leaves, 1/4 spoon turmeric powder, salt & red chili you can add as per your taste.", "Small bowl of frozen or fresh peas, 7-8 sliced carrots in small pieces, 1 chopped onion, 1 chopped tomato, 2 table spoon Oil, 1/2 spoon cumin seed, 1/2 spoon cumin seed powder, 1 chopped green chili, 1/2 spoon ginger and garlic paste, 1 table spoon fresh coriander, 1/4 spoon turmeric powder, salt & red chili you can add as per your taste.", "cut cauliflower first in small pieces, frozen or fresh peas, diced potatoes, 1 chopped onion, 1 chopped tomato, 2 table spoon Oil, 1/2 spoon cumin seed, cumin seed powder and coriander powder, 1 chopped green chili, 1/2 spoon ginger and garlic paste, 1 table spoon fresh coriander leaves, 1/4 spoon turmeric powder, salt & red chili you can add as per your taste.", "cut cauliflower first in small pieces, frozen or fresh peas, diced potatoes, 2 glass of water, 1 chopped onion, 1 chopped tomato, 2 table spoon Oil, 1/2 spoon cumin seed, cumin seed powder and coriander powder, 1 chopped green chili, 1/2 spoon ginger and garlic paste, 1 table spoon fresh coriander leaves, 1/4 spoon turmeric powder, salt & red chili you can add as per your taste.", "2 small bowl of frozen or fresh peas, and 200 g cheese you can use tofu(paneer) cut in diced , 1 chopped onion, 1 chopped tomato, 1/2 liter water, 2 table spoon Oil, 1/2 spoon cumin seed, 1/2 spoon cumin seed powder, 1 chopped green chili, 1/2 spoon ginger and garlic paste, 1 table spoon fresh coriander, 1/4 spoon turmeric powder, salt & red chili you can add as per your taste.", "4-5 diced potatoes, 2 cups chopped fenugreek leaves ,4 table spoon Oil, 1/2 spoon cumin seed, 1/2 spoon cumin seed powder, 1/2 spoon cumin seed, 1/2 spoon cumin seed powder, 1 chopped green chili, 1/2 spoon ginger and garlic paste, 1 table spoon fresh coriander, 1/4 spoon turmeric powder, salt & red chili you can add as per your taste.", "Make a cut between of okra cut in two pieces each, 1 chopped onion, 1 chopped tomato, 2 table spoon Oil, 1/2 spoon cumin seed, 1/2 spoon cumin seed powder, 1 chopped green chili, 1/2 spoon ginger and garlic paste, 1 table spoon fresh coriander, 1/4 spoon turmeric powder, salt & red chili you can add as per your taste.", "Chopped beans 250 g,1 chopped onion, 2 table spoon Oil, 1/2 spoon cumin seed, 1/2 spoon cumin seed powder, 1 chopped green chili, 1/2 spoon ginger and garlic paste, 1 table spoon fresh coriander, 1/4 spoon turmeric powder, salt & red chili you can add as per your taste.", "chopped okra, 1 chopped onion, 1 chopped tomato, 1/2 liter water, 2 table spoon Oil, 1/2 spoon cumin seed, 1/2 spoon cumin seed powder, 1 chopped green chili, 1/2 spoon ginger and garlic paste, 1 table spoon fresh coriander, 1/4 spoon turmeric powder, salt & red chili you can add as per your taste.", "first washed and dry okra and make a long cut in between, 1 chopped onion, 1 chopped tomato, 2 table spoon Oil, 1/2 spoon cumin seed, 1/2 spoon cumin seed powder, 1 spoon coriander powder, ½ spoon dried mango powder, ½ gram masala, 1 chopped green chili, 1/2 spoon ginger and garlic paste, 1 table spoon fresh coriander, 1/4 spoon turmeric powder, salt & red chili you can add as per your taste", "Small bowl of frozen or fresh peas, 2-3 sliced carrots and 100 g cheese can use tofu(paneer) in diced shapes, 1 chopped onion, 1 chopped tomato, 1/2 liter water, 2 table spoon Oil, 1/2 spoon cumin seed, 1/2 spoon cumin seed powder, 1 chopped green chili, 1/2 spoon ginger and garlic paste, 1 table spoon fresh coriander, 1/4 spoon turmeric powder, salt & red chili you can add as per your taste."]
        
        let vegPreparation = ["Cut boil potatoes in diced shape. Take a pan, put oil inside pan and heat it should be on medium flame after 1 minute add cumin seed, salt, coriander powder, green chili in pan. Cook all spices first for 1 minute then add diced potato in it and cook for 3-4 minutes. Your recipe is ready to serve now better serve hot. You can add green coriander leaves for garnishing.","Take a pan, put oil inside pan and heat it should be on medium flame after 1 minute add cumin seed, ginger and garlic paste cook for 1 minute then add onion paste and cook till brown color, now you can add all spices in this which I mentioned above and stir-fry till fat separates, cook it under medium flame, cook for at least 4-5 minutes then add diced potatoes and green beans to the pan (pan should be cover with lid) then cook for 15-16 minutes over low heat till glossy. Your recipe is ready to serve now better serve hot. You can add green coriander leaves for garnishing.","Take a pan, put oil inside pan and heat it should be on medium flame after 1 minute add cumin seed, ginger and garlic paste cook for 1 minute then add onion paste and cook till brown color then add tomato in this now you can add all spices in this which I mentioned above and stir-fry till fat separates, cook it under medium flame, cook for at least 4-5 minutes then add cabbage and potatoes in this and mix it well, then cook for 15-16 minutes over low heat till glossy. Your recipe is ready to serve now better serve hot. You can add green coriander leaves for garnishing.","Take a pan, put oil inside pan and heat it should be on medium flame after 1 minute add cumin seed, ginger and garlic paste cook for 1 minute then add onion paste and cook till brown color, now you can add all spices in this which I mentioned above and stir-fry till fat separates, cook it under medium flame, now add tomatoes and cook for around 3 minutes until soft and mushy. Then add capsicum and potatoes in the pan (pan should be cover with lid) then cook for 10-12 minutes over low heat till glossy. Your recipe is ready to serve now better serve hot. You can add green coriander leaves for garnishing.","Take a pan, put oil inside pan and heat it should be on medium flame after 1 minute add cumin seed, ginger and garlic paste cook for 1 minute then add onion paste and cook till brown color then add tomato in this now you can add all spices in this which I mentioned above and stir-fry till fat separates, cook it under medium flame, cook for at least 4-5 minutes then add carrots and peas in this, then cook for 15-16 minutes over low heat till glossy. Your recipe is ready to serve now better serve hot. You can add green coriander leaves for garnishing.","Take a pan, put oil inside pan and heat it should be on medium flame after 1 minute add cumin seed, ginger and garlic paste cook for 1 minute then add onion paste and cook till brown color then add tomato in this now you can add all spices in this which I mentioned above and stir-fry till fat separates, cook it under medium flame, cook for at least 4-5 minutes then add cauliflower, peas and potatoes in this and mix it well, then cook for 15-16 minutes over low heat till glossy. Your recipe is ready to serve now better serve hot. You can add green coriander leaves for garnishing.","Take a pan, put oil inside pan and heat it should be on medium flame after 1 minute add cumin seed, ginger and garlic paste cook for 1 minute then add onion paste and cook till brown color then add tomato in this now you can add all spices in this which I mentioned above and stir-fry till fat separates, cook it under medium flame, cook for at least 4-5 minutes then add cauliflower and water in this and mix it well, then cook for 15-16 minutes over low heat till glossy. Your recipe is ready to serve now better serve hot. You can add green coriander leaves for garnishing.","Take a pan, put oil inside pan and heat it should be on medium flame after 1 minute add cumin seed, ginger and garlic paste cook for 1 minute then add onion paste and cook till brown color then add tomato in this now you can add all spices in this which I mentioned above and stir-fry till fat separates, cook it under medium flame, cook for at least 4-5 minutes then peas and cheese in this and add water in it mix it (water quantity depend on curry thickness) and then cook for 15-16 minutes over high heat till glossy. Your recipe is ready to serve now better serve hot. You can add green coriander leaves for garnishing.","Initially, chopped fenugreek leaves then washed and darned it at least 2-3 times. Take a pan, put oil inside pan and heat it should be on medium flame after 1 minute add cumin seed, ginger and garlic paste cook for 1 minute then add all spices as mentioned above then cook for 30 seconds. Now add potato and fenugreek leaves in it and cook for 12- 15 minutes. Your recipe is ready to serve now better serve hot. You can add green coriander leaves for garnishing.","Take a pan, put oil inside pan and heat it should be on medium flame then deep fry okra first on medium flame. After this take a pan, put oil inside pan and heat it 1 minute add cumin seed, ginger and garlic paste cook for 1 minute then add onion paste and cook till brown color, now you can add all spices in this which I mentioned above and stir-fry till fat separates, cook it under medium flame, now add tomatoes and cook for around 3 minutes until soft and mushy. Then add okra to the pan (pan should be cover with lid) and mix well then cook for 10-12 minutes over low heat till glossy. Your recipe is ready to serve now better serve hot. You can add green coriander leaves for garnishing.","Take a pan, put oil inside pan and heat it should be on medium flame after 1 minute add cumin seed, ginger and garlic paste cook for 1 minute then add onion paste and cook till brown color, now you can add all spices in this which I mentioned above and stir-fry till fat separates, cook it under medium flame, cook for at least 4-5 minutes then add green beans to the pan (pan should be cover with lid) then cook for 15-16 minutes over low heat till glossy. Your recipe is ready to serve now better serve hot. You can add green coriander leaves for garnishing.","Take a pan, put oil inside pan and heat it should be on medium flame after 1 minute add cumin seed, ginger and garlic paste cook for 1 minute then add onion paste and cook till brown color, now you can add all spices in this which I mentioned above and stir-fry till fat separates, cook it under medium flame, now add tomatoes and cook for around 3 minutes until soft and mushy. Then add okra to the pan (pan should be cover with lid) and mix well then cook for 10-12 minutes over low heat till glossy. Your recipe is ready to serve now better serve hot. You can add green coriander leaves for garnishing.","Mix well your all spices like coriander powder, gram masala, dried mango powder, red chili, turmeric powder, salt and chopped onion in a bowl. Fill each bhindi with this filled spice. Now take a pan, put oil inside pan and heat it should be on medium flame after 1 minute add cumin seed, ginger and garlic paste cook for 1 minute then add tomatoes paste and cook it , now you add your filled bhindi and stir-fry till fat separates, cook it under medium flame until soft and mushy bhindi. Your recipe is ready to serve now better serve hot. You can add green coriander leaves for garnishing.","Prepare with your vegetables first such as diced carrots, frozen peas and diced chesses. Take a pan, put oil inside pan and heat it should be on medium flame after 1 minute add cumin seed, ginger and garlic paste cook for 1 minute then add onion paste and cook till brown color then add tomato in this now you can add all spices in this which I mentioned above and stir-fry till fat separates, cook it under medium flame, cook for at least 4-5 minutes then add carrots, peas and cheese in this and add water in it mix it (water quantity depend on curry thickness) and then cook for 15-16 minutes over high heat till glossy. Your recipe is ready to serve now better serve hot. You can add green coriander leaves for garnishing."]


        for reciepp in vegetableReciepeNames {
            let reciepe = NSManagedObject(entity: vegrecipeEntity, insertInto: managedContext)
            reciepe.setValue(reciepp, forKeyPath: "recipes")



            do {
                try managedContext.save()
                dishes.append(reciepe)
                //                dishesImage.append(reciepe)
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }

        for reciepp in  vegIngredients{
            let reciepe = NSManagedObject(entity: vegrecipeEntity, insertInto: managedContext)
            reciepe.setValue(reciepp, forKeyPath: "ingredients")

            do {
                try managedContext.save()
                dishes.append(reciepe)
                //                dishesImage.append(reciepe)
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }

            for reciepp in vegPreparation {
                let reciepe = NSManagedObject(entity: vegrecipeEntity, insertInto: managedContext)
           reciepe.setValue(reciepp, forKeyPath: "preparation")

                do {
                    try managedContext.save()
                    dishes.append(reciepe)
                    //                dishesImage.append(reciepe)
                } catch let error as NSError {
                    print("Could not save. \(error), \(error.userInfo)")
                }

        }
        
        //...............Curry....................
//
                let curryrecipeEntity = NSEntityDescription.entity(forEntityName: "Curry", in: managedContext)!

                 let curryReciepeNames = ["Dal_Mkhni", "Masala_Soya", "Rajma_Curry", "White_chana_Chickpeas"]

                for reciepp in curryReciepeNames {
                    let reciepe = NSManagedObject(entity: curryrecipeEntity, insertInto: managedContext)
                    reciepe.setValue(reciepp, forKeyPath: "recipes")



                    do {
                        try managedContext.save()
                        dishes.append(reciepe)
                        //                dishesImage.append(reciepe)
                    } catch let error as NSError {
                        print("Could not save. \(error), \(error.userInfo)")
                    }
                }

        
//......................RICE........................................................................
    let ricerecipeEntity = NSEntityDescription.entity(forEntityName: "Rice", in: managedContext)!

    let riceReciepeNames = ["Jeera_Rice", "Veg_Pulao"]
    for reciepp in riceReciepeNames {
    let reciepe = NSManagedObject(entity: ricerecipeEntity, insertInto: managedContext)
    reciepe.setValue(reciepp, forKeyPath: "recipes")
    do {
    try managedContext.save()
    dishes.append(reciepe)
    //                dishesImage.append(reciepe)
    } catch let error as NSError {
    print("Could not save. \(error), \(error.userInfo)")
    }
    }


//......................Cheese........................................................................
    let cheeserecipeEntity = NSEntityDescription.entity(forEntityName: "Cheese", in: managedContext)!
    
    let cheeseReciepeNames = ["Masala_Paneer", "Paneer_Bhurji"]
    for reciepp in cheeseReciepeNames {
    let reciepe = NSManagedObject(entity: cheeserecipeEntity, insertInto: managedContext)
    reciepe.setValue(reciepp, forKeyPath: "recipes")
    do {
    try managedContext.save()
    dishes.append(reciepe)
    //                dishesImage.append(reciepe)
    } catch let error as NSError {
    print("Could not save. \(error), \(error.userInfo)")
    }
    }
    
//......................Naan........................................................................
    
    let naanrecipeEntity = NSEntityDescription.entity(forEntityName: "Naan", in: managedContext)!

    let naanReciepeNames = ["Aloo_Paratha", "Cauliflower_Paratha", "Roti"]
    for reciepp in naanReciepeNames {
    let reciepe = NSManagedObject(entity: naanrecipeEntity, insertInto: managedContext)
    reciepe.setValue(reciepp, forKeyPath: "recipes")
    do {
    try managedContext.save()
    dishes.append(reciepe)
    //                dishesImage.append(reciepe)
    } catch let error as NSError {
    print("Could not save. \(error), \(error.userInfo)")
    }
    }


    //...................Snacks...........................................................................
    
    let snacksrecipeEntity = NSEntityDescription.entity(forEntityName: "Snacks", in: managedContext)!

     let snacksReciepeNames = ["Bread_Roll", "Masala_Papad_Papadum", "Veg_Samosa"]
    for reciepp in snacksReciepeNames {
    let reciepe = NSManagedObject(entity: snacksrecipeEntity, insertInto: managedContext)
    reciepe.setValue(reciepp, forKeyPath: "recipes")
    do {
    try managedContext.save()
    dishes.append(reciepe)
    //                dishesImage.append(reciepe)
    } catch let error as NSError {
    print("Could not save. \(error), \(error.userInfo)")
    }
    }
       
//............................. yogourt................................................................
        
      
    let yogurtrecipeEntity = NSEntityDescription.entity(forEntityName: "Yogurt", in: managedContext)!

       let yogurtReciepeNames = ["Boondi_Raita", "Veg_Raita"]
        for reciepp in yogurtReciepeNames {
            let reciepe = NSManagedObject(entity: yogurtrecipeEntity, insertInto: managedContext)
            reciepe.setValue(reciepp, forKeyPath: "recipes")
            do {
                try managedContext.save()
                dishes.append(reciepe)
            
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
            NSFetchRequest<NSManagedObject>(entityName: name)
        
        //3
        do {
         dishes = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    }
extension VegTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if name == "Vegetables" {
            return vegetableReciepeNames.count
        }
        else if name == "Curry"{
            return curryReciepeNames.count
        }
        else if name == "Rice" {
            return riceReciepeNames.count
        }
        else if name == "Cheese"{
            return cheeseReciepeNames.count
        }
        else if name == "Naan"{
            return naanReciepeNames.count
        }
            
        else if name == "Snacks"{
            return snacksReciepeNames.count
        }
        else if name == "Yogurt"{
            return yogurtReciepeNames.count
        }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let allVegDishes = dishes[indexPath.row]
        let cell =  vegTableView.dequeueReusableCell(withIdentifier: "Vegcell", for: indexPath) as? vegTableViewCell
//        let label = cell.viewWithTag(1000) as! UILabel
        
       cell?.lbl.text = allVegDishes.value(forKey: "recipes") as? String
       
        return cell!
}
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let allVegDishes = dishes[indexPath.row]
        let vc = storyboard?.instantiateViewController(withIdentifier: "DishesDetailViewController") as? DishesDetailViewController
        vc?.name = allVegDishes.value(forKey: "recipes") as! String
        self.navigationController?.pushViewController(vc!, animated: true)
    }


    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
