Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B181E60C4
	for <lists+cocci@lfdr.de>; Thu, 28 May 2020 14:27:01 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 04SCPtMi019550;
	Thu, 28 May 2020 14:25:55 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id AC6DA7829;
	Thu, 28 May 2020 14:25:55 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id E89F23E1D
 for <cocci@systeme.lip6.fr>; Thu, 28 May 2020 14:25:53 +0200 (CEST)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:544])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 04SCPqIT022757
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Thu, 28 May 2020 14:25:53 +0200 (CEST)
Received: by mail-pg1-x544.google.com with SMTP id p21so13402078pgm.13
 for <cocci@systeme.lip6.fr>; Thu, 28 May 2020 05:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6TWncHt645mauf4KMuI7jEQm3qpNRixb3sU4vXEWEYc=;
 b=cucKPpiK0ThVXBzy4wx3unc3y8amexwbCuMoPPypBYLj8j26ffmytJc1I2iwDyUlbF
 sLObQqFDowOkogEgClvDtAB3j9nmq0h+3HejuEV+ch6HcRofLrMvRzb6dIbMepeg5oR0
 dDITNnxvLrzA4DAY0LbdDt6ImMxnOOKg6G/v/a7R9mF5QDk4Y+wnSn6AcSF7NbNCskbx
 ZeVvGqRUWg44SuxVVpY2Wdgfc64xJeZQ3g/byRSOHyQvmusN13BSLmlfBx+RSZZmcuoh
 yRKAOZt/o22/Zzs4HeEuXpF1zUXZ7KdpETRqxzyAhrUe9eI6qRh1ItP+ba1jQ2rPQgtR
 4a2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6TWncHt645mauf4KMuI7jEQm3qpNRixb3sU4vXEWEYc=;
 b=pVdV/k4k+zV4164BsPq62dky4bam3p3kmgeI5Mk38KZ72bFkSup/6rX3rR9uidCgwP
 k5xqzp89vdu+4Z74l7ebz3JoB8u+T+Ps5+hlwpl60yzVd1kKLQ4ggKEU6VPIIiCTq3OJ
 NNSz8IyCL85cS+lDdHsbU0DMyP0jG1KfzKpQ7ZH8/n/XvxJikwNBapIefNyxCdXib6Re
 hkkP4Y/OOZag6HRc8c1tvlxu0w3hDBEPPc8Ugpzvl/FszJTZ+PP9pkTiQ5H6ZxwBR/OF
 zGUpVs6NZedbkn49zvgMFzznnA9wCTV1Fy6M+8RJ5tFvQ3JgcT7TQGyHGaAZr7xTj8Fe
 U63g==
X-Gm-Message-State: AOAM533QFo5I59i6XNRGZUUvmxNB+r6KcmrekSuTwrYRfJk/IrYvBt1k
 WvuwxDmQ0mNy4o7y1GbPE18xMCB/
X-Google-Smtp-Source: ABdhPJxLzLk97Ym5L2eBVy/MBgkyhJCvn11V+WHqK/6tT9jkBt+Nfud4B/JVb7gcZqPpTXWtDESozg==
X-Received: by 2002:a63:214d:: with SMTP id s13mr2593150pgm.277.1590668751355; 
 Thu, 28 May 2020 05:25:51 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2183:e360:deba:7bf4:98ef:5568])
 by smtp.gmail.com with ESMTPSA id 1sm5722888pje.26.2020.05.28.05.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 05:25:50 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Thu, 28 May 2020 17:54:22 +0530
Message-Id: <20200528122428.4212-21-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
References: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 28 May 2020 14:25:55 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Thu, 28 May 2020 14:25:53 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH v2 20/25] parsing_c: parser: Place parameter
	attributes in C AST
X-BeenThere: cocci@systeme.lip6.fr
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: <cocci.systeme.lip6.fr>
List-Unsubscribe: <https://systeme.lip6.fr/mailman/options/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=unsubscribe>
List-Archive: <https://systeme.lip6.fr/pipermail/cocci>
List-Post: <mailto:cocci@systeme.lip6.fr>
List-Help: <mailto:cocci-request@systeme.lip6.fr?subject=help>
List-Subscribe: <https://systeme.lip6.fr/mailman/listinfo/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

Parameter attributes are needed so as to not break the nocast test case
when attributes are fully supported. Add parameter attributes to the C
AST.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parser_c.mly | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index 57528dfc..cd997aaa 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -857,7 +857,7 @@ new_argument:
      { let ty = addTypeD ($1,nullDecl) in
        let ((returnType,hasreg), iihasreg) = fixDeclSpecForParam ty in
        Right (ArgType { p_namei = None; p_type = returnType;
-			p_register = hasreg, iihasreg;
+                        p_register = hasreg, iihasreg; p_attr = [];
 		      } )
      }
  | new_argument TOCro expr TCCro
@@ -1447,23 +1447,28 @@ parameter_decl2:
      { p_namei = Some name;
        p_type = mk_ty NoType [];
        p_register = (false, []);
+       p_attr = [];
      }
    }
  | decl_spec declaratorp
      { LP.kr_impossible();
        let ((returnType,hasreg),iihasreg) = fixDeclSpecForParam (snd $1) in
-       let (name, ftyp) = $2 in
+       let attrs = (fst $1) @ (fst $2) in
+       let (name, ftyp) = snd $2 in
        { p_namei = Some (name);
          p_type = ftyp returnType;
          p_register = (hasreg, iihasreg);
+         p_attr = attrs;
        }
      }
  | decl_spec abstract_declaratorp
      { LP.kr_impossible();
        let ((returnType,hasreg), iihasreg) = fixDeclSpecForParam (snd $1) in
+       let attrs = (fst $1) @ (fst $2) in
        { p_namei = None;
          p_type = (snd $2) returnType;
          p_register = hasreg, iihasreg;
+         p_attr = attrs;
        }
      }
  | decl_spec
@@ -1472,6 +1477,7 @@ parameter_decl2:
        { p_namei = None;
          p_type = returnType;
          p_register = hasreg, iihasreg;
+         p_attr = fst $1;
        }
      }
 
@@ -1484,11 +1490,11 @@ parameter_decl: parameter_decl2 { et "param" ();  $1 }
 
 declaratorp:
  | declarator  { let (attr,dec) = $1 in (* attr gets ignored *)
-                 LP.add_ident (str_of_name (fst dec)); dec }
+                 LP.add_ident (str_of_name (fst dec)); attr, dec }
  /*(* gccext: *)*/
  | declarator attributes
                { let (attr,dec) = $1 in (* attr gets ignored *)
-                 LP.add_ident (str_of_name (fst dec)); dec }
+                 LP.add_ident (str_of_name (fst dec)); attr, dec }
 
 abstract_declaratorp:
  | abstract_declarator { $1 }
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
