//
//  SFileMD5Generator.m
//  shader-converter
//
//  Created by 王江 on 2020/10/25.
//

#import "SFileMD5Generator.h"
#import <CommonCrypto/CommonDigest.h>

@implementation SFileMD5Generator

+ (NSString *)generateMD5ForFileAtPath:(NSString *)filePath
{
    NSString *md5Str = @"";
    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:filePath];
    if (handle)
    {
        CC_MD5_CTX md5;
        CC_MD5_Init(&md5);

        NSData *data;
        do {
            data = [handle readDataOfLength:256];
            CC_MD5_Update(&md5, [data bytes], (unsigned int)[data length]);
        } while ([data length] != 0);

        unsigned char digest[CC_MD5_DIGEST_LENGTH];
        CC_MD5_Final(digest, &md5);
        md5Str = [NSString stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                                             digest[0], digest[1],
                                             digest[2], digest[3],
                                             digest[4], digest[5],
                                             digest[6], digest[7],
                                             digest[8], digest[9],
                                             digest[10], digest[11],
                                             digest[12], digest[13],
                                             digest[14], digest[15]];
    }
    return md5Str;
}

@end

