//
//  CellViewController.swift
//  Testios
//
//  Created by Christophe Vichery on 1/25/21.
//

import UIKit
import Kingfisher
import Charts

class CellViewController: UIViewController {
    var cellCompanie = Companie()
    
    let cellSv = UIScrollView()
    let cellAddressLb = UILabel()
    let cellChartVi = BarChartView()
    
    init(companie: Companie) {
        super.init(nibName: nil, bundle: nil)
        
        cellCompanie = companie
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Self
        view.backgroundColor = .white
        
        // Scroll
        cellSv.backgroundColor = .lightGray
        cellSv.contentInsetAdjustmentBehavior = .never
        cellSv.showsVerticalScrollIndicator = true
        cellSv.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cellSv)
        
        let hlCellSvCst = NSLayoutConstraint(item: cellSv, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0)
        let hrCellSvCst = NSLayoutConstraint(item: cellSv, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0)
        let vtCellSvCst = NSLayoutConstraint(item: cellSv, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
        let vbCellSvCst = NSLayoutConstraint(item: cellSv, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([hlCellSvCst, hrCellSvCst, vtCellSvCst, vbCellSvCst])
        
        // Pic
        let cellPicIv = UIImageView()
        cellPicIv.clipsToBounds = true
        cellPicIv.isUserInteractionEnabled = true
        cellPicIv.contentMode = UIView.ContentMode.scaleAspectFill
        cellPicIv.backgroundColor = UIColor(rgb: 0xEEEEEE)
        cellPicIv.translatesAutoresizingMaskIntoConstraints = false
        cellPicIv.layer.cornerRadius = 5
        cellSv.addSubview(cellPicIv)
        
        let url = URL(string: "https://picsum.photos/800/600?grayscale&blur=2")
        cellPicIv.kf.setImage(with: url)
        
        let htCellPicIvCst = NSLayoutConstraint(item: cellPicIv, attribute: .height, relatedBy: .equal, toItem:  nil, attribute: .notAnAttribute, multiplier: 1, constant: 300)
        let hlCellPicIvCst = NSLayoutConstraint(item: cellPicIv, attribute: .left, relatedBy: .equal, toItem:  view, attribute: .left, multiplier: 1, constant: 0)
        let hrCellPicIvCst = NSLayoutConstraint(item: cellPicIv, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0)
        let vtCellPicIvCst = NSLayoutConstraint(item: cellPicIv, attribute: .top, relatedBy: .equal, toItem: cellSv, attribute: .top, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([htCellPicIvCst, hlCellPicIvCst, hrCellPicIvCst, vtCellPicIvCst])
        
        // Name
        let cellNameLb = UILabel()
        cellNameLb.text = cellCompanie.name
        cellNameLb.isUserInteractionEnabled = true
        cellNameLb.font = UIFont(name: "Lato-Bold", size: 30)
        cellNameLb.textColor = UIColor(rgb: 0x000000, a: 0.75)
        cellNameLb.translatesAutoresizingMaskIntoConstraints = false
        cellNameLb.sizeToFit()
        cellSv.addSubview(cellNameLb)
        
        let hlCellNameLbCst = NSLayoutConstraint(item: cellNameLb, attribute: .left, relatedBy: .equal, toItem:  cellPicIv, attribute: .left, multiplier: 1, constant: 40)
        let hrCellNameLbCst = NSLayoutConstraint(item: cellNameLb, attribute: .right, relatedBy: .equal, toItem: cellPicIv, attribute: .right, multiplier: 1, constant: -40)
        let vtCellNameLbCst = NSLayoutConstraint(item: cellNameLb, attribute: .top, relatedBy: .equal, toItem: cellPicIv, attribute: .bottom, multiplier: 1, constant: 20)
        NSLayoutConstraint.activate([hlCellNameLbCst, hrCellNameLbCst, vtCellNameLbCst])
        
        // Address
        cellAddressLb.numberOfLines = 0
        cellAddressLb.isUserInteractionEnabled = true
        cellAddressLb.text = cellCompanie.location!["address"]
        cellAddressLb.font = UIFont(name: "Lato-Regular", size: 30)
        cellAddressLb.textColor = UIColor(rgb: 0x000000, a: 0.75)
        cellAddressLb.translatesAutoresizingMaskIntoConstraints = false
        cellAddressLb.sizeToFit()
        cellSv.addSubview(cellAddressLb)
        
        let hlCellAddressLbCst = NSLayoutConstraint(item: cellAddressLb, attribute: .left, relatedBy: .equal, toItem: cellNameLb, attribute: .left, multiplier: 1, constant: 0)
        let hrCellAddressLbCst = NSLayoutConstraint(item: cellAddressLb, attribute: .right, relatedBy: .equal, toItem: cellNameLb, attribute: .right, multiplier: 1, constant: 0)
        let vtCellAddressLbCst = NSLayoutConstraint(item: cellAddressLb, attribute: .top, relatedBy: .equal, toItem: cellNameLb, attribute: .bottom, multiplier: 1, constant: 10)
        NSLayoutConstraint.activate([hlCellAddressLbCst, hrCellAddressLbCst, vtCellAddressLbCst])
        
        // Chart
        cellChartVi.translatesAutoresizingMaskIntoConstraints = false
        cellSv.addSubview(cellChartVi)
        
        let htCellChartCst = NSLayoutConstraint(item: cellChartVi, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300)
        let hlCellChartCst = NSLayoutConstraint(item: cellChartVi, attribute: .left, relatedBy: .equal, toItem: cellNameLb, attribute: .left, multiplier: 1, constant: 0)
        let hrCellChartCst = NSLayoutConstraint(item: cellChartVi, attribute: .right, relatedBy: .equal, toItem: cellNameLb, attribute: .right, multiplier: 1, constant: 0)
        let vtCellChartCst = NSLayoutConstraint(item: cellChartVi, attribute: .top, relatedBy: .equal, toItem: cellAddressLb, attribute: .bottom, multiplier: 1, constant: 40)
        NSLayoutConstraint.activate([htCellChartCst, hlCellChartCst, hrCellChartCst, vtCellChartCst])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let months = ["One", "Two", "Three", "Four", "Five", "Six"]
        let revenue = [cellCompanie.revenue![5]["value"] as! Double,
                     cellCompanie.revenue![4]["value"] as! Double,
                     cellCompanie.revenue![3]["value"] as! Double,
                     cellCompanie.revenue![2]["value"] as! Double,
                     cellCompanie.revenue![1]["value"] as! Double,
                     cellCompanie.revenue![0]["value"] as! Double]
        cellCreateChart(dataPoints: months, values: revenue.map{ Double($0) })
        
        // Content of scroll view
        DispatchQueue.main.async {
            self.cellSv.contentSize.height = self.cellChartVi.frame.origin.y + self.cellChartVi.frame.height + 20
        }
    }
    
    private func cellCreateChart(dataPoints: [String], values: [Double]) {
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(values[i]))
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Six last month revenue")
        chartDataSet.colors = [UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)]

        let chartData = BarChartData(dataSet: chartDataSet)
        let format = NumberFormatter()
        format.numberStyle = .none
        let formatter = DefaultValueFormatter(formatter: format)
        chartData.setValueFormatter(formatter)
        
        cellChartVi.data = chartData
        cellChartVi.leftAxis.labelTextColor = .black
        cellChartVi.xAxis.labelTextColor = .black
        cellChartVi.xAxis.labelPosition = XAxis.LabelPosition.bottom
    }
}
