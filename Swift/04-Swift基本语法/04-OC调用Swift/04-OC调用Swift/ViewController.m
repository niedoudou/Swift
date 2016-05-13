//
//  ViewController.m
//  04-OC调用Swift


#import "ViewController.h"
#import "SwiftModule-Swift.h"

// 在Build Settings 中搜索 Product Module Name
// 然后把里面的内容修改为SwiftModule
// 哪里需要使用Swift中的类，就倒入#import "SwiftModule-Swift.h"就可以使用了

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SXTWeiBoModel *mode = [[SXTWeiBoModel alloc] init];
    mode.name = @"小欢";
    mode.icon = @"icon.png";
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
