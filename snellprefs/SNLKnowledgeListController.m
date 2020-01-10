#include "SNLKnowledgeListController.h"

@implementation SNLKnowledgeListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Knowledge" target:self];
	}

	return _specifiers;
}

@end