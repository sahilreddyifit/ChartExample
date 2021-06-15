//
//  Line.swift
//  ChartExample
//
//  Created by Sahil Reddy on 6/14/21.
//

import Charts
import SwiftUI

struct Line: UIViewRepresentable {

    typealias UIViewType = LineChartView

    func makeUIView(context: Context) -> LineChartView {
        let chart = LineChartView()
        chart.backgroundColor = UIColor(red: 0.090, green: 0.114, blue: 0.176, alpha: 1)
        chart.leftAxis.enabled = false
        chart.chartDescription.enabled = false
        chart.pinchZoomEnabled = false

    
        
        let rightAxis = chart.rightAxis
        rightAxis.labelTextColor = #colorLiteral(red: 0.6327821612, green: 0.6473567486, blue: 0.668708086, alpha: 1)
        rightAxis.labelFont = UIFont(name: "GillSans", size: 10)!
        rightAxis.axisMaximum = 25
        rightAxis.axisMinimum = 0
        rightAxis.granularityEnabled = false

        chart.leftAxis.enabled = false
        chart.xAxis.enabled = false
        chart.data = addData()
        return chart
    }
    
    func updateUIView(_ uiView: LineChartView, context: Context) {
        uiView.data = addData()
    }
    
    func addData() -> LineChartData {
        
        let set1 = LineChartDataSet(entries: [ChartDataEntry(x: 0.0, y: 0.0),
                                              ChartDataEntry(x: 1.0, y: 1.0),
                                              ChartDataEntry(x: 2.0, y: 1.0),
                                              ChartDataEntry(x: 2.0, y: 2.0),
                                              ChartDataEntry(x: 3.0, y: 2.0),
                                              ChartDataEntry(x: 3.0, y: 1.0),
                                              ChartDataEntry(x: 4.0, y: 1.0)])
        set1.lineWidth = 2.5
        set1.setColor(#colorLiteral(red: 0.867, green: 0.592, blue: 0.149, alpha: 1))
        set1.circleRadius = 0
        set1.circleHoleRadius = 0
        
        let set2 = LineChartDataSet(entries: [ChartDataEntry(x: 0.1, y: 0.0),
                                              ChartDataEntry(x: 0.1, y: 5.0),
                                              ChartDataEntry(x: 1.1, y: 5.0),
                                              ChartDataEntry(x: 2.1, y: 5.0),
                                              ChartDataEntry(x: 2.1, y: 3.0),
                                              ChartDataEntry(x: 3.1, y: 3.0),
                                              ChartDataEntry(x: 3.1, y: 10.0),
                                              ChartDataEntry(x: 4.1, y: 10.0)])
        
        set2.lineWidth = 2.5
        set2.setColor(#colorLiteral(red: 0.148, green: 0.7843543887, blue: 0.588, alpha: 1))
        set2.circleRadius = 0
        set2.circleHoleRadius = 0
        
        let dataSet = [set2, set1]

        return LineChartData(dataSets: dataSet)
    }
}
