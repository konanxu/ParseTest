//
//  IntroduceAnimationViewComtroller.m
//  ParseStarterProject
//
//  Created by Konan on 15/10/22.
//
//

#import "IntroduceAnimationViewComtroller.h"

#import "UIColor+EX.h"
#import <NYXImagesKit.h>
#import <Masonry.h>

#define kDevice_Is_iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define kScreen_Bounds [UIScreen mainScreen].bounds
#define kScreen_Height [UIScreen mainScreen].bounds.size.height
#define kScreen_Width [UIScreen mainScreen].bounds.size.width
#define kPaddingLeftWidth 15.0
#define kLoginPaddingLeftWidth 18.0
#define kMySegmentControl_Height 44.0
#define kMySegmentControlIcon_Height 70.0
#define kScaleFrom_iPhone5_Desgin(_X_) (_X_ * (kScreen_Width/320))

@interface IntroduceAnimationViewComtroller()
@property (nonatomic,strong)NSMutableDictionary *iconDict , *tipsDict;
@property (nonatomic,assign)NSUInteger numberOfPages;
@end

@implementation IntroduceAnimationViewComtroller

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.numberOfPages=7;
        
        _iconDict = [@{
                       @"0_image" : @"intro_icon_6",
                       @"1_image" : @"intro_icon_0",
                       @"2_image" : @"intro_icon_1",
                       @"3_image" : @"intro_icon_2",
                       @"4_image" : @"intro_icon_3",
                       @"5_image" : @"intro_icon_4",
                       @"6_image" : @"intro_icon_5",
                       } mutableCopy];
        _tipsDict = [@{
                       @"1_image" : @"intro_tip_0",
                       @"2_image" : @"intro_tip_1",
                       @"3_image" : @"intro_tip_2",
                       @"4_image" : @"intro_tip_3",
                       @"5_image" : @"intro_tip_4",
                       @"6_image" : @"intro_tip_5",
                       } mutableCopy];
    }
    return self;
}

- (NSString *)imageKeyForIndex:(NSInteger)index{
    return [NSString stringWithFormat:@"%ld_image",index];
}
- (NSString *)viewKeyForIndex:(NSInteger)index{
    return [NSString stringWithFormat:@"%ld_view",index];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"0xf1f1f1"];
    [self configureViews];
    [self configureAnimations];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
}

- (void)viewWillDisAppear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

//- (BOOL)shouldAutorotate{
//    
//}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self animateCurrentFrame];
    NSInteger nearestPage = floorf(self.pageOffset+0.5);
}
- (void)configureViews{
//    self configu
    
    CGFloat scaleFactor = 1.0;
    CGFloat desginHeight = 667.0;
    if (!kDevice_Is_iPhone6 && !kDevice_Is_iPhone6Plus) {
        scaleFactor = kScreen_Height/desginHeight;
    }
    
    
    for (int i = 0 ; i < 7; i++) {
        NSString *imageKey = [self imageKeyForIndex:i];
        NSString *viewKey = [self viewKeyForIndex:i];
        NSString *iconImageName =[self.iconDict objectForKey:imageKey];
        NSString *tipImageName =[self.tipsDict objectForKey:imageKey];
        if (iconImageName) {
            UIImage *iconImage =[UIImage imageNamed:iconImageName];
            if (iconImage) {
                iconImage = scaleFactor!=1.0? [iconImage scaleByFactor:scaleFactor] : iconImage;
                UIImageView *iconView = [[UIImageView alloc] initWithImage:iconImage];
                [self.contentView addSubview:iconView];
                [self.iconDict setObject:iconView forKey:viewKey];
            }
        }
        if (tipImageName) {
            UIImage *tipImage =[UIImage imageNamed:tipImageName];
            if (tipImage) {
                tipImage= scaleFactor !=1.0 ?[tipImage scaleByFactor:scaleFactor]:tipImage;
                UIImageView *tipView =[[UIImageView alloc] initWithImage:tipImage];
                [self.contentView addSubview:tipView];
                [self.tipsDict setValue:tipView forKey:viewKey];
            }
        }
    }
    
    
    
}
- (void)configureAnimations{
    [self configureTipAndTitleViewAnimations];
}
- (void)configureTipAndTitleViewAnimations{
    for (int index =0; index<7; index++) {
        NSString *viewKey= [self viewKeyForIndex:index];
        UIView *iconView =[self.iconDict objectForKey:viewKey];
        UIView *tipView =[self.tipsDict objectForKey:viewKey];
        if (iconView) {
            if (index==0) {
                [self keepView:iconView onPages:@[@(index+1),@(index)] atTimes:@[@(index-1),@(index)]];
                [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(kScreen_Height/7);
                }];
            }else{
                [self keepView:iconView onPage:index];
                [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerY.mas_equalTo(-kScreen_Height/6);
                }];
            }
            IFTTTAlphaAnimation *iconAlphaAnimation =[IFTTTAlphaAnimation animationWithView:iconView];
            [iconAlphaAnimation addKeyframeForTime:index-0.5 alpha:0.f];
            [iconAlphaAnimation addKeyframeForTime:index alpha:1.f];
            [iconAlphaAnimation addKeyframeForTime:index+0.5 alpha:0.f];
            [self.animator addAnimation:iconAlphaAnimation];
        }
        if (tipView) {
            [self keepView:tipView onPages:@[@(index+1),@(index),@(index-1)] atTimes:@[@(index -1),@(index),@(index+1)]];
            IFTTTAlphaAnimation *tipAlphaAnimation =[IFTTTAlphaAnimation animationWithView:tipView];
            [tipAlphaAnimation addKeyframeForTime:index-0.5 alpha:0.f];
            [tipAlphaAnimation addKeyframeForTime:index alpha:1.f];
            [tipAlphaAnimation addKeyframeForTime:index+0.5 alpha:0.f];
            [self.animator addAnimation:tipAlphaAnimation];
            [tipView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(iconView.mas_bottom).offset(kScaleFrom_iPhone5_Desgin(45));
            }];
        }
    }
    
}





@end
