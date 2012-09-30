//
//  LDAPService.m
//  Exempt Timesheet
//
//  Created by Gladys Cevallos on 9/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LDAPService.h"

@implementation LDAPService

-(BOOL)simple_ldap:(NSString *)uid bindPW:(NSString *)bindPW {
    BOOL success = NO;
    
    int              err;
    LDAP           * ld;
    BerValue         cred;
    BerValue       * servercredp;
    servercredp     = NULL;
    
    NSLog(@"attempting simple bind");
    NSLog(@"   initialzing LDAP (%s)...", MY_LDAP_URI);
    err = ldap_initialize(&ld, MY_LDAP_URI);
    if (err != LDAP_SUCCESS)
    {
        NSLog(@"   ldap_initialize(): %s\n", ldap_err2string(err));
    } else {
        int version = MY_LDAP_VERSION;
        NSLog(@"   setting protocol version %i...", version);
        err = ldap_set_option(ld, LDAP_OPT_PROTOCOL_VERSION, &version);
        if (err != LDAP_SUCCESS)
        {
            NSLog(@"   ldap_set_option(): %s\n", ldap_err2string(err));
            ldap_unbind_ext_s(ld, NULL, NULL);
        } else {
            
            NSLog(@"   Bind Data:");
            NSLog(@"      Mech:    Simple");
            NSLog(@"      DN:      %s", MY_LDAP_BINDDN);
            NSLog(@"      Passwd:  %@", bindPW);
            
            NSLog(@"   binding to LDAP server...");
            char *cpy = calloc([bindPW length]+1, 1);
            const char *c = [bindPW UTF8String];
            strncpy(cpy, c, [bindPW length]);
            cred.bv_val = cpy;
            cred.bv_len = [bindPW length];
            free(cpy);

            NSString *binddn = [NSString stringWithFormat:@"uid=%@%s", uid, MY_LDAP_BINDDN];            
            char *cpy2 = calloc([binddn length]+1, 1);
            const char *c2 = [binddn UTF8String];
            strncpy(cpy2, c2, [binddn length]);
            err = ldap_sasl_bind_s(ld, cpy2, LDAP_SASL_SIMPLE, &cred, NULL, NULL, &servercredp);
            free(cpy2);
            if (err != LDAP_SUCCESS)
            {
                NSLog(@"   ldap_sasl_bind_s(): %s", ldap_err2string(err));
                ldap_unbind_ext_s(ld, NULL, NULL);
            } else {
                success = YES;
            }
            
            NSLog(@"   unbinding from LDAP server...");
            ldap_unbind_ext_s(ld, NULL, NULL);
        }
    }
    return success;
}
@end
