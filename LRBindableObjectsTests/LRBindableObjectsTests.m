//
//  LRBindableObjectsTests.m
//  LRBindableObjectsTests
//
//  Created by Luke Redpath on 04/07/2011.
//  Copyright 2011 LJR Software Limited. All rights reserved.
//

#import "TestSupport.h"
#import "SimpleObject.h"
#import "NSObject+LRBindableExtensions.h"

TEST_CASE(LRBindableObjectsTests)

- (void)testBindingPropertyOfOneObjectToAnotherUpdatesTargetObjectWhenSourceChanges
{
  SimpleObject *objectOne = [SimpleObject new];
  SimpleObject *objectTwo = [SimpleObject new];
  
  [objectOne bind:@"valueOne" toObject:objectTwo withKeyPath:@"valueTwo"];
  [objectTwo setValueTwo:@"some value"];
  
  STAssertEqualObjects(@"some value", objectOne.valueOne, @"Bound value should match");
}

- (void)testBindingPropertyOfOneObjectToAnotherUpdatesSourceObjectWhenTargetChanges
{
  SimpleObject *objectOne = [SimpleObject new];
  SimpleObject *objectTwo = [SimpleObject new];
  
  [objectOne bind:@"valueOne" toObject:objectTwo withKeyPath:@"valueTwo"];
  [objectOne setValueOne:@"some value"];
  
  STAssertEqualObjects(@"some value", objectTwo.valueTwo, @"Bound value should match");
}


END_TEST_CASE