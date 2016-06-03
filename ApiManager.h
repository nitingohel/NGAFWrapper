
#import <Foundation/Foundation.h>


static NSString* const kLoginRegisterURL = @"http://youapitocall/tapp/api/login_register.php?"; //POST
static NSString* const kLoginURL = @"http://youapitocall/tapp/api/login.php"; //POST //


@interface ApiManager : NSObject
{
    NSString* methodType;
    NSURL* baseURL;
}
- (instancetype)initWithType:(NSString*)type WithURL:(NSString*)baseurl;
- (void)managerWithParameters:(NSDictionary*)parameters HeaderRequired:(BOOL)flag responseBlock:(void(^)(id responseObject))response errorBlock:(void(^)(NSError* error))failure;


@end
