#import "TTAlphaNavController.h"

#define SWITCH_ALPHA_NAVBAR 1   //开启滑动透明

@interface TTAlphaNavController ()
@property (nonatomic, strong) UIView* alphaView;
@property (nonatomic, strong) UIImage* alphaImage;
@end

@implementation TTAlphaNavController
@synthesize barColor = _barColor;
- (void)awakeFromNib
{
#if SWITCH_ALPHA_NAVBAR
    [self setNavBackgroundImage];
#endif
}

- (instancetype)initWithRootViewController:(UIViewController*)rootViewController
{
    if (self = [super initWithRootViewController:rootViewController]) {
#if SWITCH_ALPHA_NAVBAR
        [self setNavBackgroundImage];
#endif
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - 设置navbar 透明配置
/**
 *  配置滑动透明
 */
- (void)setNavBackgroundImage
{
    [self setNavigationBarImage];
    [self setNavBarBackgroundColor:self.barColor];
    self.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
}
#pragma mark - 设置navbar 背景透明图
- (void)setNavigationBarImage
{
    UIImage* backgroundImage = [UIImage new];
    [self.navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsCompact];
    self.navigationBar.layer.masksToBounds = YES;
}
/**
 *  设置navbar背景颜色
 */
- (void)setNavBarBackgroundColor:(UIColor *)color
{
 
    [self.view insertSubview:self.alphaView belowSubview:self.navigationBar];
    if (color) {
        self.alphaView.backgroundColor = color;
    }
    self.navigationBar.layer.masksToBounds = YES;
}

- (UIView*)alphaView
{
    if (!_alphaView) {
        CGRect frame = self.navigationBar.frame;
        frame.size.height += CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
        _alphaView = [[UIView alloc] initWithFrame:frame];
        _alphaView.backgroundColor = self.barColor;
    }
    return _alphaView;
}

- (UIColor*)barColor
{
    if (!_barColor) {
        _barColor = [UIColor whiteColor];
        //        [UIColor colorWithRed: 123/255.f green: 189/255.f blue: 229/255.f alpha: 1.f];
    }
    return _barColor;
}

#pragma mark - setter
- (void)setBarAlpha:(CGFloat)barAlpha
{
    //    if (self.alphaImage) {  }
    _barAlpha = barAlpha;
    self.alphaView.alpha = barAlpha;
}

- (void)setBarColor:(UIColor*)barColor
{
    //    if (self.alphaImage) {  }
    _barColor = barColor;
    _alphaView.backgroundColor = barColor;
}

@end
