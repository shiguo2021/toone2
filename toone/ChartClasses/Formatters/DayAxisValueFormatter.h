//
//  DayAxisValueFormatter.h
//  ChartsDemo
//  Copyright © 2016 dcg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <toone-Swift.h>

@interface DayAxisValueFormatter : NSObject <IChartAxisValueFormatter>

- (id)initForChart:(BarLineChartViewBase *)chart;

@end
