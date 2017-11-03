// Copyright (c) Microsoft Corporation.
// All rights reserved.
//
// This code is licensed under the MIT License.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files(the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and / or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions :
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "ADAuthorityUtils.h"

static NSSet<NSString *> *s_trustedHostList;

@implementation ADAuthorityUtils

+ (void)initialize
{
    s_trustedHostList = [NSSet setWithObjects: @"login.windows.net",
                         @"login.chinacloudapi.cn",
                         @"login-us.microsoftonline.com",
                         @"login.cloudgovapi.us",
                         @"login.microsoftonline.com",
                         @"login.microsoftonline.de", nil];
}

#pragma mark - Public

+ (BOOL)isKnownHost:(NSString *)string
{
    if ([NSString adIsStringNilOrBlank:string])
    {
        return NO;
    }
    
    NSURL *url = [[NSURL alloc] initWithString:string];
    return [s_trustedHostList containsObject:url.host.lowercaseString];
}

@end
