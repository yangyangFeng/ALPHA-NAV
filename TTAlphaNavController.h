
// 演示
/*
 [self.tableView addObserver: self forKeyPath: @"contentOffset" options: NSKeyValueObservingOptionNew context: nil];
 
 #pragma mark - getter
 - (TTAlphaNavController *)alphaNavController
 {
 return (TTAlphaNavController *)self.navigationController;
 }
 
 #pragma mark - observe
 - (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
 {
 CGFloat offset = self.tableView.contentOffset.y;
 CGFloat delta = offset / 64.f + 1.f;
 delta = MAX(0, delta);
 [self alphaNavController].barAlpha = MIN(1, delta);
 }
 */

#import <UIKit/UIKit.h>

@interface TTAlphaNavController : UINavigationController
/**
 *  navbar背景颜色,默认白色
 */
@property (nonatomic, strong) UIColor* barColor;
/**
 *  通过检测滑动来改变 透明度
 */
@property (nonatomic, assign) CGFloat barAlpha;

@end
