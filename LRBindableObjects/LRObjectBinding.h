//
//  LRObjectBinding.h
//  LRBindableObjects
//
//  Created by Luke Redpath on 04/07/2011.
//  Copyright 2011 LJR Software Limited. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LRObjectBinding : NSObject
{
  id _sourceObject;
  id _targetObject;
  NSString *_property;
  NSString *_keyPath;
}
- (id)initWithTargetObject:(id)targetObject property:(NSString *)property sourceObject:(id)sourceObject keyPath:(NSString *)keyPath;
@end
