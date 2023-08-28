//
//  AddListViewController.swift
//  TableViewApp
//
//  Created by Ngos on 2023/08/28.
//

import UIKit

class AddListViewController: UIViewController {
    @IBOutlet weak var addTextField: UITextField!
    var taskArray: [String] = [] //入力したリストを格納する配列
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTask(_ sender: Any) {
        
        let userDefaults = UserDefaults.standard //そのままだと長いので変数にいれる
        taskArray.append(addTextField.text!) //TextFieldで記入されたテキストを入れる
        userDefaults.set(taskArray, forKey: "add") //キー"add"で配列をUserDefaultsに保存
        self.navigationController?.popViewController(animated: true) //1つ前の画面に戻る
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
