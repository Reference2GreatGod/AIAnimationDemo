//
//  AISparkView.m
//  AIAnimationDemo
//
//  Created by 艾泽鑫 on 2018/8/17.
//  Copyright © 2018年 艾泽鑫. All rights reserved.
//

#import "AISparkView.h"

@interface AISparkView()
@property(nonatomic, strong)CAShapeLayer *progressLayer;
@property(nonatomic, strong)CAEmitterLayer *emitter;
@property(nonatomic, strong)CAEmitterCell *cell;
/** 半径*/
@property(nonatomic,assign)CGFloat radius;
@end

@implementation AISparkView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.progressLayer = [CAShapeLayer layer];
        self.progressLayer.lineWidth = 4;
        self.progressLayer.strokeColor = [UIColor redColor].CGColor;
        self.progressLayer.fillColor   = [UIColor clearColor].CGColor;
        [self.layer addSublayer:self.progressLayer];
        
        self.emitter        = [CAEmitterLayer layer];
        
        self.cell           = [[CAEmitterCell alloc]init];
        _cell.contents      = (__bridge id _Nullable)([UIImage imageNamed:@"flake.png"].CGImage);
        _cell.birthRate     = 100;
        _cell.scale         = 0.1;
        _cell.lifetime      = 3;
        _cell.color         = [UIColor blackColor].CGColor;
        _cell.alphaSpeed    = -0.3;
        _cell.velocity      = 5;
        _cell.velocityRange = 5;
        _cell.emissionRange = 2.0 / (2*M_PI);
        
        _emitter.emitterCells = @[_cell];
        
        [self.layer addSublayer:_emitter];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.progressLayer.path  = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.ai_middleX, self.ai_middleY) radius:self.ai_width *.5  startAngle:-M_PI_2 endAngle:2 * M_PI -M_PI_2 clockwise:YES].CGPath;
    _emitter.emitterPosition = CGPointMake(_emitter.frame.size.width * 0.5, _emitter.frame.size.height * 0.5);
}

- (void)beginAnimation {
    
}
@end
