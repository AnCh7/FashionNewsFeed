//
//  FCHttpClientTests.m
//  FashionNewsFeed
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "FCHTTPClient.h"

@interface FCHTTPClientTests : XCTestCase {



@end

@implementation FCHTTPClientTests : XCTestCase{
    NSObject* obj;
}

- (FCHTTPClient *)getsharedClient {
    return [FCHTTPClient sharedClient];
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}



- (void)tearDown {
    NSLog(@"hey");
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGetPostWithId
{
    
    XCTestExpectation *expectation =
    [self expectationWithDescription:@"High Expectations"];
    
    FCHTTPClient *client = [FCHTTPClient sharedClient];
    
    [client getPostById:1000
                success:^(NSURLSessionDataTask *task, id responseObject){
                    
                    NSLog(@"The web page is %@ bytes long.", [responseObject description]);
                    XCTAssert([responseObject description] > 0);
                    [expectation fulfill];
                    
                    
                    
                    
                    
                    obj = responseObject;
                    ([responseObject description]);
                    [self debug:responseObject];
                    NSString* str = (NSString* )[responseObject description];
                    XCTAssert(YES, @"%@",str);
                    
                    
                }
                failure:^(NSURLSessionDataTask *task, NSError *error){
                    XCTAssertFalse(@"Failed");
                    
                }];
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}




-(void)debug: (id)response{
    NSLog([response description]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testGetPostWithId {

    XCTestExpectation *expectation = [self expectationWithDescription:@"Testing Async Method"];
    FCHTTPClient *client = [self getsharedClient];
    __block NSData *receivedData = nil;

    [client getPostById:1000
                success:^(NSURLSessionDataTask *task, id responseObject) {
                    receivedData = responseObject;
                    [expectation fulfill];
                }
                failure:^(NSURLSessionDataTask *task, NSError *error) {
                }];

    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"Expectation Failed with error: %@", error);
        }
        else {
            XCTAssertNotNil(receivedData, @"Received data should not be nil");
        }
    }];
}

- (void)testGetCategories {

    XCTestExpectation *expectation = [self expectationWithDescription:@"Testing Async Method"];
    FCHTTPClient *client = [self getsharedClient];
    __block NSData *receivedData = nil;

    [client getCategories:1
                  success:^(NSURLSessionDataTask *task, id responseObject) {
                      receivedData = responseObject;
                      [expectation fulfill];
                  }
                  failure:^(NSURLSessionDataTask *task, NSError *error) {
                  }];

    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"Expectation Failed with error: %@", error);
        }
        else {
            XCTAssertNotNil(receivedData, @"Received data should not be nil");
        }
    }];
}

@end