//
//  UIImage+UIButton.m
//  HTPressableButton
//
//  Created by He Rin Kim on 4/14/14.
//  Copyright (c) 2014 He Rin Kim & Thanakron Tandavas. All rights reserved.
//

#import "UIImage+HTButton.h"
#import "HTPressableButtonPrefs.h"

@implementation UIImage (HTButton)

+ (UIImage *) buttonWithColor: (UIColor *) buttonColor
                      andSize: (CGSize) size
              andShadowHeight: (CGFloat) shadowHeight
               andShadowColor: (UIColor *) shadowColor
              andCornerRadius: (CGFloat) cornerRadius
{
    UIImage *buttonImage;
    
    //button color
    UIImage *frontImage = [UIImage imageWithColor:buttonColor andSize:size andCornerRadius:cornerRadius];
    //button's shadow color
    UIImage *backImage = [UIImage imageWithColor:shadowColor andSize:size andCornerRadius:cornerRadius];

    CGRect rect = CGRectMake(0, 0, backImage.size.width, backImage.size.height + shadowHeight);
    
    //Draw button's shadow first (behind) a little lower
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [backImage drawAtPoint:CGPointMake(0, shadowHeight)];
    [frontImage drawAtPoint:CGPointMake(0, 0)];
    buttonImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return buttonImage;
}

+ (UIImage *) buttonWithHighlightedColor: (UIColor *) buttonColor
                                 andSize: (CGSize) size
                         andShadowHeight: (CGFloat) shadowHeight
                          andShadowColor: (UIColor *) shadowColor
                         andCornerRadius: (CGFloat) cornerRadius
{
    UIImage *buttonHighlightedImage;
    
    UIImage *frontImage = [UIImage imageWithColor:buttonColor andSize:size andCornerRadius:cornerRadius];
    UIImage *backImage = [UIImage imageWithColor:shadowColor andSize:size andCornerRadius:cornerRadius];
    
    CGRect rect = CGRectMake(0, 0, frontImage.size.width, frontImage.size.height + shadowHeight);
    
    //Button's shadow stays at the same place but the button is moved a little down (shadowOffsetWhenPressed) in highlighted state
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [backImage drawAtPoint:CGPointMake(0, shadowHeight)];
    [frontImage drawAtPoint:CGPointMake(0, shadowHeight * shadowOffetWhenPressed)];
    buttonHighlightedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return buttonHighlightedImage;
    
}

+ (UIImage *) circularButtonWithColor: (UIColor *) buttonColor
                            andSize: (CGSize) size
                    andShadowHeight: (CGFloat) shadowHeight
                     andShadowColor: (UIColor *) shadowColor
                    andCornerRadius: (CGFloat) cornerRadius
{
    UIImage *buttonImage;
    
    UIImage *frontImage = [UIImage imageWithColor:buttonColor andSize:size andCornerRadius:cornerRadius];
    UIImage *backImage = [UIImage imageWithColor:shadowColor andSize:size andCornerRadius:cornerRadius];
    
    //Make the rectangular a little bigger than the button
    CGRect rect = CGRectMake(0,
                             0,
                             backImage.size.width + shadowHeight + (shadowHeight/2),
                             backImage.size.height + shadowHeight + (shadowHeight/2));
    
    //Both images are moved away from the borders to show the circular shape (round)
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [backImage drawAtPoint:CGPointMake((shadowHeight/2) + 2.5, shadowHeight)];
    [frontImage drawAtPoint:CGPointMake((shadowHeight/2) + 2.5, shadowHeight/4)];
    buttonImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return buttonImage;
}

+ (UIImage *) circularButtonWithHighlightedColor: (UIColor *) buttonColor
                                       andSize: (CGSize) size
                               andShadowHeight: (CGFloat) shadowHeight
                                andShadowColor: (UIColor *) shadowColor
                               andCornerRadius: (CGFloat) cornerRadius
{
    UIImage *buttonHighlightedImage;
    
    UIImage *frontImage = [UIImage imageWithColor:buttonColor andSize:size andCornerRadius:cornerRadius];
    UIImage *backImage = [UIImage imageWithColor:shadowColor andSize:size andCornerRadius:cornerRadius];
    
    CGRect rect = CGRectMake(0,
                             0,
                             frontImage.size.width + shadowHeight + (shadowHeight/2),
                             frontImage.size.height + shadowHeight + (shadowHeight/2));
    
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [backImage drawAtPoint:CGPointMake((shadowHeight/2) + 2.5, shadowHeight)];
    [frontImage drawAtPoint:CGPointMake((shadowHeight/2) + 2.5, shadowHeight * shadowOffetWhenPressed)];
    buttonHighlightedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return buttonHighlightedImage;
    
}


+ (UIImage *) imageWithColor: (UIColor *) color
                     andSize: (CGSize) size
             andCornerRadius: (CGFloat) cornerRadius
{
    //Draw the image according to the size and color
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //Round the image above according to cornerRadius
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, NO, 0);
    [[UIBezierPath bezierPathWithRoundedRect:imageView.bounds
                                cornerRadius:cornerRadius] addClip];
    [image drawInRect:imageView.bounds];
    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return imageView.image;
}

@end
