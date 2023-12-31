//
//  TableViewController.swift
//  TableViewApp
//
//  Created by Ngos on 2023/08/27.
//

import UIKit

class TableViewController: UITableViewController {
    // Input task array
    var taskArray: [String] = []
    
//    //Input display person's name
//    var names: [String] = [
//           "阿部",
//           "石田",
//           "上田",
//           "遠藤",
//           "及川",
//           "梶原",
//           "菊池",
//           "工藤",
//       ]

    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefaults = UserDefaults.standard

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let userDefaults = UserDefaults.standard

         //"add"というキーで保存された値がなにかある -> 値をtaskArrayへ
        if userDefaults.object(forKey: "add") != nil {
        taskArray = userDefaults.object(forKey: "add") as! [String]
            print(taskArray)
        }
        //tableViewを更新
        tableView.reloadData()
    }
    

    // MARK: - Table view data source
    
    // method of return section number
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // number of cell in section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // [var of arrangement.count] means getting number of elements arrangement
        return taskArray.count
    }

    // comment out as below in original file
    // set display cell contents
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //set reuse cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath)

        // Configure the cell...
        // display contents of arrangement on cell label
        cell.textLabel?.text = taskArray[indexPath.row]
        
        return cell
    }
    // For delete function
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            taskArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            print(taskArray)
            
            // Save the updated taskArray to UserDefaults
            let userDefaults = UserDefaults.standard
            userDefaults.set(taskArray, forKey: "add")
            userDefaults.synchronize()
            print(taskArray)
        }
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
