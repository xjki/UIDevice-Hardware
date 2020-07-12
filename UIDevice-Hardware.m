/*
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook, 6.x Edition
 BSD License, Use at your own risk

 Modified by Eric Horacek for Monospace Ltd. on 2/4/13
 */

#include <sys/sysctl.h>
#import "UIDevice-Hardware.h"

static NSString * const kiOSSimulatorIdentifier = @"iOS Simulator";

@interface UIDevice (Hardward)

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

- (NSString *)modelIdentifier
{
    if (NSProcessInfo.processInfo.environment[@"SIMULATOR_RUNTIME_VERSION"] != nil) {
        return kiOSSimulatorIdentifier;
    }
    NSString *model = [self getSysInfoByName:"hw.machine"]; // Returns hardware model for iOS devices
    if ([model isEqualToString:@"x86_64"]) {
         // Returns hardware model for Intel Mac devices (Mac OS 10.15)
        return [self getSysInfoByName:"hw.model"];
    }
    return model;
}

- (NSString *)modelName
{
    return [self modelNameForModelIdentifier:[self modelIdentifier]];
}

- (NSString *)modelNameForModelIdentifier:(NSString *)modelIdentifier
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
    if ([modelIdentifier isEqualToString:@"iPhone12,8"])   return @"iPhone SE 2G";

    // iPad http://theiphonewiki.com/wiki/IPad

    if ([modelIdentifier isEqualToString:@"iPad1,1"])      return @"iPad 1G";
    if ([modelIdentifier isEqualToString:@"iPad2,1"])      return @"iPad 2 (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([modelIdentifier isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([modelIdentifier isEqualToString:@"iPad2,4"])      return @"iPad 2 (Rev A)";
    if ([modelIdentifier isEqualToString:@"iPad3,1"])      return @"iPad 3 (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM)";
    if ([modelIdentifier isEqualToString:@"iPad3,3"])      return @"iPad 3 (Global)";
    if ([modelIdentifier isEqualToString:@"iPad3,4"])      return @"iPad 4 (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad3,5"])      return @"iPad 4 (GSM)";
    if ([modelIdentifier isEqualToString:@"iPad3,6"])      return @"iPad 4 (Global)";
    if ([modelIdentifier isEqualToString:@"iPad6,11"])     return @"iPad (5th gen) (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad6,12"])     return @"iPad (5th gen) (Cellular)";

    if ([modelIdentifier isEqualToString:@"iPad4,1"])      return @"iPad Air (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad5,3"])      return @"iPad Air 2 (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad5,4"])      return @"iPad Air 2 (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad11,3"])     return @"iPad Air 3 (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad11,4"])     return @"iPad Air 3 (Cellular)";
    
    if ([modelIdentifier isEqualToString:@"iPad7,5"])      return @"iPad 6G (WiFi)";
    if ([modelIdentifier isEqualToString:@"iPad7,6"])      return @"iPad 6G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad7,11"])     return @"iPad 7G (WiFi)";
    if ([modelIdentifier isEqualToString:@"iPad7,12"])     return @"iPad 7G (Cellular)";


    // iPad Mini http://theiphonewiki.com/wiki/IPad_mini

    if ([modelIdentifier isEqualToString:@"iPad2,5"])      return @"iPad mini 1G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad2,6"])      return @"iPad mini 1G (GSM)";
    if ([modelIdentifier isEqualToString:@"iPad2,7"])      return @"iPad mini 1G (Global)";
    if ([modelIdentifier isEqualToString:@"iPad4,4"])      return @"iPad mini 2G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad4,5"])      return @"iPad mini 2G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad4,6"])      return @"iPad mini 2G (Cellular)"; // TD-LTE model see https://support.apple.com/en-us/HT201471#iPad-mini2
    if ([modelIdentifier isEqualToString:@"iPad4,7"])      return @"iPad mini 3G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad4,8"])      return @"iPad mini 3G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad4,9"])      return @"iPad mini 3G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad5,1"])      return @"iPad mini 4G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad5,2"])      return @"iPad mini 4G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad11,1"])     return @"iPad mini 5G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad11,2"])     return @"iPad mini 5G (Cellular)";

    // iPad Pro https://www.theiphonewiki.com/wiki/IPad_Pro

    if ([modelIdentifier isEqualToString:@"iPad6,3"])      return @"iPad Pro (9.7 inch) 1G (Wi-Fi)"; // http://pdadb.net/index.php?m=specs&id=9938&c=apple_ipad_pro_9.7-inch_a1673_wifi_32gb_apple_ipad_6,3
    if ([modelIdentifier isEqualToString:@"iPad6,4"])      return @"iPad Pro (9.7 inch) 1G (Cellular)"; // http://pdadb.net/index.php?m=specs&id=9981&c=apple_ipad_pro_9.7-inch_a1675_td-lte_32gb_apple_ipad_6,4
    if ([modelIdentifier isEqualToString:@"iPad6,7"])      return @"iPad Pro (12.9 inch) 1G (Wi-Fi)"; // http://pdadb.net/index.php?m=specs&id=8960&c=apple_ipad_pro_wifi_a1584_128gb
    if ([modelIdentifier isEqualToString:@"iPad6,8"])      return @"iPad Pro (12.9 inch) 1G (Cellular)"; // http://pdadb.net/index.php?m=specs&id=8965&c=apple_ipad_pro_td-lte_a1652_32gb_apple_ipad_6,8
    if ([modelIdentifier isEqualToString:@"iPad7,1"])      return @"iPad Pro (12.9 inch) 2G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad7,2"])      return @"iPad Pro (12.9 inch) 2G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad7,3"])      return @"iPad Pro (10.5 inch) 1G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad7,4"])      return @"iPad Pro (10.5 inch) 1G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad8,1"])      return @"iPad Pro (11 inch) (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad8,2"])      return @"iPad Pro (11 inch) (Wi-Fi)"; // 6GB RAM version, up to 1TB disk
    if ([modelIdentifier isEqualToString:@"iPad8,3"])      return @"iPad Pro (11 inch) (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad8,4"])      return @"iPad Pro (11 inch) (Cellular)"; // 6GB RAM version, up to 1TB disk
    if ([modelIdentifier isEqualToString:@"iPad8,5"])      return @"iPad Pro (12.9 inch) 3G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad8,6"])      return @"iPad Pro (12.9 inch) 3G (Wi-Fi)";  // 6GB RAM version, up to 1TB disk
    if ([modelIdentifier isEqualToString:@"iPad8,7"])      return @"iPad Pro (12.9 inch) 3G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad8,8"])      return @"iPad Pro (12.9 inch) 3G (Cellular)"; // 6GB RAM version, up to 1TB disk
    if ([modelIdentifier isEqualToString:@"iPad8,9"])      return @"iPad Pro (11 inch) 2G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad8,10"])     return @"iPad Pro (11 inch) 2G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad8,11"])     return @"iPad Pro (12.9 inch) 4G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad8,12"])     return @"iPad Pro (12.9 inch) 4G (Cellular)";

    // iPod http://theiphonewiki.com/wiki/IPod
    
    if ([modelIdentifier isEqualToString:@"iPod1,1"])      return @"iPod touch 1G";
    if ([modelIdentifier isEqualToString:@"iPod2,1"])      return @"iPod touch 2G";
    if ([modelIdentifier isEqualToString:@"iPod3,1"])      return @"iPod touch 3G";
    if ([modelIdentifier isEqualToString:@"iPod4,1"])      return @"iPod touch 4G";
    if ([modelIdentifier isEqualToString:@"iPod5,1"])      return @"iPod touch 5G";
    if ([modelIdentifier isEqualToString:@"iPod7,1"])      return @"iPod touch 6G"; // as 6,1 was never released 7,1 is actually 6th generation
    if ([modelIdentifier isEqualToString:@"iPod9,1"])      return @"iPod touch 7G"; // iPod8,1 was rumored to be with FaceId, never released

    // Apple TV https://www.theiphonewiki.com/wiki/Apple_TV

    if ([modelIdentifier isEqualToString:@"AppleTV1,1"])      return @"Apple TV 1G";
    if ([modelIdentifier isEqualToString:@"AppleTV2,1"])      return @"Apple TV 2G";
    if ([modelIdentifier isEqualToString:@"AppleTV3,1"])      return @"Apple TV 3G";
    if ([modelIdentifier isEqualToString:@"AppleTV3,2"])      return @"Apple TV 3G"; // small, incremental update over 3,1
    if ([modelIdentifier isEqualToString:@"AppleTV5,3"])      return @"Apple TV 4G"; // as 4,1 was never released, 5,1 is actually 4th generation
    if ([modelIdentifier isEqualToString:@"AppleTV6,2"])      return @"Apple TV (4K)";


    // Mac (return only device class, not particular model) https://everymac.com/systems/by_capability/mac-specs-by-machine-model-machine-id.html
    if ([modelIdentifier hasPrefix:@"iMacPro"])            return @"iMac Pro";
    if ([modelIdentifier hasPrefix:@"iMac"])               return @"iMac";
    if ([modelIdentifier hasPrefix:@"Macmini"])            return @"Mac Mini";
    if ([modelIdentifier hasPrefix:@"MacBookPro"])         return @"MacBook Pro";
    if ([modelIdentifier hasPrefix:@"iMacBookAir"])        return @"Macbook Air";
    if ([modelIdentifier hasPrefix:@"MacBook"])            return @"MacBook";
    if ([modelIdentifier hasPrefix:@"Xserve"])             return @"Xserve";
    
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
    if ([modelIdentifier containsString:@"Mac"] || [modelIdentifier hasPrefix:@"Xserve"]) return UIDeviceFamilyMac;
    return UIDeviceFamilyUnknown;
}

@end
