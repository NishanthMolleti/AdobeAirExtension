//
//  FlyMobANE.m
//  FlyMobANE
//
//  Created by Ivan Kozlov on 25/11/2016.
//  Copyright © 2016 FlyMob. All rights reserved.
//

#import "FlyMobANE.h"
#import <FlyMobSDK/FlyMobSDK.h>

static FlyMobInterstitial *interstitial;
static FlyMobANE *interstitialDelegate;

static FlyMobRewardedVideo *rewardedVideo;
static FlyMobANE *rewardedVideoDelegate;

static FREContext extensionContext;

@interface FlyMobANE ()
<
    FlyMobInterstitialDelegate,
    FlyMobRewardedVideoDelegate
>

@end

@implementation FlyMobANE

#pragma mark - Interstitial

-(void)interstitialDidLoadAd:(FlyMobInterstitial *)interstitial
{
    FREDispatchStatusEventAsync(extensionContext,
                                (uint8_t *)[@"interstitialDidLoadAd" UTF8String],
                                NULL);
}

-(void)interstitialDidFailToLoadAd:(FlyMobInterstitial *)interstitial error:(NSError *)error
{
    FREDispatchStatusEventAsync(extensionContext,
                                (uint8_t *)[@"interstitialDidFailToLoadAd" UTF8String],
                                NULL);
}

-(void)interstitialDidShow:(FlyMobInterstitial *)interstitial
{
    FREDispatchStatusEventAsync(extensionContext,
                                (uint8_t *)[@"interstitialDidShow" UTF8String],
                                NULL);
}

-(void)interstitialDidClick:(FlyMobInterstitial *)interstitial
{
    FREDispatchStatusEventAsync(extensionContext,
                                (uint8_t *)[@"interstitialDidClick" UTF8String],
                                NULL);
}

-(void)interstitialDidClose:(FlyMobInterstitial *)interstitial
{
    FREDispatchStatusEventAsync(extensionContext,
                                (uint8_t *)[@"interstitialDidClose" UTF8String],
                                NULL);
}

-(void)interstitialDidExpire:(FlyMobInterstitial *)interstitial
{
    FREDispatchStatusEventAsync(extensionContext,
                                (uint8_t *)[@"interstitialDidExpire" UTF8String],
                                NULL);
}

#pragma mark - Rewarded

-(void)rewardedVideoDidLoadAd:(FlyMobRewardedVideo *)rewardedVideo
{
    FREDispatchStatusEventAsync(extensionContext,
                                (uint8_t *)[@"rewardedVideoDidLoadAd" UTF8String],
                                NULL);
}

-(void)rewardedVideoDidFailToLoadAd:(FlyMobRewardedVideo *)rewardedVideo
                              error:(NSError *)error
{
    FREDispatchStatusEventAsync(extensionContext,
                                (uint8_t *)[@"rewardedVideoDidFailToLoadAd" UTF8String],
                                NULL);
}

-(void)rewardedVideoDidShow:(FlyMobRewardedVideo *)rewardedVideo
{
    FREDispatchStatusEventAsync(extensionContext,
                                (uint8_t *)[@"rewardedVideoDidShow" UTF8String],
                                NULL);
}

-(void)rewardedVideoDidComplete:(FlyMobRewardedVideo *)rewardedVideo
{
    FREDispatchStatusEventAsync(extensionContext,
                                (uint8_t *)[@"rewardedVideoDidComplete" UTF8String],
                                NULL);
}

-(void)rewardedVideoDidStart:(FlyMobRewardedVideo *)rewardedVideo
{
    FREDispatchStatusEventAsync(extensionContext,
                                (uint8_t *)[@"rewardedVideoDidStart" UTF8String],
                                NULL);
}

-(void)rewardedVideoDidClose:(FlyMobRewardedVideo *)rewardedVideo
{
    FREDispatchStatusEventAsync(extensionContext,
                                (uint8_t *)[@"rewardedVideoDidClose" UTF8String],
                                NULL);
}

-(void)rewardedVideoDidExpire:(FlyMobRewardedVideo *)rewardedVideo
{
    FREDispatchStatusEventAsync(extensionContext,
                                (uint8_t *)[@"rewardedVideoDidExpire" UTF8String],
                                NULL);
}

@end

#pragma mark - Public methods

#pragma mark - Interstitial

FREObject interstitialInitialize(FREContext context,
                                 void *functionData,
                                 uint32_t argc,
                                 FREObject argv[])
{
    
    int32_t int_zoneID;
    FREGetObjectAsInt32(argv[0], &int_zoneID);
    
    interstitial = [FlyMobInterstitial interstitialWithZoneID:(NSUInteger)int_zoneID];
    interstitialDelegate = [FlyMobANE new];
    
    interstitial.delegate = interstitialDelegate;
    
    return nil;
}

FREObject interstitialLoad(FREContext context,
                           void *functionData,
                           uint32_t argc,
                           FREObject argv[])
{
    if (interstitial)
    {
        [interstitial loadAd];
    }
    
    return nil;
}

FREObject interstitialShow(FREContext context,
                           void *functionData,
                           uint32_t argc,
                           FREObject argv[])
{
    if (interstitial.isReady)
    {
        [interstitial showFromViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
    }
    
    return nil;
}

FREObject interstitialIsReady(FREContext context,
                              void *functionData,
                              uint32_t argc,
                              FREObject argv[])
{
    FREObject isReady = NULL;
    
    FRENewObjectFromBool(interstitial.isReady, &isReady);
    
    return isReady;
}

#pragma mark - Rewarded Video

FREObject rewardedVideoInitialize(FREContext context,
                                  void *functionData,
                                  uint32_t argc,
                                  FREObject argv[])
{
    
    int32_t int_zoneID;
    FREGetObjectAsInt32(argv[0], &int_zoneID);
    
    rewardedVideo = [FlyMobRewardedVideo rewardedVideoWithZoneID:(NSUInteger)int_zoneID];
    rewardedVideoDelegate = [FlyMobANE new];
    
    rewardedVideo.delegate = rewardedVideoDelegate;
    
    return nil;
}

FREObject rewardedVideoLoad(FREContext context,
                            void *functionData,
                            uint32_t argc,
                            FREObject argv[])
{
    if (rewardedVideo)
    {
        [rewardedVideo loadAd];
    }
    
    return nil;
}

FREObject rewardedVideoShow(FREContext context,
                            void *functionData,
                            uint32_t argc,
                            FREObject argv[])
{
    if (rewardedVideo.isReady)
    {
        [rewardedVideo showFromViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
    }
    
    return nil;
}

FREObject rewardedVideoIsReady(FREContext context,
                               void *functionData,
                               uint32_t argc,
                               FREObject argv[])
{
    FREObject isReady = NULL;
    
    FRENewObjectFromBool(rewardedVideo.isReady, &isReady);
    
    return isReady;
}


#pragma mark - Configuration

FREObject setDebugMode(FREContext context,
                       void *functionData,
                       uint32_t argc,
                       FREObject argv[])
{
    
    uint32_t uint_isDebug;
    FREGetObjectAsBool(argv[0], &uint_isDebug);
    
    return nil;
}

FREObject isDebugMode(FREContext context,
                      void *functionData,
                      uint32_t argc,
                      FREObject argv[])
{
    FREObject isDebug = NULL;
    
    FRENewObjectFromBool(NO, &isDebug);
    
    return isDebug;
}

FREObject setCoppa(FREContext context,
                   void *functionData,
                   uint32_t argc,
                   FREObject argv[])
{
    
    uint32_t uint_coppa;
    FREGetObjectAsBool(argv[0], &uint_coppa);
    
    [FLYConfiguration sharedInstance].coppa = (BOOL)uint_coppa;
    
    return nil;
}

FREObject isCoppa(FREContext context,
                  void *functionData,
                  uint32_t argc,
                  FREObject argv[])
{
    FREObject isReady = NULL;
    
    FRENewObjectFromBool([FLYConfiguration sharedInstance].coppa, &isReady);
    
    return isReady;
}

FREObject setDnt(FREContext context,
                 void *functionData,
                 uint32_t argc,
                 FREObject argv[])
{
    
    uint32_t uint_dnt;
    FREGetObjectAsBool(argv[0], &uint_dnt);
    
    [FLYConfiguration sharedInstance].dnt = (BOOL)uint_dnt;
    
    return nil;
}

FREObject isDnt(FREContext context,
                void *functionData,
                uint32_t argc,
                FREObject argv[])
{
    FREObject isDnt = NULL;
    
    FRENewObjectFromBool([FLYConfiguration sharedInstance].dnt, &isDnt);
    
    return isDnt;
}

FREObject setTesting(FREContext context,
                     void *functionData,
                     uint32_t argc,
                     FREObject argv[])
{
    
    uint32_t uint_testing;
    FREGetObjectAsBool(argv[0], &uint_testing);
    
    [FLYConfiguration sharedInstance].testing = (BOOL)uint_testing;
    
    return nil;
}

FREObject isTesting(FREContext context,
                    void *functionData,
                    uint32_t argc,
                    FREObject argv[])
{
    FREObject isTesting = NULL;
    
    FRENewObjectFromBool([FLYConfiguration sharedInstance].testing, &isTesting);
    
    return isTesting;
}

#pragma mark - Private extension stuff

void FlyMobANEContextInitializer(void *extData,
                                 const uint8_t *ctxType,
                                 FREContext ctx,
                                 uint32_t *numFunctionsToTest,
                                 const FRENamedFunction **functionsToSet)
{
    extensionContext = ctx;
    
    *numFunctionsToTest = 16;
    FRENamedFunction *functions = (FRENamedFunction *) malloc(sizeof(FRENamedFunction) * (*numFunctionsToTest));
    
    // Interstitial
    functions[0].name = (const uint8_t*) "interstitialInitialize";
    functions[0].functionData = NULL;
    functions[0].function = &interstitialInitialize;
    
    functions[1].name = (const uint8_t*) "interstitialLoad";
    functions[1].functionData = NULL;
    functions[1].function = &interstitialLoad;
    
    functions[2].name = (const uint8_t*) "interstitialShow";
    functions[2].functionData = NULL;
    functions[2].function = &interstitialShow;
    
    functions[3].name = (const uint8_t*) "interstitialIsReady";
    functions[3].functionData = NULL;
    functions[3].function = &interstitialIsReady;
    
    // Rewarded video
    functions[4].name = (const uint8_t*) "rewardedVideoInitialize";
    functions[4].functionData = NULL;
    functions[4].function = &rewardedVideoInitialize;
    
    functions[5].name = (const uint8_t*) "rewardedVideoLoad";
    functions[5].functionData = NULL;
    functions[5].function = &rewardedVideoLoad;
    
    functions[6].name = (const uint8_t*) "rewardedVideoShow";
    functions[6].functionData = NULL;
    functions[6].function = &rewardedVideoShow;
    
    functions[7].name = (const uint8_t*) "rewardedVideoIsReady";
    functions[7].functionData = NULL;
    functions[7].function = &rewardedVideoIsReady;
    
    // Configuration
    functions[8].name = (const uint8_t*) "setDebugMode";
    functions[8].functionData = NULL;
    functions[8].function = &setDebugMode;
    
    functions[9].name = (const uint8_t*) "isDebugMode";
    functions[9].functionData = NULL;
    functions[9].function = &isDebugMode;
    
    functions[10].name = (const uint8_t*) "setCoppa";
    functions[10].functionData = NULL;
    functions[10].function = &setCoppa;
    
    functions[11].name = (const uint8_t*) "isCoppa";
    functions[11].functionData = NULL;
    functions[11].function = &isCoppa;
    
    functions[12].name = (const uint8_t*) "setDnt";
    functions[12].functionData = NULL;
    functions[12].function = &setDnt;
    
    functions[13].name = (const uint8_t*) "isDnt";
    functions[13].functionData = NULL;
    functions[13].function = &isDnt;
    
    functions[14].name = (const uint8_t*) "setTesting";
    functions[14].functionData = NULL;
    functions[14].function = &setTesting;
    
    functions[15].name = (const uint8_t*) "isTesting";
    functions[15].functionData = NULL;
    functions[15].function = &isTesting;
    
    *functionsToSet = functions;
    
}

void FlyMobANEExtInitializer(void **extDataToSet,
                             FREContextInitializer *ctxInitializerToSet,
                             FREContextFinalizer *ctxFinalizerToSet)
{
    *extDataToSet = NULL;
    *ctxInitializerToSet = &FlyMobANEContextInitializer;
    *ctxFinalizerToSet = &FlyMobANEContextFinalizer;
}

void FlyMobANEExtFinalizer(void *extData)
{
    
}
void FlyMobANEContextFinalizer(FREContext ctx)
{
    
}
