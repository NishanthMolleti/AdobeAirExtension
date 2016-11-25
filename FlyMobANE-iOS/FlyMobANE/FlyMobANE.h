//
//  FlyMobANE.h
//  FlyMobANE
//
//  Created by Ivan Kozlov on 25/11/2016.
//  Copyright © 2016 FlyMob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlashRuntimeExtensions.h"

@interface FlyMobANE : NSObject

@end

void FlyMobANEContextInitializer(void* extData,
                                 const uint8_t* ctxType,
                                 FREContext ctx,
                                 uint32_t* numFunctionsToTest,
                                 const FRENamedFunction** functionsToSet);

void FlyMobANEContextFinalizer(FREContext ctx);

void FlyMobANEExtInitializer(void** extDataToSet,
                             FREContextInitializer* ctxInitializerToSet,
                             FREContextFinalizer* ctxFinalizerToSet);

void FlyMobANEExtFinalizer(void* extData);
