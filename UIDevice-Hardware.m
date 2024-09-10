/*
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook, 6.x Edition
 BSD License, Use at your own risk

 Modified by Eric Horacek for Monospace Ltd. on 2/4/13
 Modified by Jurgis Kirsakmens for E-protect on 2021-01-25
 */

#include <sys/sysctl.h>
#import "UIDevice-Hardware.h"

static NSString * const kiOSSimulatorIdentifier = @"iOS Simulator";

@interface UIDevice (HardwarePrivate)

- (NSString *)modelNameForModelIdentifier:(NSString *)modelIdentifier;

@end


@implementation UIDevice (Hardware)

- (NSString *)getSysInfoByName:(char *)typeSpecifier
{
    size_t size;
    sysctlbyname(typeSpecifier, NULL, &size, NULL, 0);

    char *answer = malloc(size);
    sysctlbyname(typeSpecifier, answer, &size, NULL, 0);

    NSString *results = [NSString stringWithCString:answer encoding: NSUTF8StringEncoding];

    free(answer);
    return results;
}


- (BOOL)isiOSAppOnMac {
    if (@available(iOS 14, macCatalyst 14, macOS 11, *)) {
        return NSProcessInfo.processInfo.isMacCatalystApp || NSProcessInfo.processInfo.isiOSAppOnMac;
    }
    if (@available(iOS 13, macCatalyst 13, macOS 10.15, *)) {
        return NSProcessInfo.processInfo.isMacCatalystApp;
    }
    return NO;
}


- (NSString *)modelIdentifier
{
    if (NSProcessInfo.processInfo.environment[@"SIMULATOR_RUNTIME_VERSION"] != nil) {
        return kiOSSimulatorIdentifier;
    }
    NSString *model = [self getSysInfoByName:"hw.machine"]; // Returns hardware model for iOS device on iOS
    if ([model isEqualToString:@"x86_64"] || [model isEqualToString:@"arm64"] || [self isiOSAppOnMac]) {
        return [self getSysInfoByName:"hw.model"]; // Returns hardware model for Mac on macOS
    }
    return model;
}


- (NSString *)modelName
{
    return [self modelNameForModelIdentifier:[self modelIdentifier]];
}


- (NSString *)modelNameForModelIdentifier:(NSString *)modelIdentifier
{
    
    if ([modelIdentifier hasPrefix:@"Watch"])
    {
        // Apple Watch https://www.theiphonewiki.com/wiki/List_of_Apple_Watches
        if ([modelIdentifier isEqualToString:@"Watch1,1"])    return @"Watch S0 (38mm)"; // 1st generation - Series Zero
        if ([modelIdentifier isEqualToString:@"Watch1,2"])    return @"Watch S0 (42mm)";  // 1st generation - Series Zero
        if ([modelIdentifier isEqualToString:@"Watch2,6"])    return @"Watch S1 (38mm)";
        if ([modelIdentifier isEqualToString:@"Watch2,7"])    return @"Watch S1 (42mm)";
        if ([modelIdentifier isEqualToString:@"Watch2,3"])    return @"Watch S2 (38mm)";
        if ([modelIdentifier isEqualToString:@"Watch2,4"])    return @"Watch S2 (42mm)";
        if ([modelIdentifier isEqualToString:@"Watch3,1"])    return @"Watch S3 (38mm)";
        if ([modelIdentifier isEqualToString:@"Watch3,2"])    return @"Watch S3 (42mm)";
        if ([modelIdentifier isEqualToString:@"Watch3,3"])    return @"Watch S3 Cellular (38mm)";
        if ([modelIdentifier isEqualToString:@"Watch3,4"])    return @"Watch S3 Cellular (42mm)";
        if ([modelIdentifier isEqualToString:@"Watch4,1"])    return @"Watch S4 (40mm)";
        if ([modelIdentifier isEqualToString:@"Watch4,2"])    return @"Watch S4 (44mm)";
        if ([modelIdentifier isEqualToString:@"Watch4,3"])    return @"Watch S4 Cellular (40mm)";
        if ([modelIdentifier isEqualToString:@"Watch4,4"])    return @"Watch S4 Cellular (44mm)";
        if ([modelIdentifier isEqualToString:@"Watch5,1"])    return @"Watch S5 (40mm)";
        if ([modelIdentifier isEqualToString:@"Watch5,2"])    return @"Watch S5 (44mm)";
        if ([modelIdentifier isEqualToString:@"Watch5,3"])    return @"Watch S5 Cellular (40mm)";
        if ([modelIdentifier isEqualToString:@"Watch5,4"])    return @"Watch S5 Cellular (44mm)";
        if ([modelIdentifier isEqualToString:@"Watch5,9"])    return @"Watch SE 1gen (40mm)";
        if ([modelIdentifier isEqualToString:@"Watch5,10"])   return @"Watch SE 1gen (44mm)";
        if ([modelIdentifier isEqualToString:@"Watch5,11"])   return @"Watch SE 1gen Cellular (40mm)";
        if ([modelIdentifier isEqualToString:@"Watch5,12"])   return @"Watch SE 1gen Cellular (44mm)";
        if ([modelIdentifier isEqualToString:@"Watch6,1"])    return @"Watch S6 (40mm)";
        if ([modelIdentifier isEqualToString:@"Watch6,2"])    return @"Watch S6 (44mm)";
        if ([modelIdentifier isEqualToString:@"Watch6,3"])    return @"Watch S6 Cellular (40mm)";
        if ([modelIdentifier isEqualToString:@"Watch6,4"])    return @"Watch S6 Cellular (44mm)";
        if ([modelIdentifier isEqualToString:@"Watch6,6"])    return @"Watch S7 (41mm)";
        if ([modelIdentifier isEqualToString:@"Watch6,7"])    return @"Watch S7 (45mm)";
        if ([modelIdentifier isEqualToString:@"Watch6,8"])    return @"Watch S7 Cellular (41mm)";
        if ([modelIdentifier isEqualToString:@"Watch6,9"])    return @"Watch S7 Cellular (45mm)";
        if ([modelIdentifier isEqualToString:@"Watch6,10"])   return @"Watch SE 2gen (40mm)";
        if ([modelIdentifier isEqualToString:@"Watch6,11"])   return @"Watch SE 2gen (44mm)";
        if ([modelIdentifier isEqualToString:@"Watch6,12"])   return @"Watch SE 2gen Cellular (40mm)";
        if ([modelIdentifier isEqualToString:@"Watch6,13"])   return @"Watch SE 2gen Cellular (44mm)";
        if ([modelIdentifier isEqualToString:@"Watch6,14"])   return @"Watch S8 (41mm)";
        if ([modelIdentifier isEqualToString:@"Watch6,15"])   return @"Watch S8 (45mm)";
        if ([modelIdentifier isEqualToString:@"Watch6,16"])   return @"Watch S8 Cellular (41mm)";
        if ([modelIdentifier isEqualToString:@"Watch6,17"])   return @"Watch S8 Cellular (45mm)";
        if ([modelIdentifier isEqualToString:@"Watch6,18"])   return @"Watch Ultra 1gen";
        if ([modelIdentifier isEqualToString:@"Watch7,1"])   return @"Watch S9 (41mm)";
        if ([modelIdentifier isEqualToString:@"Watch7,2"])   return @"Watch S9 (45mm)";
        if ([modelIdentifier isEqualToString:@"Watch7,3"])   return @"Watch S9 Cellular (41mm)";
        if ([modelIdentifier isEqualToString:@"Watch7,4"])   return @"Watch S9 Cellular (45mm)";
        if ([modelIdentifier isEqualToString:@"Watch7,5"])   return @"Watch Ultra 2gen";
    }

    if ([modelIdentifier hasPrefix:@"iPhone"])
    {
        // iPhone http://theiphonewiki.com/wiki/IPhone
        if ([modelIdentifier isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
        if ([modelIdentifier isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
        if ([modelIdentifier isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
        if ([modelIdentifier isEqualToString:@"iPhone3,1"])    return @"iPhone 4 (GSM)";
        if ([modelIdentifier isEqualToString:@"iPhone3,2"])    return @"iPhone 4 (GSM Rev A)";
        if ([modelIdentifier isEqualToString:@"iPhone3,3"])    return @"iPhone 4 (CDMA)";
        if ([modelIdentifier isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
        if ([modelIdentifier isEqualToString:@"iPhone5,1"])    return @"iPhone 5 (GSM)";
        if ([modelIdentifier isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (Global)";
        if ([modelIdentifier isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
        if ([modelIdentifier isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (Global)";
        if ([modelIdentifier isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM)";
        if ([modelIdentifier isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (Global)";
        if ([modelIdentifier isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
        if ([modelIdentifier isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
        if ([modelIdentifier isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
        if ([modelIdentifier isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
        if ([modelIdentifier isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
        if ([modelIdentifier isEqualToString:@"iPhone9,1"])    return @"iPhone 7";
        if ([modelIdentifier isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus";
        if ([modelIdentifier isEqualToString:@"iPhone9,3"])    return @"iPhone 7";
        if ([modelIdentifier isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus";
        if ([modelIdentifier isEqualToString:@"iPhone10,1"])   return @"iPhone 8";          // US (Verizon), China, Japan
        if ([modelIdentifier isEqualToString:@"iPhone10,2"])   return @"iPhone 8 Plus";     // US (Verizon), China, Japan
        if ([modelIdentifier isEqualToString:@"iPhone10,3"])   return @"iPhone X";          // US (Verizon), China, Japan
        if ([modelIdentifier isEqualToString:@"iPhone10,4"])   return @"iPhone 8";          // AT&T, Global
        if ([modelIdentifier isEqualToString:@"iPhone10,5"])   return @"iPhone 8 Plus";     // AT&T, Global
        if ([modelIdentifier isEqualToString:@"iPhone10,6"])   return @"iPhone X";          // AT&T, Global
        if ([modelIdentifier isEqualToString:@"iPhone11,2"])   return @"iPhone XS";
        if ([modelIdentifier isEqualToString:@"iPhone11,4"])   return @"iPhone XS Max";
        if ([modelIdentifier isEqualToString:@"iPhone11,6"])   return @"iPhone XS Max (China)"; // China dual-sim
        if ([modelIdentifier isEqualToString:@"iPhone11,8"])   return @"iPhone XR";
        if ([modelIdentifier isEqualToString:@"iPhone12,1"])   return @"iPhone 11";
        if ([modelIdentifier isEqualToString:@"iPhone12,3"])   return @"iPhone 11 Pro";
        if ([modelIdentifier isEqualToString:@"iPhone12,5"])   return @"iPhone 11 Pro Max";
        if ([modelIdentifier isEqualToString:@"iPhone12,8"])   return @"iPhone SE 2gen";
        if ([modelIdentifier isEqualToString:@"iPhone13,1"])   return @"iPhone 12 mini";
        if ([modelIdentifier isEqualToString:@"iPhone13,2"])   return @"iPhone 12";
        if ([modelIdentifier isEqualToString:@"iPhone13,3"])   return @"iPhone 12 Pro";
        if ([modelIdentifier isEqualToString:@"iPhone13,4"])   return @"iPhone 12 Pro Max";
        if ([modelIdentifier isEqualToString:@"iPhone14,2"])   return @"iPhone 13 Pro";
        if ([modelIdentifier isEqualToString:@"iPhone14,3"])   return @"iPhone 13 Pro Max";
        if ([modelIdentifier isEqualToString:@"iPhone14,4"])   return @"iPhone 13 mini";
        if ([modelIdentifier isEqualToString:@"iPhone14,5"])   return @"iPhone 13";
        if ([modelIdentifier isEqualToString:@"iPhone14,6"])   return @"iPhone SE 3gen";
        if ([modelIdentifier isEqualToString:@"iPhone14,7"])   return @"iPhone 14";
        if ([modelIdentifier isEqualToString:@"iPhone14,8"])   return @"iPhone 14 Plus";
        if ([modelIdentifier isEqualToString:@"iPhone15,2"])   return @"iPhone 14 Pro";
        if ([modelIdentifier isEqualToString:@"iPhone15,3"])   return @"iPhone 14 Pro Max";
        if ([modelIdentifier isEqualToString:@"iPhone15,4"])   return @"iPhone 15";
        if ([modelIdentifier isEqualToString:@"iPhone15,5"])   return @"iPhone 15 Plus";
        if ([modelIdentifier isEqualToString:@"iPhone16,1"])   return @"iPhone 15 Pro";
        if ([modelIdentifier isEqualToString:@"iPhone16,2"])   return @"iPhone 15 ProMax";
        if ([modelIdentifier isEqualToString:@"iPhone17,3"])   return @"iPhone 16";
        if ([modelIdentifier isEqualToString:@"iPhone17,4"])   return @"iPhone 16 Plus";
        if ([modelIdentifier isEqualToString:@"iPhone17,1"])   return @"iPhone 16 Pro";
        if ([modelIdentifier isEqualToString:@"iPhone17,2"])   return @"iPhone 16 ProMax";
    }

    if ([modelIdentifier hasPrefix:@"iPad"])
    {
        // iPad http://theiphonewiki.com/wiki/IPad
        if ([modelIdentifier isEqualToString:@"iPad1,1"])      return @"iPad (1gen)";
        if ([modelIdentifier isEqualToString:@"iPad2,1"])      return @"iPad (2gen, Wi-Fi)";
        if ([modelIdentifier isEqualToString:@"iPad2,2"])      return @"iPad (2gen, GSM)";
        if ([modelIdentifier isEqualToString:@"iPad2,3"])      return @"iPad (2gen, CDMA)";
        if ([modelIdentifier isEqualToString:@"iPad2,4"])      return @"iPad (2gen, Rev A)";
        if ([modelIdentifier isEqualToString:@"iPad3,1"])      return @"iPad (3gen, Wi-Fi)";
        if ([modelIdentifier isEqualToString:@"iPad3,2"])      return @"iPad (3gen, GSM)";
        if ([modelIdentifier isEqualToString:@"iPad3,3"])      return @"iPad (3gen, Global)";
        if ([modelIdentifier isEqualToString:@"iPad3,4"])      return @"iPad (4gen, Wi-Fi)";
        if ([modelIdentifier isEqualToString:@"iPad3,5"])      return @"iPad (4gen, GSM)";
        if ([modelIdentifier isEqualToString:@"iPad3,6"])      return @"iPad (4gen, Global)";
        if ([modelIdentifier isEqualToString:@"iPad6,11"])     return @"iPad (5gen, Wi-Fi)";
        if ([modelIdentifier isEqualToString:@"iPad6,12"])     return @"iPad (5gen, Cellular)";
        if ([modelIdentifier isEqualToString:@"iPad7,5"])      return @"iPad (6gen, WiFi)";
        if ([modelIdentifier isEqualToString:@"iPad7,6"])      return @"iPad (6gen, Cellular)";
        if ([modelIdentifier isEqualToString:@"iPad7,11"])     return @"iPad (7gen, WiFi)";
        if ([modelIdentifier isEqualToString:@"iPad7,12"])     return @"iPad (7gen, Cellular)";
        if ([modelIdentifier isEqualToString:@"iPad11,6"])     return @"iPad (8gen, WiFi)";
        if ([modelIdentifier isEqualToString:@"iPad11,7"])     return @"iPad (8gen, Cellular)";
        if ([modelIdentifier isEqualToString:@"iPad12,1"])     return @"iPad (9gen, WiFi)";
        if ([modelIdentifier isEqualToString:@"iPad12,2"])     return @"iPad (9gen, Cellular)";
        if ([modelIdentifier isEqualToString:@"iPad13,18"])    return @"iPad (10gen, WiFi)";
        if ([modelIdentifier isEqualToString:@"iPad13,19"])    return @"iPad (10gen, Cellular)";

        // iPad Air: https://theapplewiki.com/wiki/Models
        if ([modelIdentifier isEqualToString:@"iPad4,1"])      return @"iPad Air (1gen, Wi-Fi)";
        if ([modelIdentifier isEqualToString:@"iPad4,2"])      return @"iPad Air (1gen, Cellular)";
        if ([modelIdentifier isEqualToString:@"iPad5,3"])      return @"iPad Air (2gen, Wi-Fi)";
        if ([modelIdentifier isEqualToString:@"iPad5,4"])      return @"iPad Air (2gen, Cellular)";
        if ([modelIdentifier isEqualToString:@"iPad11,3"])     return @"iPad Air (3gen, Wi-Fi)";
        if ([modelIdentifier isEqualToString:@"iPad11,4"])     return @"iPad Air (3gen, Cellular)";
        if ([modelIdentifier isEqualToString:@"iPad13,1"])     return @"iPad Air (4gen, Wi-Fi)";
        if ([modelIdentifier isEqualToString:@"iPad13,2"])     return @"iPad Air (4gen, Cellular)";
        if ([modelIdentifier isEqualToString:@"iPad13,16"])    return @"iPad Air (5gen, Wi-Fi)";
        if ([modelIdentifier isEqualToString:@"iPad13,17"])    return @"iPad Air (5gen, Cellular)";
        if ([modelIdentifier isEqualToString:@"iPad14,8"])     return @"iPad Air 11″(M2, Wi-Fi)";
        if ([modelIdentifier isEqualToString:@"iPad14,9"])     return @"iPad Air 11″(M2, Cellular)";
        if ([modelIdentifier isEqualToString:@"iPad14,10"])    return @"iPad Air 13″(M2, Wi-Fi)";
        if ([modelIdentifier isEqualToString:@"iPad14,11"])    return @"iPad Air 13″(M2, Cellular)";
        
        // iPad Mini http://theiphonewiki.com/wiki/IPad_mini
        if ([modelIdentifier isEqualToString:@"iPad2,5"])      return @"iPad mini (1gen, Wi-Fi)";
        if ([modelIdentifier isEqualToString:@"iPad2,6"])      return @"iPad mini (1gen, GSM)";
        if ([modelIdentifier isEqualToString:@"iPad2,7"])      return @"iPad mini (1gen, Global)";
        if ([modelIdentifier isEqualToString:@"iPad4,4"])      return @"iPad mini (2gen, Wi-Fi)";
        if ([modelIdentifier isEqualToString:@"iPad4,5"])      return @"iPad mini (2gen, Cellular)";
        if ([modelIdentifier isEqualToString:@"iPad4,6"])      return @"iPad mini (2gen, Cellular)"; // TD-LTE model see https://support.apple.com/en-us/HT201471#iPad-mini2
        if ([modelIdentifier isEqualToString:@"iPad4,7"])      return @"iPad mini (3gen, Wi-Fi)";
        if ([modelIdentifier isEqualToString:@"iPad4,8"])      return @"iPad mini (3gen, Cellular)";
        if ([modelIdentifier isEqualToString:@"iPad4,9"])      return @"iPad mini (3gen, Cellular)";
        if ([modelIdentifier isEqualToString:@"iPad5,1"])      return @"iPad mini (4gen, Wi-Fi)";
        if ([modelIdentifier isEqualToString:@"iPad5,2"])      return @"iPad mini (4gen, Cellular)";
        if ([modelIdentifier isEqualToString:@"iPad11,1"])     return @"iPad mini (5gen, Wi-Fi)";
        if ([modelIdentifier isEqualToString:@"iPad11,2"])     return @"iPad mini (5gen, Cellular)";
        if ([modelIdentifier isEqualToString:@"iPad14,1"])     return @"iPad mini (6gen, Wi-Fi)";
        if ([modelIdentifier isEqualToString:@"iPad14,2"])     return @"iPad mini (6gen, Cellular)";

        // iPad Pro
        if ([modelIdentifier isEqualToString:@"iPad6,3"])      return @"iPad Pro 9.7″ (Wi-Fi)"; // http://pdadb.net/index.php?m=specs&id=9938&c=apple_ipad_pro_9.7-inch_a1673_wifi_32gb_apple_ipad_6,3
        if ([modelIdentifier isEqualToString:@"iPad6,4"])      return @"iPad Pro 9.7″ (Cellular)"; // http://pdadb.net/index.php?m=specs&id=9981&c=apple_ipad_pro_9.7-inch_a1675_td-lte_32gb_apple_ipad_6,4
        if ([modelIdentifier isEqualToString:@"iPad6,7"])      return @"iPad Pro 12.9″ (1gen, Wi-Fi)"; // http://pdadb.net/index.php?m=specs&id=8960&c=apple_ipad_pro_wifi_a1584_128gb
        if ([modelIdentifier isEqualToString:@"iPad6,8"])      return @"iPad Pro 12.9″ (1gen, Cellular)"; // http://pdadb.net/index.php?m=specs&id=8965&c=apple_ipad_pro_td-lte_a1652_32gb_apple_ipad_6,8
        if ([modelIdentifier isEqualToString:@"iPad7,1"])      return @"iPad Pro 12.9″ (2gen, Wi-Fi)";
        if ([modelIdentifier isEqualToString:@"iPad7,2"])      return @"iPad Pro 12.9″ (2gen, Cellular)";
        if ([modelIdentifier isEqualToString:@"iPad7,3"])      return @"iPad Pro 10.5″ (Wi-Fi)";
        if ([modelIdentifier isEqualToString:@"iPad7,4"])      return @"iPad Pro 10.5″ (Cellular)";
        if ([modelIdentifier isEqualToString:@"iPad8,1"])      return @"iPad Pro 11″ (1gen, Wi-Fi)";
        if ([modelIdentifier isEqualToString:@"iPad8,2"])      return @"iPad Pro 11″ (1gen, Wi-Fi)"; // 6GB RAM version, up to 1TB disk
        if ([modelIdentifier isEqualToString:@"iPad8,3"])      return @"iPad Pro 11″ (1gen, Cellular)";
        if ([modelIdentifier isEqualToString:@"iPad8,4"])      return @"iPad Pro 11″ (1gen, Cellular)"; // 6GB RAM version, up to 1TB disk
        if ([modelIdentifier isEqualToString:@"iPad8,5"])      return @"iPad Pro 12.9″ (3gen, Wi-Fi)";
        if ([modelIdentifier isEqualToString:@"iPad8,6"])      return @"iPad Pro 12.9″ (3gen, Wi-Fi)";  // 6GB RAM version, up to 1TB disk. Or Catalyst app running on Apple Silicon Mac.
        if ([modelIdentifier isEqualToString:@"iPad8,7"])      return @"iPad Pro 12.9″ (3gen, Cellular)";
        if ([modelIdentifier isEqualToString:@"iPad8,8"])      return @"iPad Pro 12.9″ (3gen, Cellular)"; // 6GB RAM version, up to 1TB disk
        if ([modelIdentifier isEqualToString:@"iPad8,9"])      return @"iPad Pro 11″ (2gen, Wi-Fi)";
        if ([modelIdentifier isEqualToString:@"iPad8,10"])     return @"iPad Pro 11″ (2gen, Cellular)";
        if ([modelIdentifier isEqualToString:@"iPad8,11"])     return @"iPad Pro 12.9″ (4gen, Wi-Fi)";
        if ([modelIdentifier isEqualToString:@"iPad8,12"])     return @"iPad Pro 12.9″ (4gen, Cellular)";
        if ([modelIdentifier isEqualToString:@"iPad13,4"])     return @"iPad Pro 11″ (M1, Wi-Fi)";
        if ([modelIdentifier isEqualToString:@"iPad13,5"])     return @"iPad Pro 11″ (M1, Cellular)"; // Cellular with mmWave (US) version
        if ([modelIdentifier isEqualToString:@"iPad13,6"])     return @"iPad Pro 11″ (M1, Cellular)"; // Global version
        if ([modelIdentifier isEqualToString:@"iPad13,7"])     return @"iPad Pro 11″ (M1, Cellular)"; // China version
        if ([modelIdentifier isEqualToString:@"iPad13,8"])     return @"iPad Pro 12.9″ (M1, Wi-Fi)";
        if ([modelIdentifier isEqualToString:@"iPad13,9"])     return @"iPad Pro 12.9″ (M1, Cellular)"; // Cellular with mmWave (US) version
        if ([modelIdentifier isEqualToString:@"iPad13,10"])    return @"iPad Pro 12.9″ (M1, Cellular)"; // Global version
        if ([modelIdentifier isEqualToString:@"iPad13,11"])    return @"iPad Pro 12.9″ (M1, Cellular)"; // China version
        if ([modelIdentifier isEqualToString:@"iPad14,3"])     return @"iPad Pro 11″ (M2, Wi-Fi)";
        if ([modelIdentifier isEqualToString:@"iPad14,4"])     return @"iPad Pro 11″ (M2, Cellular)";
        if ([modelIdentifier isEqualToString:@"iPad14,5"])     return @"iPad Pro 12.9″ (M2, Wi-Fi)";
        if ([modelIdentifier isEqualToString:@"iPad14,6"])     return @"iPad Pro 12.9″ (M2, Cellular)";
        if ([modelIdentifier isEqualToString:@"iPad16,3"])     return @"iPad Pro 11″ (M4, Wi-Fi)";
        if ([modelIdentifier isEqualToString:@"iPad16,4"])     return @"iPad Pro 11″ (M4, Cellular)";
        if ([modelIdentifier isEqualToString:@"iPad16,5"])     return @"iPad Pro 13″ (M4, Wi-Fi)";
        if ([modelIdentifier isEqualToString:@"iPad16,6"])     return @"iPad Pro 13″ (M4, Cellular)";
    }
    
    
    if ([modelIdentifier hasPrefix:@"RealityDevice"])
    {
        // https://appledb.dev/device/identifier/RealityDevice14,1
        if ([modelIdentifier isEqualToString:@"RealityDevice14,1"]) return @"Vision Pro (1gen)";
    }
    
         
    if ([modelIdentifier hasPrefix:@"iPod"])
    {
        // iPod http://theiphonewiki.com/wiki/IPod
        if ([modelIdentifier isEqualToString:@"iPod1,1"])      return @"iPod touch (1gen)";
        if ([modelIdentifier isEqualToString:@"iPod2,1"])      return @"iPod touch (2gen)";
        if ([modelIdentifier isEqualToString:@"iPod3,1"])      return @"iPod touch (3gen)";
        if ([modelIdentifier isEqualToString:@"iPod4,1"])      return @"iPod touch (4gen)";
        if ([modelIdentifier isEqualToString:@"iPod5,1"])      return @"iPod touch (5gen)";
        if ([modelIdentifier isEqualToString:@"iPod7,1"])      return @"iPod touch (6gen)";
        if ([modelIdentifier isEqualToString:@"iPod9,1"])      return @"iPod touch (7gen)";
    }

    if ([modelIdentifier hasPrefix:@"AppleTV"])
    {
        // Apple TV https://www.theiphonewiki.com/wiki/Apple_TV
        if ([modelIdentifier isEqualToString:@"AppleTV1,1"])      return @"Apple TV (1gen)";
        if ([modelIdentifier isEqualToString:@"AppleTV2,1"])      return @"Apple TV (2gen)";
        if ([modelIdentifier isEqualToString:@"AppleTV3,1"])      return @"Apple TV (3gen)";
        if ([modelIdentifier isEqualToString:@"AppleTV3,2"])      return @"Apple TV (3gen)"; // small, incremental update over 3,1
        if ([modelIdentifier isEqualToString:@"AppleTV5,3"])      return @"Apple TV (4gen)";
        if ([modelIdentifier isEqualToString:@"AppleTV6,2"])      return @"Apple TV 4K (1gen)";
        if ([modelIdentifier isEqualToString:@"AppleTV11,1"])     return @"Apple TV 4K (2gen)";
        if ([modelIdentifier isEqualToString:@"AppleTV14,1"])     return @"Apple TV 4K (3gen)";
    }

    // Mac (return only device class, not particular model) https://everymac.com/systems/by_capability/mac-specs-by-machine-model-machine-id.html
    if ([modelIdentifier hasPrefix:@"iMacPro"])            return @"iMac Pro";
    if ([modelIdentifier hasPrefix:@"iMac"])               return @"iMac";
    if ([modelIdentifier hasPrefix:@"Macmini"])            return @"Mac Mini";
    if ([modelIdentifier hasPrefix:@"MacBookPro"])         return @"MacBook Pro";
    if ([modelIdentifier hasPrefix:@"MacBookAir"])         return @"Macbook Air";
    if ([modelIdentifier hasPrefix:@"MacBook"])            return @"MacBook";
    if ([modelIdentifier hasPrefix:@"Xserve"])             return @"Xserve";

    if ([modelIdentifier hasPrefix:@"Mac14,3"]  || // Mac Mini M2
        [modelIdentifier hasPrefix:@"Mac14,12"])   // Mac Mini M2 Pro
        return @"Mac Mini";
    
    if ([modelIdentifier hasPrefix:@"Mac15,4"]  || // iMac M3, 8GPU
        [modelIdentifier hasPrefix:@"Mac15,5"])    // iMac M3, 10GPU
        return @"Mac Mini";

    if ([modelIdentifier hasPrefix:@"Mac14,7"]   || // MacBook Pro (M2) 13"
        [modelIdentifier hasPrefix:@"Mac14,5"]   || // MacBook Pro (M2 Max) 14"
        [modelIdentifier hasPrefix:@"Mac14,6"]   || // MacBook Pro (M2 Max) 16"
        [modelIdentifier hasPrefix:@"Mac14,9"]   || // MacBook Pro (M2 Pro) 14"
        [modelIdentifier hasPrefix:@"Mac14,10"]  || // MacBook Pro (M2 Pro) 16"
        [modelIdentifier hasPrefix:@"Mac15,3"]   || // MacBook Pro (M3) 14"
        [modelIdentifier hasPrefix:@"Mac15,6"]   || // MacBook Pro (M3 Pro) 14"
        [modelIdentifier hasPrefix:@"Mac15,7"]   || // MacBook Pro (M3 Pro) 16"
        [modelIdentifier hasPrefix:@"Mac15,8"]   || // MacBook Pro (M3 Max, 16CPU) 14"
        [modelIdentifier hasPrefix:@"Mac15,9"]   || // MacBook Pro (M3 Max, 16CPU) 16"
        [modelIdentifier hasPrefix:@"Mac15,10"]  || // MacBook Pro (M3 Max, 14CPU) 14""
        [modelIdentifier hasPrefix:@"Mac15,11"])    // MacBook Pro (M3 Max, 14CPU) 14""
        return @"MacBook Pro";
    
    if ([modelIdentifier hasPrefix:@"Mac14,2"]  || // MacBook Air M2, 13"
        [modelIdentifier hasPrefix:@"Mac14,15"] || // MacBook Air M2, 15"
        [modelIdentifier hasPrefix:@"Mac15,12"] || // MacBook Air M3, 13"
        [modelIdentifier hasPrefix:@"Mac15,13"])   // MacBook Air M3, 15"
        return @"Macbook Air";
    
    if ([modelIdentifier hasPrefix:@"Mac13"]    || // Mac13,1 = Max Studio M1 Max, Mac13,2 = Max Studio M1 Ultra
        [modelIdentifier hasPrefix:@"Mac14,13"] || // Mac Studio M2 Max
        [modelIdentifier hasPrefix:@"Mac14,14"])   // Mac Studio M2 Ultra
        return @"Mac Studio";

    if ([modelIdentifier hasPrefix:@"MacPro"] ||  // Intel Mac Pro
        [modelIdentifier hasPrefix:@"Mac14,8"])   // Mac Pro M2 Ultra
        return @"Mac Pro";

    
    // Simulator
    if ([modelIdentifier isEqualToString:kiOSSimulatorIdentifier] || [modelIdentifier hasSuffix:@"86"] || [modelIdentifier isEqual:@"x86_64"])
    {
        BOOL smallerScreen = ([[UIScreen mainScreen] bounds].size.width < 768.0);
        return (smallerScreen ? @"iPhone Simulator" : @"iPad Simulator");
    }

    return modelIdentifier;
}


- (UIDeviceFamily) deviceFamily
{
    NSString *modelIdentifier = [self modelIdentifier];
    if ([modelIdentifier hasPrefix:@"iPhone"]) return UIDeviceFamilyiPhone;
    if ([modelIdentifier hasPrefix:@"iPod"]) return UIDeviceFamilyiPod;
    if ([modelIdentifier hasPrefix:@"iPad"]) return UIDeviceFamilyiPad;
    if ([modelIdentifier hasPrefix:@"AppleTV"]) return UIDeviceFamilyAppleTV;
    if ([modelIdentifier hasPrefix:@"Watch"]) return UIDeviceFamilyWatch;
    if ([modelIdentifier hasPrefix:@"RealityDevice"]) return UIDeviceFamilyVision;
    if ([modelIdentifier containsString:@"Mac"] || [modelIdentifier hasPrefix:@"Xserve"]) return UIDeviceFamilyMac;
    return UIDeviceFamilyUnknown;
}

@end
