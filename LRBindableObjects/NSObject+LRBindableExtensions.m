//
//  NSObject+LRBindableExtensions.m
//  LRBindableObjects
//
//  Created by Luke Redpath on 04/07/2011.
//  Copyright 2011 LJR Software Limited. All rights reserved.
//

#import "NSObject+LRBindableExtensions.h"
#import "NSObject+AssociatedObjects.h"
#import "LRObjectBinding.h"

static const NSString *LRBindableObjectCollectionKey = @"co.uk.lukeredpath.LRBindableObjectCollectionKey";

@implementation NSObject (LRBindableExtensions)

- (void)bind:(NSString *)property toObject:(id)sourceObject withKeyPath:(NSString *)keyPath
{
  LRObjectBinding *binding = [[LRObjectBinding alloc] initWithTargetObject:self property:property sourceObject:sourceObject keyPath:keyPath];
  [[self bindings] addObject:binding];
  [binding release];
}

- (NSMutableArray *)bindings
{
  NSMutableArray *bindings = [self associatedValueForKey:LRBindableObjectCollectionKey];
  if (bindings == nil) {
    bindings = [NSMutableArray array];
    [self associateValue:bindings withKey:LRBindableObjectCollectionKey];
  }
  return bindings;
}

@end
