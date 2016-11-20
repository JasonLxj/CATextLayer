//
//  ViewController.m
//  CATextLayer
//
//  Created by 李晓杰 on 2016/11/17.
//  Copyright © 2016年 李晓杰. All rights reserved.
//

#import "ViewController.h"
#import <CoreText/CoreText.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *labelView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self showSomeText];
    [self showSomeTextWithAttributr];
    
    
    
}

- (void)showSomeTextWithAttributr {
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = _labelView.bounds;
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    [_labelView.layer addSublayer:textLayer];
    
    textLayer.alignmentMode = kCAAlignmentJustified;
    textLayer.wrapped = YES;
    
    UIFont *font = [UIFont systemFontOfSize:20];
    NSString *text = @"Lorem ipsum dolor sit amet, consectetur adipiscing  elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nuncelementum, libero ut porttitor dictum, diam odio congue lacus, velfringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet lobortis";
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:text];
    
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFloat fontSize = font.pointSize;
    CTFontRef fontRef = CTFontCreateWithName(fontName, fontSize, NULL);// CT
    
    NSDictionary *attr = @{(__bridge id)kCTForegroundColorAttributeName : (__bridge id)[UIColor redColor].CGColor,
                           (__bridge id)kCTFontAttributeName : (__bridge id) fontRef};
    
    [string setAttributes:attr range:NSMakeRange(0, text.length)];
    
    attr = @{(__bridge id)kCTForegroundColorAttributeName : (__bridge id)[UIColor yellowColor].CGColor,
             (__bridge id)kCTFontAttributeName : (__bridge id)fontRef,
             (__bridge id)kCTUnderlineStyleAttributeName : @(kCTUnderlineStyleThick)};
    
    [string setAttributes:attr range:NSMakeRange(4, 40)];
    
    CFRelease(fontRef);
    
    textLayer.string = string;
    
    
    
}

/// 利用layer显示文字,基本的
- (void)showSomeText{
    
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = _labelView.bounds;
    [self.labelView.layer addSublayer:textLayer];
    
    textLayer.foregroundColor = [UIColor blueColor].CGColor;
    textLayer.alignmentMode = kCAAlignmentJustified;
    textLayer.truncationMode = kCATruncationEnd;
    textLayer.wrapped = YES; // 换行
    textLayer.contentsScale = [UIScreen mainScreen].scale;// 这个设置让根据当前屏幕进行渲染,防止像素化
    
    UIFont *font = [UIFont systemFontOfSize:15];
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName); // CF  这个属性可以是coreText的
    
    textLayer.font = fontRef;
    textLayer.fontSize = font.pointSize;
    CGFontRelease(fontRef);
    
    NSString *text = @"Lorem ipsum dolor sit amet, consectetur adipiscing  elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc elementum, libero ut porttitor dictum, diam odio congue lacus, vel fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet lobortis";
    textLayer.string = text;
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
