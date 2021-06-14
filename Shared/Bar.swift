//
//  Bar.swift
//  ChartExample
//
//  Created by Sahil Reddy on 6/14/21.
//

import Charts
import SwiftUI

struct Bar: UIViewRepresentable {
    
    var entries: [BarChartDataEntry]
    typealias UIViewType = BarChartView
    
    func makeUIView(context: Context) -> BarChartView {
        let chart = BarChartView()
        chart.data = addData()
        return chart
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.data = addData()
    }
    
    func addData() -> BarChartData {
        let dataSet = BarChartDataSet(entries: entries)
        dataSet.colors = [NSUIColor.green]
        dataSet.label = "My Data"
        
        return BarChartData(dataSet: dataSet)
    }
    
}

struct Line: UIViewRepresentable {

    typealias UIViewType = LineChartView

    func makeUIView(context: Context) -> LineChartView {
        let chart = LineChartView()
        chart.backgroundColor = UIColor(red: 0.090, green: 0.114, blue: 0.176, alpha: 1)
        chart.leftAxis.enabled = false
        chart.rightAxis.axisLineColor = UIColor(red: 0.090, green: 0.114, blue: 0.176, alpha: 1)
        //
        chart.chartDescription.enabled = false

        chart.dragEnabled = true
        chart.pinchZoomEnabled = false
        chart.isExclusiveTouch = false
        
//        chart.legend.enabled = false
    
        
        let rightAxis = chart.rightAxis
        rightAxis.labelTextColor = #colorLiteral(red: 0.6327821612, green: 0.6473567486, blue: 0.668708086, alpha: 1)
        chart.rightAxis.labelFont = UIFont(name: "GillSans", size: 10)!
        rightAxis.axisMaximum = 25
        rightAxis.axisMinimum = 0
        rightAxis.granularityEnabled = false

        chart.leftAxis.enabled = false
        chart.leftAxis.spaceTop = 0.4
        chart.leftAxis.spaceBottom = 0.4
        chart.xAxis.enabled = false

        return chart
    }
    
    func updateUIView(_ uiView: LineChartView, context: Context) {
        uiView.data = addData()
    }
    
    func addData() -> LineChartData {
        let range = UInt32(10.0)
        let count = 3
        let colors = ChartColorTemplates.vordiplom()[0...1]
        
        let block: (Int) -> ChartDataEntry = { (i) -> ChartDataEntry in
            let val = Double(arc4random_uniform(range) + 3)
            return ChartDataEntry(x: Double(i), y: val)
        }
        
        let set1 = LineChartDataSet(entries: [ChartDataEntry(x: 1.0, y: 1.0),
                                              ChartDataEntry(x: 2.0, y: 1.0),
                                              ChartDataEntry(x: 2.0, y: 2.0),
                                              ChartDataEntry(x: 3.0, y: 2.0),
                                              ChartDataEntry(x: 3.0, y: 1.0),
                                              ChartDataEntry(x: 4.0, y: 1.0)])
//        set1.lineWidth = 2.5
        let color = #colorLiteral(red: 0.867, green: 0.592, blue: 0.149, alpha: 1)
        set1.setColor(color)
        set1.circleRadius = 0
        set1.circleHoleRadius = 0
        
        let set2 = LineChartDataSet(entries: [ChartDataEntry(x: 1.1, y: 3.0),
                                              ChartDataEntry(x: 2.1, y: 3.0),
                                              ChartDataEntry(x: 2.1, y: 1.0),
                                              ChartDataEntry(x: 3.1, y: 1.0),
                                              ChartDataEntry(x: 3.1, y: 2.0),
                                              ChartDataEntry(x: 4.1, y: 2.0)])
        
//        set2.lineWidth = 2.5
        set2.setColor(#colorLiteral(red: 0.148, green: 0.7843543887, blue: 0.588, alpha: 1))
        set2.circleRadius = 0
        set2.circleHoleRadius = 0

        let dataSets = (0..<2).map { i -> LineChartDataSet in
            let yVals = (0..<count).map(block)
            let set = LineChartDataSet(entries: yVals, label: "DataSet \(i)")
            set.lineWidth = 2.5
            set.circleRadius = 4
            set.circleHoleRadius = 2
            let color = colors[i % colors.count]
            set.setColor(color)
            set.setCircleColor(color)
            
            return set
        }
        
        
        let data = LineChartData(dataSets: [set1, set2])
//        let data = LineChartData(dataSets: dataSets)

        return data
    }
}
