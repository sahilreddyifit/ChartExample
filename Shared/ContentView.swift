//
//  ContentView.swift
//  Shared
//
//  Created by Sahil Reddy on 6/14/21.
//

import SwiftUI
import SwiftUICharts
import Charts

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Line()
                Spacer()
            }
            Spacer()
        }
    }
}

struct Style {
    static let multiStyle = ChartStyle(backgroundColor: Color("chartBackground"),
                                       accentColor: Color.blue,
                                       gradientColor: GradientColor(start: .blue, end: .green),
                                       textColor: Color.yellow,
                                       legendTextColor: Color.orange,
                                       dropShadowColor: Color.red)
}

struct ChartLine {
    static let data: [([Double], GradientColor)] = [([8,32,11,23,40,28], GradientColors.green),
                                                    ([90,99,78,111,70,60,77], GradientColors.purple),
                                                    ([34,56,72,38,43,100,50], GradientColors.orngPink)]
}
