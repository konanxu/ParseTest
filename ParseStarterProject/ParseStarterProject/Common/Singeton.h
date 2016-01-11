//
//  Singeton.h
//  ParseStarterProject
//
//  Created by Konan on 15/10/12.
//
//

#ifndef ParseStarterProject_Singeton_h
#define ParseStarterProject_Singeton_h

#define single_interface(class) + (class *)share##class;

#define single_implementation(class) \
static class *_instance;       \
+ (class *)share##class{   \
if (_instance==nil) {            \
_instance=[[self alloc]init]; \
}                                  \
return _instance; \
}\
+ (instancetype)allocWithZone:(struct _NSZone *)zone{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance=[super allocWithZone:zone];\
});\
return _instance;\
}

#endif
