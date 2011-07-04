#define TEST_CASE(name) \
@interface name : SenTestCase \
@end \
\
@implementation name \


#define END_TEST_CASE \
@end


#define test(NAME, imp) \
- (void)testNAME imp

#define setup(imp) \
- (void)setUp imp \

#define tearDown(imp) \
- (void)tearDown imp \
