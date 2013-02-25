//
//  AppDelegate.h
//  GoThereLater
//
//  Created by 林 政龍 on 13/1/8.
//  Copyright (c) 2013年 marstudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    NSManagedObjectContext *managedObjectContext;
    NSManagedObjectModel *managedObjectModel;
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
}

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain) NSPersistentStoreCoordinator *persistentStoreCoordinator;

// Sync object with Core Data
- (void) saveContext;

// Return the Documents sub-folder under the project directory
-(NSURL *)applicationDocumentsDirectory;

// return "Persistent Store Coordinator" object for management database
-(NSPersistentStoreCoordinator *) persistentStoreCoordinator;

// Return the object model manager for reading data model
- (NSManagedObjectModel *) managedObjectModel;

// Return Object Context Manager to sync object
- (NSManagedObjectContext *) managedObjectContext;

@end
