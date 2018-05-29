//
//  ViewController.m
//  SHBaiduFanyi
//
//  Created by HaoSun on 2018/5/29.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "NSString+XHMD5.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.


    /**
     q    TEXT    Y    请求翻译query    UTF-8编码
     from    TEXT    Y    翻译源语言    语言列表(可设置为auto)
     to    TEXT    Y    译文语言    语言列表(不可设置为auto)
     appid    INT    Y    APP ID    可在管理控制台查看
     salt    INT    Y    随机数
     sign    TEXT    Y    签名    appid+q+salt+密钥 的MD5值
     */
    NSString *baseUrl = @"https://api.fanyi.baidu.com/api/trans/vip/translate?";
    NSString *randomStr = [[@"20180529000168870apple15ixI4SXJK5AC6fQmcMpa9" MD5Hash] lowercaseString];
    
    NSString *base2Url = [NSString stringWithFormat:@"%@q=%@&from=auto&to=zh&appid=20180529000168870&salt=15&sign=%@",baseUrl,@"apple",randomStr];
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    [mgr GET:base2Url parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSLog(@"---%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"---%@",error);
    }];
}

@end
