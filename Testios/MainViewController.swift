//
//  MainViewController.swift
//  Testios
//
//  Created by Christophe Vichery on 1/25/21.
//

import UIKit
import Kingfisher

class MainViewController: UIViewController, TableViewDelegate {

    var listOfCompanies: Array<Dictionary<String, AnyObject>> = []
    
    let mainLogoIv = UIImageView()
    let mainTitleLb = UILabel()
    let mainGetDataBt = UIButton()
    let mainTv = TableView()
    
    var mainTvIndexPath = [IndexPath]()
    
    var mainCurIdx = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Self
        view.backgroundColor = .black
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        // Logo
        mainLogoIv.image = UIImage(named: "logo")
        mainLogoIv.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainLogoIv)
        
        let wtMainLogoIvCst = NSLayoutConstraint(item: mainLogoIv, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: UIScreen.main.bounds.width - 15)
        let htMainLogoIvCst = NSLayoutConstraint(item: mainLogoIv, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: UIScreen.main.bounds.width - 15)
        let hcMainLogoIvCst = NSLayoutConstraint(item: mainLogoIv, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        let vcMainLogoIvCst = NSLayoutConstraint(item: mainLogoIv, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([wtMainLogoIvCst, htMainLogoIvCst, hcMainLogoIvCst, vcMainLogoIvCst])
        
        // Title
        mainTitleLb.alpha = 0
        mainTitleLb.textAlignment = .center
        mainTitleLb.font = UIFont(name: "Lato-Bold", size: 32)
        mainTitleLb.translatesAutoresizingMaskIntoConstraints = false
        mainTitleLb.sizeToFit()
        mainTitleLb.layer.shadowRadius = 1
        mainTitleLb.layer.shadowOpacity = 1
        mainTitleLb.layer.shadowOffset = CGSize.zero
        view.addSubview(mainTitleLb)
        
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let underlineAttributedString = NSAttributedString(string: "Divvy", attributes: underlineAttribute)
        mainTitleLb.attributedText = underlineAttributedString
        
        let hcMainTitleLbCst = NSLayoutConstraint(item: mainTitleLb, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        let vtMainTitleLbCstCst = NSLayoutConstraint(item: mainTitleLb, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 40)
        NSLayoutConstraint.activate([hcMainTitleLbCst, vtMainTitleLbCstCst])
        
        // Get data button
        mainGetDataBt.alpha = 0
        mainGetDataBt.titleLabel?.numberOfLines = 2
        mainGetDataBt.titleLabel?.textAlignment = .center
        mainGetDataBt.setTitleColor(.white, for: .normal)
        mainGetDataBt.setTitle("Get companies",for: .normal)
        mainGetDataBt.contentHorizontalAlignment = .center
        mainGetDataBt.titleLabel?.font = UIFont(name: "Lato-Bold", size: 32)
        mainGetDataBt.addTarget(self, action: #selector(mainGetDataBtTouch), for: .touchUpInside)
        mainGetDataBt.translatesAutoresizingMaskIntoConstraints = false
        mainGetDataBt.layer.cornerRadius = 10
        mainGetDataBt.layer.borderWidth = 1
        mainGetDataBt.layer.borderColor = UIColor(rgb: 0x000000, a: 0.25).cgColor
        mainGetDataBt.layer.shadowOffset = CGSize.zero
        mainGetDataBt.layer.shadowOpacity = 1
        mainGetDataBt.layer.shadowRadius = 1
        view.addSubview(mainGetDataBt)
        
        let wtMainGetDataBtCst = NSLayoutConstraint(item: mainGetDataBt, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 256)
        let htMainGetDataBtCst = NSLayoutConstraint(item: mainGetDataBt, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 64)
        let hcMainGetDataBtCst = NSLayoutConstraint(item: mainGetDataBt, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        let vbMainGetDataBtCst = NSLayoutConstraint(item: mainGetDataBt, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -40)
        NSLayoutConstraint.activate([wtMainGetDataBtCst, htMainGetDataBtCst, hcMainGetDataBtCst, vbMainGetDataBtCst])
        
        // Table
        mainTv.tableViewDelegate = self
        mainTv.rowHeight = UITableView.automaticDimension
        mainTv.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainTv)
        
        let hlMainTvCst = NSLayoutConstraint(item: mainTv, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0)
        let hrMainTvCst = NSLayoutConstraint(item: mainTv, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0)
        let vtMainTvCst = NSLayoutConstraint(item: mainTv, attribute: .top, relatedBy: .equal, toItem: mainTitleLb, attribute: .bottom, multiplier: 1, constant: 40)
        let vbMainTvCst = NSLayoutConstraint(item: mainTv, attribute: .bottom, relatedBy: .equal, toItem: mainGetDataBt, attribute: .top, multiplier: 1, constant: -40)
        NSLayoutConstraint.activate([hlMainTvCst, hrMainTvCst, vtMainTvCst, vbMainTvCst])
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) { self.mainAnimLogo() }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func mainAnimLogo() {
        UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseInOut, animations: { () -> Void in
            self.mainLogoIv.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        }) { (finished) -> Void in
            self.mainLogoIv.isHidden = true
            self.view.backgroundColor = .white
            
            self.mainTv.alpha = 1
            self.mainTitleLb.alpha = 1
            self.mainGetDataBt.alpha = 1
        }
    }
    
    @objc func mainGetDataBtTouch(sender: UIButton!) {
        let cache = ImageCache.default
        cache.clearCache()
        
        mainCurIdx = 0
        
        mainTv.setContentOffset(.zero, animated: false)
        mainTv.listOfCompanies.removeAll()
        mainTv.reloadData()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            if let path = Bundle.main.path(forResource: "Companies", ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                    if let companies = json as? Array<Dictionary<String, AnyObject>> {
                        self.listOfCompanies = companies
                        self.mainGetData(isFirst: true)
                    }
                } catch {
                    print("Json error!")
                }
            }
        }
    }
    
    // TableViewDelegate
    func mainGetData(isFirst: Bool) {
        DispatchQueue.global().async {
            for idx in self.mainCurIdx...self.mainCurIdx + 10 {
                if (idx < self.listOfCompanies.count) {
                    let companie = Companie()
                    companie.id = self.listOfCompanies[idx]["id"] as? UInt64
                    companie.name = self.listOfCompanies[idx]["name"] as? String
                    companie.location = self.listOfCompanies[idx]["location"] as? Dictionary<String, String>
                    companie.revenue = self.listOfCompanies[idx]["revenue"] as? Array<Dictionary<String, AnyObject>>
                    
                    self.mainTv.listOfCompanies.append(companie)
                    self.mainTvIndexPath.append(NSIndexPath(row: self.listOfCompanies.count - 1, section: 0) as IndexPath)
                } else {
                    self.mainTv.isGetMoreData = false
                    break
                }
            }
            
            self.mainCurIdx += 11
            
            DispatchQueue.main.async {
                if isFirst {
                    self.mainTv.reloadData()
                } else {
                    print(self.mainTv.listOfCompanies.count)
                    self.mainTv.beginUpdates()
                    self.mainTv.insertRows(at: self.mainTvIndexPath, with: .automatic)
                    self.mainTv.endUpdates()
                }
            }
        }
    }
    
    func mainOpenCell(companie: Companie) {
        let cellVc = CellViewController(companie: companie)
        cellVc.modalPresentationStyle = .formSheet
        present(cellVc, animated: true, completion: nil)
    }
}
