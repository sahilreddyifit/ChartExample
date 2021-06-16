//
//  SciChartView.swift
//  ChartExample
//
//  Created by Sahil Reddy on 6/16/21.
//

import UIKit
import SciChart
import SwiftUI

class SciViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let surface = SCIChartSurface()

        surface.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(surface)
        surface.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        surface.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        surface.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        surface.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        let xAxis = SCINumericAxis()
        xAxis.growBy = SCIDoubleRange(min: 0.05, max: 0.05)
        let yAxis = SCINumericAxis()
        yAxis.growBy = SCIDoubleRange(min: 0.05, max: 0.05)
        
        let count = 1000
        let xValues = SCIDoubleValues(capacity: count)
        let yValues = SCIDoubleValues(capacity: count)
        for i in 0 ..< count {
            let x: Double = 10.0 * Double(i) / Double(count)
            let y: Double = sin(2 * x)
            xValues.add(x)
            yValues.add(y)
        }
        
        let dataSeries = SCIXyDataSeries(xType: .double, yType: .double)
        dataSeries.append(x: xValues, y: yValues)
        
        let renderableSeries = SCIFastLineRenderableSeries()
        renderableSeries.dataSeries = dataSeries
        
        SCIUpdateSuspender.usingWith(surface) {
            surface.xAxes.add(xAxis)
            surface.yAxes.add(yAxis)
            surface.renderableSeries.add(renderableSeries)
        }
    }
}

struct SciChartView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController
    
    func makeUIViewController(context: Context) -> UIViewController {
        return SciViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        //
    }
    
}
