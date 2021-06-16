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
    let surface = SCIChartSurface()

    override func viewDidLoad() {
        super.viewDidLoad()

        surface.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(surface)
        surface.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        surface.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        surface.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        surface.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true

        let lineDataSeries = SCIXyDataSeries(xType: .int, yType: .double)
        let scatterDataSeries = SCIXyDataSeries(xType: .int, yType: .double)
        for i in 0 ..< 70 {
            lineDataSeries.append(x: i, y: Double(i) * 5)
            scatterDataSeries.append(x: i, y: 400 - Double(i) * 7)
        }
        
        let lineSeries = SCIFastLineRenderableSeries()
        lineSeries.dataSeries = lineDataSeries
        lineSeries.isDigitalLine = true
        lineSeries.strokeStyle = SCISolidPenStyle(colorCode: 0xFF279B27, thickness: 2.0)

        let scatterSeries = SCIFastLineRenderableSeries()
        scatterSeries.dataSeries = scatterDataSeries
        scatterSeries.isDigitalLine = true
        scatterSeries.strokeStyle = SCISolidPenStyle(colorCode: 0xFF42F5EC, thickness: 2.0)
        
        SCIUpdateSuspender.usingWith(self.surface) {
            self.surface.xAxes.add(items: SCINumericAxis())
            self.surface.yAxes.add(items: SCINumericAxis())
            self.surface.renderableSeries.add(items: lineSeries, scatterSeries)
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
