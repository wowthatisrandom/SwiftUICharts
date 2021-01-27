//
//  File.swift
//  
//
//  Created by Will Dale on 23/01/2021.
//

import SwiftUI

public class BarChartData: LineAndBarChartData {

    public let id   : UUID  = UUID()

    @Published public var dataSets     : BarDataSet
    @Published public var metadata     : ChartMetadata?
    @Published public var xAxisLabels  : [String]?
    @Published public var chartStyle   : BarChartStyle
    @Published public var legends      : [LegendData]
    @Published public var viewData     : ChartViewData<BarChartDataPoint>
    public var noDataText   : Text  = Text("No Data")
    public var chartType    : (chartType: ChartType, dataSetType: DataSetType)

    public init(dataSets    : BarDataSet,
                metadata    : ChartMetadata?    = nil,
                xAxisLabels : [String]?         = nil,
                chartStyle  : BarChartStyle     = BarChartStyle(),
                calculations: CalculationType   = .none
    ) {
        self.dataSets       = dataSets
        self.metadata       = metadata
        self.xAxisLabels    = xAxisLabels
        self.chartStyle     = chartStyle
        self.legends        = [LegendData]()
        self.viewData       = ChartViewData()
        self.chartType      = (.bar, .single)
    }
    
    public init(dataSets    : BarDataSet,
                metadata    : ChartMetadata?    = nil,
                xAxisLabels : [String]?         = nil,
                chartStyle  : BarChartStyle     = BarChartStyle(),
                customCalc  : @escaping ([BarChartDataPoint]) -> [BarChartDataPoint]?
    ) {
        self.dataSets       = dataSets
        self.metadata       = metadata
        self.xAxisLabels    = xAxisLabels
        self.chartStyle     = chartStyle
        self.legends        = [LegendData]()
        self.viewData       = ChartViewData()
        self.chartType      = (chartType: .bar, dataSetType: .single)
    }
    
    public func getHeaderLocation() -> InfoBoxPlacement {
        return self.chartStyle.infoBoxPlacement
    }
    
    public func legendOrder() -> [LegendData] {
        return [LegendData]()
    }

    public typealias Set = BarDataSet
    public typealias DataPoint = BarChartDataPoint
}

