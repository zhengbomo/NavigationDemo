//
//  BMTabBarBadge.m
//  NavigationDemo
//
//  Created by bomo on 2017/3/13.
//  Copyright © 2017年 bomo. All rights reserved.
//

#import "BMTabBarBadge.h"

@implementation BMTabBarBadge

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = NO;
        self.hidden = YES;
        
        NSString *bundlePath = [[NSBundle bundleForClass:self.class] pathForResource:@"BMTabBarController" ofType:@"bundle"];
        NSString *imagePath = [bundlePath stringByAppendingPathComponent:@"BMTabBarBadge@2x.png"];
        [self setBackgroundImage:[self resizedImageFromMiddle:[UIImage imageWithContentsOfFile:imagePath]]
                        forState:UIControlStateNormal];
    }
    return self;
}

- (void)setBadgeTitleFont:(UIFont *)badgeTitleFont
{
    _badgeTitleFont = badgeTitleFont;
    self.titleLabel.font = badgeTitleFont;
}

- (void)setBadgeValue:(NSString *)badgeValue
{
    if (_badgeValue != badgeValue) {
        _badgeValue = badgeValue;
        self.hidden = !(BOOL)self.badgeValue;
        
        if (self.badgeValue) {
            [self setTitle:badgeValue forState:UIControlStateNormal];
            CGRect frame = self.frame;
            
            if (self.badgeValue.length > 0) {
                CGFloat badgeW = self.currentBackgroundImage.size.width;
                CGFloat badgeH = self.currentBackgroundImage.size.height;
                
                CGSize titleSize = [badgeValue sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:self.badgeTitleFont, NSFontAttributeName, nil]];
                frame.size.width = MAX(badgeW, titleSize.width + 10);
                frame.size.height = badgeH;
                self.frame = frame;
                
            } else {
                frame.size.width = 12.0f;
                frame.size.height = frame.size.width;
            }
            
            frame.origin.x = 58.0f * ([UIScreen mainScreen].bounds.size.width / self.tabBarItemCount) / 375.0f * 4.0f;
            frame.origin.y = 2.0f;
            self.frame = frame;
        }
    }
}

- (UIImage *)resizedImageFromMiddle:(UIImage *)image
{
    return [self resizedImage:image width:0.5f height:0.5f];
}

- (UIImage *)resizedImage:(UIImage *)image width:(CGFloat)width height:(CGFloat)height
{
    return [image stretchableImageWithLeftCapWidth:image.size.width * width
                                      topCapHeight:image.size.height * height];
}

@end
