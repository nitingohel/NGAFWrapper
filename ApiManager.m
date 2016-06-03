
//

#import "ApiManager.h"
#import "AFHTTPSessionManager.h"
#import "AFNetworking.h"


@implementation ApiManager


- (instancetype)initWithType:(NSString *)type WithURL:(NSString *)baseurl{
    self = [super init];
    if(self){
        baseURL = [NSURL URLWithString:baseurl];
        methodType = [[NSString alloc]initWithString:type];
    }
    return self;
}

- (void)managerWithParameters:(NSDictionary *)parameters HeaderRequired:(BOOL)flag responseBlock:(void (^)(id))response errorBlock:(void (^)(NSError *))failure{
    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    configuration.requestCachePolicy = NSURLRequestReloadIgnoringCacheData;
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL sessionConfiguration:configuration];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",nil];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    if([methodType isEqualToString:@"POST"]){
        [manager POST:baseURL.absoluteString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            response(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    }else if([methodType isEqualToString:@"GET"]){
        [manager GET:baseURL.absoluteString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            response(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    }
}



@end