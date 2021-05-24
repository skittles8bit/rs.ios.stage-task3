#import "LevelOrderTraversal.h"

@interface TreeNode : NSObject

@property NSNumber *value;
@property TreeNode *lNode;
@property TreeNode *rNode;

- (instancetype)initValue:(NSNumber *)value;
+ (instancetype)treeNodeValue:(NSNumber *)value;
+ (instancetype)treePreorder:(NSArray *)preorder;
- (NSArray<NSArray *> *)traversalLevel;

@end

@implementation TreeNode

- (instancetype)initValue:(NSNumber *)value {
    self = [super init];
    
    if (self) {
        _value = value;
        _lNode = nil;
        _rNode = nil;
    }
    
    return self;
}

+ (instancetype)treeNodeValue:(NSNumber *)value {
    return [[TreeNode alloc] initValue:value];
}

+ (instancetype)treePreorder:(NSArray *)preorder {
    if (preorder.count == 0 || [preorder firstObject] == [NSNull null]) {
        return nil;
    }
    
    TreeNode *treeNode = [[TreeNode alloc] initValue:[preorder firstObject]];
    long rNodePosition = preorder.count;
    int number = 0;
    
    if (preorder.count == 1) {
        return treeNode;
    }
    
    for (long i = 1; i < preorder.count; ++i) {
        if (preorder[i] == [NSNull null]) {
            number++;
        } else {
            if ((number > 0) && (i % 2 == 0) && (number == i >> 1)) {
                rNodePosition = i;
                break;
            }
        }
    }
    
    if (rNodePosition == preorder.count) {
        treeNode.rNode = nil;
    } else {
        treeNode.rNode = [TreeNode treePreorder:
                    [preorder subarrayWithRange:NSMakeRange(rNodePosition, preorder.count - rNodePosition)]];
    }
    
    treeNode.lNode = [TreeNode treePreorder:
                [preorder subarrayWithRange:NSMakeRange(1, rNodePosition - 1)]];
    
    return treeNode;
}


- (NSArray<NSArray *> *)traversalLevel {
    NSMutableArray<NSMutableArray *> *result = [NSMutableArray new];
    
    [result addObject:[NSMutableArray arrayWithObject:self.value]];
    
    if (self.lNode != nil) {
        NSArray<NSArray *> *lNodeRes = [self.lNode traversalLevel];
        
        for (int i = 0; i < lNodeRes.count; ++i) {
            if (i + 1 < result.count) {
                [result[i + 1] addObjectsFromArray:lNodeRes[i]];
            } else {
                [result addObject:[NSMutableArray arrayWithArray:lNodeRes[i]]];
            }
        }
    }
    
    if (self.rNode != nil) {
        NSArray<NSArray *> *rNodeRes = [self.rNode traversalLevel];
        
        for (int i = 0; i < rNodeRes.count; ++i) {
            if (i + 1 < result.count) {
                [result[i + 1] addObjectsFromArray:rNodeRes[i]];
            } else {
                [result addObject:[NSMutableArray arrayWithArray:rNodeRes[i]]];
            }
        }
    }
    
    return result;
}

@end

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    TreeNode *treeNode = [TreeNode treePreorder:tree];
    
    return treeNode == nil ? @[] : [treeNode traversalLevel];
}
