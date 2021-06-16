//
//  ManualLineView.swift
//  ChartExample
//
//  Created by Sahil Reddy on 6/15/21.
//

import SwiftUI
import Combine

struct ManualLineView: View {
    
    func degreeHeight(_ height: CGFloat, range: Int) -> CGFloat {
        height / CGFloat(range)
    }
    
    func unitOffset(_ unit: Double, height: CGFloat) -> CGFloat {
        CGFloat(unit + 10) * height
    }
    
    func labelOffset(_ line: Int, height: CGFloat) -> CGFloat {
        height - self.unitOffset(Double(line * 10),
                                 height: self.degreeHeight(height, range: 110))
    }
    var body: some View {
        var inclineValues = [2,3,2,5]
        var speedValues = [1,2,3,4]
        GeometryReader { reader in
            Path { p in
                var xVal = 0
                var yVal = 800
                
                p.move(to: .init(x: xVal, y: yVal))
                for i in 0..<6 {
                    p.addLine(to: .init(x: xVal + (i * 50), y: yVal))
                    p.addLine(to: .init(x: xVal + (i * 50), y: yVal - (i * 50)))
                    yVal = yVal - (i * 50)
                    xVal = xVal + (i * 50)
                }
            }.stroke(Color("inclineLine"), lineWidth: 2.5)
            
            Path { p in
                var xVal = 0
                var yVal = 10
                p.move(to: .init(x: xVal, y: yVal))
                for i in 0..<6 {
                    p.addLine(to: .init(x: xVal + (i * 50), y: yVal))
                    p.addLine(to: .init(x: xVal + (i * 50), y: yVal + (i * 50)))
                    yVal = yVal + (i * 50)
                    xVal = xVal + (i * 50)
                }
            }
            .stroke(Color("speedLine"), lineWidth: 2.5)
            
            ForEach(-1..<11) { line in
                Group {
                    Path { path in
                        let y = self.labelOffset(line, height: reader.size.height)
                        print("Y = \(y)")
                        path.move(to: CGPoint(x: 0, y: y))
                        path.addLine(to: CGPoint(x: reader.size.width, y: y))
                    }.stroke(Color.gray)
                    
                    if line >= 0 {
                        Text("\(line * 2)")
                            .offset(x: 10, y: self.labelOffset(line, height: reader.size.height))
                            .foregroundColor(Color.gray)
                    }
                }
            }
        }
    }
}
