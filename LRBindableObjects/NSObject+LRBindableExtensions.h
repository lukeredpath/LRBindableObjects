//
//  NSObject+LRBindableExtensions.h
//  LRBindableObjects
//
//  Created by Luke Redpath on 04/07/2011.
//  Copyright 2011 LJR Software Limited. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (LRBindableExtensions)

- (void)bind:(NSString *)property toObject:(id)targetObject withKeyPath:(NSString *)keyPath;
- (NSMutableArray *)bindings;

@end
