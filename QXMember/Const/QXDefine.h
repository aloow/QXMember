//
//  QXDefine.h
//  DaYiProject
//
//  Created by monda on 2018/7/25.
//  Copyright © 2018 monda. All rights reserved.
//

//设置token
// UserToken_mt()
// setUserToken_mt(NSString* token)

//设置登录账号
// UserAccount_mt();
// setUserAccount_mt(NSString* account);

//检验登录状态
// BOOL UserLoginStatus_mt();
// setLoginStatus_mt(BOOL status);

//用户信息路径
// mt_userInfoPath


#define XFLocalModel 0

#define ISOnline 0

#define isVersion 0

typedef void(^NetWorkCompletehander)(id data, BOOL success, NSString *msg, NSInteger code);
typedef void(^NetWorkPageCompletehander)(id data, BOOL success, NSString *msg, NSInteger code, BOOL isLastPage);

#define  StatusBarHeight CGRectGetHeight([UIApplication sharedApplication].statusBarFrame)

#define NaviGationHeight 44

#define WeakObj(o) try{}@finally{} __weak typeof(o) o##Weak = o;
#define StrongObj(o) autoreleasepool{} __strong typeof(o) o = o##Weak;

#define kDISPATCH_AFTER_BLOCK(delayInSeconds,afterBlock) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC)), dispatch_get_main_queue(), afterBlock);

#define kWeakSelf __weak typeof(self) weakSelf = self

#define outterMargin 15

#define outterMargin25 25

#define outterMargin40 40

#define kBlueBtnMaxYOffset 30

#define iphoneXTitleHeight ([UIDevice isHairScreen] ? 56 : 0)

//#define kVerify_password @"(?!^\\d+$)(?!^[a-zA-Z]+$)[a-zA-Z]{1}[0-9a-zA-Z]{5,19}"
#define kVerify_password @".*"

#define VERSION_KEY @"version"

#define QXTakePhotoOrder @"QXTakePhotoOrder"
#define QXDeletePhotoOrder @"QXDeletePhotoOrder"
#define QXAlertViewOrder @"QXAlertViewOrder"
#define QXUploadCellClickOrder @"QXUploadCellClickOrder"

#define BuildView(className, propertyName, block)\
- (className *)propertyName\
{\
    if(!_##propertyName){\
        _##propertyName = [className new];\
        {block}\
    }\
    return _##propertyName;\
}\

#define ImageName(name) [UIImage imageNamed:name]

#define QXCreatLazyUI(className, propertyName, block)\
- (className *)propertyName\
{\
if(!_##propertyName){\
_##propertyName = block;\
}\
return _##propertyName;\
}\

#define IPHONE_X \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

#define kScale  [UIScreen mainScreen].bounds.size.height/1500

#define singleton_interface(class) +(instancetype)shared##class;

#define singleton_implementation(class) \
static class *_instance; \
\
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        _instance = [super allocWithZone:zone]; \
}); \
\
     return _instance; \
 } \
 \
 + (instancetype)shared##class \
 { \
     if (_instance == nil) { \
         _instance = [[class alloc] init]; \
     } \
 \
     return _instance; \
 }

#define MD(instance, protocol, message)  [(id<protocol>)(instance) message]

#define IVBulidProperty(class, propertyName)\
@property(nonatomic, strong) class *propertyName;

#define IVBulidStringProperty(class, propertyName)\
@property(nonatomic, copy) class *propertyName;

#define IVBulidView(class, propertyName)\
- (class *)propertyName\
{\
if (!_##propertyName) {\
_##propertyName = [[class alloc] init];\
}\
return _##propertyName;\
}\

//屏蔽警告
#define CCSuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

//快速创建cell
#define CVCREAT_CLASS_CELL(class) \
NSString *cellIdentifier = NSStringFromSelector(_cmd);\
class *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];\
if (!cell) {\
cell = [[class alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];\
}\

#define _Msg(NSNotificationName, obj) [[NSNotificationCenter defaultCenter] postNotificationName:NSNotificationName object:obj];

#define _UserDefaults [NSUserDefaults standardUserDefaults]

#define SCREEN_WIDTH     [UIScreen mainScreen].bounds.size.width
#define ReallySize(size) SCREEN_WIDTH/375.0f * size
