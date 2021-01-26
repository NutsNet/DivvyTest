//
//  TableViewCell.swift
//  Testios
//
//  Created by Christophe Vichery on 1/25/21.
//

import UIKit

class TableViewCell: UITableViewCell {
    let od = OneData.shared
    
    let tvcBackVi = UIView()
    let tvcPicIv = UIImageView()
    let tvcNameLb = UILabel()
    let tvcCityLb = UILabel()
    let tvcCountryLb = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Self
        backgroundColor = .clear
        
        // Back
        tvcBackVi.backgroundColor = .white
        tvcBackVi.contentMode = UIView.ContentMode.scaleAspectFill
        tvcBackVi.translatesAutoresizingMaskIntoConstraints = false
        tvcBackVi.layer.cornerRadius = 10
        tvcBackVi.layer.shadowColor = UIColor.black.cgColor
        tvcBackVi.layer.shadowOffset = CGSize(width: 0, height: 0)
        tvcBackVi.layer.shadowRadius = 4
        tvcBackVi.layer.shadowOpacity = 0.1
        addSubview(tvcBackVi)
        
        let wtTvcBackViCst = NSLayoutConstraint(item: tvcBackVi, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: od.currentDeviceWt - 20)
        let htTvcBackViCst = NSLayoutConstraint(item: tvcBackVi, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 120)
        let hcTvcBackViCst = NSLayoutConstraint(item: tvcBackVi, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
        let vtTvcBackViCst = NSLayoutConstraint(item: tvcBackVi, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 20)
        let vbTvcBackViCst = NSLayoutConstraint(item: tvcBackVi, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([wtTvcBackViCst, htTvcBackViCst, hcTvcBackViCst, vtTvcBackViCst, vbTvcBackViCst])
        
        // Pic
        tvcPicIv.tag = 0
        tvcPicIv.clipsToBounds = true
        tvcPicIv.backgroundColor = UIColor(rgb: 0xEEEEEE)
        tvcPicIv.translatesAutoresizingMaskIntoConstraints = false
        tvcPicIv.layer.cornerRadius = 5
        tvcBackVi.addSubview(tvcPicIv)
        
        let hlTvcPicIvCst = NSLayoutConstraint(item: tvcPicIv, attribute: .left, relatedBy: .equal, toItem:  tvcBackVi, attribute: .left, multiplier: 1, constant: 10)
        let hrTvcPicIvCst = NSLayoutConstraint(item: tvcPicIv, attribute: .right, relatedBy: .equal, toItem: tvcBackVi, attribute: .left, multiplier: 1, constant: 160)
        let vtTvcPicIvCst = NSLayoutConstraint(item: tvcPicIv, attribute: .top, relatedBy: .equal, toItem: tvcBackVi, attribute: .top, multiplier: 1, constant: 10)
        let vbTvcPicIvCst = NSLayoutConstraint(item: tvcPicIv, attribute: .bottom, relatedBy: .equal, toItem: tvcBackVi, attribute: .bottom, multiplier: 1, constant: -10)
        NSLayoutConstraint.activate([hlTvcPicIvCst, hrTvcPicIvCst, vtTvcPicIvCst, vbTvcPicIvCst])
        
        // Name
        tvcNameLb.font = UIFont(name: "Lato-Bold", size: 20)
        tvcNameLb.textColor = UIColor(rgb: 0x000000, a: 0.75)
        tvcNameLb.translatesAutoresizingMaskIntoConstraints = false
        tvcNameLb.sizeToFit()
        addSubview(tvcNameLb)
        
        let hlTvcNameLbCst = NSLayoutConstraint(item: tvcNameLb, attribute: .left, relatedBy: .equal, toItem:  tvcPicIv, attribute: .right, multiplier: 1, constant: 10)
        let hrTvcNameLbCst = NSLayoutConstraint(item: tvcNameLb, attribute: .right, relatedBy: .equal, toItem: tvcBackVi, attribute: .right, multiplier: 1, constant: -10)
        let vtTvcNameLbCst = NSLayoutConstraint(item: tvcNameLb, attribute: .top, relatedBy: .equal, toItem: tvcPicIv, attribute: .top, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([hlTvcNameLbCst, hrTvcNameLbCst, vtTvcNameLbCst])
        
        // City
        tvcCityLb.font = UIFont(name: "Lato-Regular", size: 20)
        tvcCityLb.textColor = UIColor(rgb: 0x000000, a: 0.75)
        tvcCityLb.translatesAutoresizingMaskIntoConstraints = false
        tvcCityLb.sizeToFit()
        addSubview(tvcCityLb)
        
        let hlTvcCityLbCst = NSLayoutConstraint(item: tvcCityLb, attribute: .left, relatedBy: .equal, toItem: tvcNameLb, attribute: .left, multiplier: 1, constant: 0)
        let hrTvcCityLbCst = NSLayoutConstraint(item: tvcCityLb, attribute: .right, relatedBy: .equal, toItem: tvcNameLb, attribute: .right, multiplier: 1, constant: 0)
        let vcTvcCityLbCst = NSLayoutConstraint(item: tvcCityLb, attribute: .centerY, relatedBy: .equal, toItem: tvcPicIv, attribute: .centerY, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([hlTvcCityLbCst, hrTvcCityLbCst, vcTvcCityLbCst])
        
        // Country
        tvcCountryLb.font = UIFont(name: "Lato-Italic", size: 20)
        tvcCountryLb.textColor = UIColor(rgb: 0x000000, a: 0.75)
        tvcCountryLb.translatesAutoresizingMaskIntoConstraints = false
        tvcCountryLb.sizeToFit()
        addSubview(tvcCountryLb)
        
        let hlTvcCountryLbCst = NSLayoutConstraint(item: tvcCountryLb, attribute: .left, relatedBy: .equal, toItem:  tvcPicIv, attribute: .right, multiplier: 1, constant: 10)
        let hrTvcCountryLbCst = NSLayoutConstraint(item: tvcCountryLb, attribute: .right, relatedBy: .equal, toItem: tvcBackVi, attribute: .right, multiplier: 1, constant: -10)
        let vbTvcCountryLbCst = NSLayoutConstraint(item: tvcCountryLb, attribute: .bottom, relatedBy: .equal, toItem: tvcPicIv, attribute: .bottom, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([hlTvcCountryLbCst, hrTvcCountryLbCst, vbTvcCountryLbCst])
        
    }
}
