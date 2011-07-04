//
//  LRObjectBinding.m
//  LRBindableObjects
//
//  Created by Luke Redpath on 04/07/2011.
//  Copyright 2011 LJR Software Limited. All rights reserved.
//

#import "LRObjectBinding.h"

@implementation LRObjectBinding

- (id)initWithTargetObject:(id)targetObject property:(NSString *)property sourceObject:(id)sourceObject keyPath:(NSString *)keyPath
{
  if ((self = [super init])) {
    _targetObject = targetObject;
    _sourceObject = [sourceObject retain];
    _keyPath = [keyPath copy];
    _property = [property copy];
    
    [_sourceObject addObserver:self forKeyPath:keyPath options:NSKeyValueObservingOptionNew context:self];
    [_targetObject addObserver:self forKeyPath:property options:NSKeyValueObservingOptionNew context:self];
  }
  return self;
}

- (void)dealloc 
{
  [_sourceObject removeObserver:self forKeyPath:_keyPath];
  [_sourceObject release];
  [_property release];
  [_keyPath release];
  [super dealloc];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
  if (context == self) {
    id newValue = [change objectForKey:NSKeyValueChangeNewKey];
    
    if (object == _sourceObject) {
      if (![[_targetObject valueForKey:_property] isEqual:newValue]) {
        [_targetObject setValue:newValue forKey:_property];
      }
    }
    else {
      if (![[_sourceObject valueForKey:_keyPath] isEqual:newValue]) {
        [_sourceObject setValue:newValue forKeyPath:_keyPath];
      }
    }
  }
}

@end
