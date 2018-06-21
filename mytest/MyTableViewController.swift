//
//  MyTableViewController.swift
//  mytest
//
//  Created by D7702_09 on 2018. 6. 21..
//  Copyright © 2018년 jik. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
    
    //var foodstorename = ["동의과학대학교", "부산시민공원", "롯데호텔 부산본점"]
    //var foodstoreaddress = ["부산광역시 부산진구 양정동 429-19", "부산광역시 부산진구 연지동 100-6", "부산광역시 부산진구 부전동 부전로 503-15"]
    
    var foodStores:[Food] = [
        Food(name: "동의과학대학교", address: "부산광역시 부산진구 양정동 429-19"),
        Food(name: "부산시민공원", address: "부산광역시 부산진구 연지동 100-6"),
        Food(name: "롯데호텔 부산본점", address: "부산광역시 부산진구 부전동 부전로 503-15")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return foodstorename.count
        return foodStores.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RE", for: indexPath) as!MyTableViewCell

        //cell.name.text = foodstorename[indexPath.row]
        //cell.address.text = foodstorename[indexPath.row]
        cell.name.text = foodStores[indexPath.row].name
        cell.address.text = foodStores[indexPath.row].address

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mapview"    {
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationController = segue.destination as! MapViewController
                //destinationController.name = foodstorename[indexPath.row]
                //destinationController.address = foodstoreaddress[indexPath.row]
                destinationController.name = foodStores[indexPath.row].name
                destinationController.address = foodStores[indexPath.row].address
            }
        }else if segue.identifier == "total"{
        let destinationController = segue.destination as! TotalViewController
       // destinationController.name = foodstorename
        //destinationController.address = foodstoreaddress
            destinationController.totalFoodStores = foodStores
        }
        }

}
