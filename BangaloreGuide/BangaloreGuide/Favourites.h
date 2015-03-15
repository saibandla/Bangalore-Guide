//
//  Favourites.h
//  BangaloreGuide
//
//  Created by Sesha Sai Bhargav Bandla on 15/03/15.
//  Copyright (c) 2015 nivansys. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Favourites : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * latitude;
@property (nonatomic, retain) NSString * longitude;
@property (nonatomic, retain) NSData * image;
@property (nonatomic, retain) NSString * address;

@end
