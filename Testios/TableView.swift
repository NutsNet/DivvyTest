//
//  TableView.swift
//  Testios
//
//  Created by Christophe Vichery on 1/25/21.
//

import UIKit
import Kingfisher

protocol TableViewDelegate {
    func mainOpenCell(companie: Companie)
    func mainGetData(isFirst: Bool)
}

class TableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    var tableViewDelegate: TableViewDelegate?
    
    let od = OneData.shared
    
    var listOfCompanies = [Companie]()
    
    var isGetMoreData = true
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        // View
        delegate = self
        dataSource = self
        separatorStyle = .none
        backgroundColor = .clear
        register(TableViewCell.self as AnyClass, forCellReuseIdentifier: "TableViewCell")
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let foot = UIView()
        
        return foot
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfCompanies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let companie = listOfCompanies[indexPath.row]
        
        let cell:TableViewCell = (tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell)!
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.tvcNameLb.text = companie.name
        cell.tvcCityLb.text = (companie.location!)["city"]
        cell.tvcCountryLb.text = (companie.location!)["country"]
        
        let url = URL(string: "https://picsum.photos/800/600?grayscale&blur=2")
        cell.tvcPicIv.kf.setImage(with: url)
        
        if indexPath.row == listOfCompanies.count - 1 && isGetMoreData {
            tableViewDelegate?.mainGetData(isFirst: true)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableViewDelegate?.mainOpenCell(companie: listOfCompanies[indexPath.row])
    }
}
