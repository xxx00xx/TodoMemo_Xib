//
//  ViewController.swift
//  Xib
//
//  Created by 古田翔太郎 on 2020/09/28.
//  Copyright © 2020 古田翔太郎. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var stationList: UITableView!
    var stations:[Station] = [Station]()

    //let todoArray = ["メモ1", "メモ2", "メモ3"]
    //let dateArray = ["日付1", "日付2", "日付3"]
    
    //表示するcell数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return todoListArray.count
        return stations.count
    }
    
    //表示するcellの中身を決める
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

          let cell = tableView.dequeueReusableCell(withIdentifier: "StationTableViewCell", for: indexPath ) as! StationTableViewCell

          cell.setCell(station: stations[indexPath.row])

          return cell
        /*
      let cell = tableView.dequeueReusableCell(withIdentifier: "StationTableViewCell", for: indexPath ) as! StationTableViewCell

      cell.setCell(station: stations[indexPath.row])

      return station*/
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stationList.dataSource = self
        stationList.delegate = self
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setupStations()
        stationList.register(UINib(nibName: "StationTableViewCell", bundle: nil), forCellReuseIdentifier: "StationTableViewCell")
    }
    
    /*
    override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
    }
    */
    
    func setupStations() {
        //追加画面で入力した内容を取得する
        if saveData.object(forKey: "TodoList") != nil {
            todoListArray = saveData.object(forKey: "TodoList") as! [String]
        }
        //追加画面で入力した内容を取得する
        if saveData.object(forKey: "DateList") != nil {
            dateListArray = saveData.object(forKey: "DateList") as! [String]
        }
        for i in stride(from: 0, to: todoListArray.count, by: 1) {
            for j in stride(from: 0, to: dateListArray.count, by: 1) {
                if i == j {
                    stations += [Station(memo: "\(todoListArray[i])", date: "\(dateListArray[j])")];
                }
            }
        }
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
      return 1
    }
    
    
    //Delete Button
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            stations.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            //↓大事
            saveData.removeObject(forKey: "TodoList")
            saveData.set(todoListArray, forKey: "TodoList" )
            saveData.removeObject(forKey: "DateList")
            saveData.set(dateListArray, forKey: "DateList" )
        }
    }
    
    //MemoViewControllerからViewControllerへ画面遷移するためのクラス
    @IBAction func unwindToViewController(segue: UIStoryboardSegue) {}
}

