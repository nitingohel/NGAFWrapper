# NGAFWrapper
Use ApiManager NGAFWrapper class to call an API and get its responce callback using BLOCK in Objective C language of iOS application code.
That Wrapper class created by use of [AFNetworking](https://github.com/AFNetworking/AFNetworking) class so user must be have AFNetworking libray class in project.

# How To Use

* Add Latest AFNetworking(Objective C) Library to your project.
* Now drop This **ApiManager.n** & **.m** File Classes into your project. and add bellow AFNetworking Classes into **ApiManager.h**

###### #import "AFHTTPSessionManager.h"
###### #import "AFNetworking.h"

* Now, to use ApiManager Class,


```objective-c
	//NOTE Type: POST,GET,DELETE,UPDATE etc.
	ApiManager* manager = [[ApiManager alloc]initWithType:@“GET” WithURL:@“YourStringAPI goes here”];
	//NOTE Parameters : Pass parameters required for your api call. (NSDictionary)
	[manager managerWithParameters:@{} HeaderRequired:NO response responseBlock:(id responseObject)^{
	// Success handling here
	}response errorBlock:(NSError* error)^{
	// Error handling here
	}];
