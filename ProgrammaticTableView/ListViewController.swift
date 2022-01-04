//
//  ListViewController.swift
//  ProgrammaticTableView
//
//  Created by Austin Biegler on 12/5/21.
//

import UIKit

class ListViewController: UIViewController {
    
    var tableView = UITableView()
    var backpackList = [Backpack]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        createMockData()
        configureTableView()
    }
    
    func createMockData() {
        let tmpBackpack1 = Backpack(thumbnail: "backpack1", title: "Arcteryx Aerios 7", price: 79.99)
        let tmpBackpack2 = Backpack(thumbnail: "backpack2", title: "Arcteryx Aerios 10", price: 99.99)
        let tmpBackpack3 = Backpack(thumbnail: "backpack3", title: "Black Diamond Bullet Pack", price: 179.99)
        let tmpBackpack4 = Backpack(thumbnail: "backpack4", title: "Black Diamond Sonar Pack (S/M)", price: 39.99)
        let tmpBackpack5 = Backpack(thumbnail: "backpack5", title: "Black Diamond Sonic (Large)", price: 49.99)
        let tmpBackpack6 = Backpack(thumbnail: "backpack6", title: "Deuter AC Lite 18", price: 19.99)
        let tmpBackpack7 = Backpack(thumbnail: "backpack7", title: "MontBell Versalite Pack 20", price: 79.99)
        let tmpBackpack8 = Backpack(thumbnail: "backpack8", title: "Mountainsmith Approach 40", price: 19.99)
        let tmpBackpack9 = Backpack(thumbnail: "backpack9", title: "Osprey Escapist 20 (M/L)", price: 29.99)
        let tmpBackpack10 = Backpack(thumbnail: "backpack10", title: "REI Flash 18", price: 179.99)
        backpackList.append(contentsOf: [tmpBackpack1, tmpBackpack2, tmpBackpack3, tmpBackpack4, tmpBackpack5, tmpBackpack5, tmpBackpack6, tmpBackpack7, tmpBackpack8, tmpBackpack9, tmpBackpack10])
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.pin(to: view)
        tableView.register(ListCell.self, forCellReuseIdentifier: ListCell.identifier)
        tableView.separatorStyle = .none
        tableView.rowHeight = 100
        tableView.backgroundColor = UIColor(red: 0.2, green: 0.8, blue: 0.5, alpha: 1.0)
        tableView.showsVerticalScrollIndicator = false
    }

}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return backpackList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let backpack = self.backpackList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: ListCell.identifier, for: indexPath) as! ListCell
        cell.setData(backpack: backpack)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Day Packs"
        }
        return ""
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 50
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 25))
            headerView.backgroundColor = UIColor(red: 0.2, green: 0.8, blue: 0.5, alpha: 1.0)
            headerView.layer.borderWidth = 2
            headerView.layer.borderColor = UIColor(red: 0.2, green: 0.8, blue: 0.5, alpha: 1.0).cgColor
            
            let label = UILabel()
            label.frame = CGRect.init(x: 24, y: 12, width: headerView.frame.width-10, height: headerView.frame.height-5)
            label.text = "Day Packs"
            label.font = UIFont(name: "SFProText-Semibold", size: 26)
            label.textColor = .white
            
            headerView.addSubview(label)
            
            return headerView
            
        }
        return UIView()
    }
}
