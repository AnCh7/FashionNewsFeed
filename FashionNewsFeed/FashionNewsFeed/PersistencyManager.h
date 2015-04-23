//
//  PersistencyManager.h
//  FashionNewsFeed
//

#import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
#include <CoreData/CoreData.h>
#import "FCPost.h"
#import "FCAuthor.h"
#import "FCTerms.h"
#import "FCCategory.h"
#import "FCPostTag.h"
#import "DataPost.h"
#import "DataAuthor.h"
#import "DataTerms.h"
#import "DataCategory.h"
#import "DataPostTag.h"

@interface PersistencyManager : NSObject

//@property (strong, nonatomic) NSArray * categoriesArray;
//@property (strong, nonatomic) NSMutableArray *postsArray;

//This methods added to MutableArray inf in current post

//- (BOOL)addCategory:(NSString *)category;
//- (void)addTag:(NSString *)tag;
//- (void)addAttachment:(id) attachment;

//This methods get inf from current post

//- (NSArray *)getCurrentPostCategories;
//- (NSArray *)getCurrentPostTags;
//- (id)getCurrentPostAttachments;

//Core Data manager
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

//Methods return posts from Core Data
//- (NSArray *)getCategoriesFromData;
- (FCPost *)getPostById:(NSUInteger)postId;
- (FCPost *)getPostByCategory:(NSString *)category;

//Method set post to Core Data
- (void) setToDataPost:(FCPost *)post;

- (void)deleteAllObjects;

@end
