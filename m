Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE2C1E60BF
	for <lists+cocci@lfdr.de>; Thu, 28 May 2020 14:26:49 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 04SCPnfa022635;
	Thu, 28 May 2020 14:25:49 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id A16E37829;
	Thu, 28 May 2020 14:25:49 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id BF64F3E1D
 for <cocci@systeme.lip6.fr>; Thu, 28 May 2020 14:25:47 +0200 (CEST)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:641])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 04SCPjnI015686
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Thu, 28 May 2020 14:25:46 +0200 (CEST)
Received: by mail-pl1-x641.google.com with SMTP id x18so10387584pll.6
 for <cocci@systeme.lip6.fr>; Thu, 28 May 2020 05:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4dXktnt2JoaHvfulBMJF3+3oeU5k7LYjH73DfL+m17Y=;
 b=rn6y/GHbnBYmhTkrUQIxdd03jU6cxo1074rlTAsROpFFM3UdwfncMXNmmI0N6dHmxd
 UD+NG0CQBKewZtT5h5NSU+qDsrcMt5mPhpi8SlJYUntuxYpig90LG9QOjqyG3uHjdQGI
 E2g45zsca2VWq1i7Kh9zm6Q2n5Y05zy4gHWcVteRC6W6zTDGAJN2mxRKk3mN12xRALUy
 sqrwX0KYVokM6yUpH1PlMM6V9/wGB08pWflYWLVFLqceR/ps14mERGt3lzoYcaR2cO6K
 umc8/DsWrzw8bJQQnCcibtubCJVD0JS8RVZg4CUyFaX7JHHrivkmhvZZBaOSl3JdEHKO
 4aAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4dXktnt2JoaHvfulBMJF3+3oeU5k7LYjH73DfL+m17Y=;
 b=dMBDONOn7GvrMcJlHUygxiUsXQDeGnjbdoNlCCrVn7ic13LO4NuK2gEkkIUbticDrq
 oTzOQpZatV32zMa05j35XGmKt4Q0PdARu1cY3zuvjhu3I0EVOA/VlLCrFrW6/m7RnZm8
 o03xlCVCiEXO+dfqvAP9PNWDv4zWvLeFIVcMEkgB/nHYI0Zxq3QQH/WYGWMRHxZ1tH1b
 iYey1XXO9PJs1o6s/3Ba7hXT+o6VGS0vh+kgtQJGOMAcEdyVK4jDIlPg1zAaqLLaSbhT
 ABKaQTL/OEZYkX1n5R4rn5BHFqqlTZNfWi4vlDy7qFQfH3Ld3oTXKh/htCIHyQYqwnQu
 9c8w==
X-Gm-Message-State: AOAM53137jYDjJkKd7W6etYCBKeKjILjjQ5RSfWYQ/TnKhsj/IGKe9bE
 Tzhcv6n5WJX47tTlJHJJx7bdEbWQ
X-Google-Smtp-Source: ABdhPJz1SlVkKgGS56f1S9nYrkV9pcTs0J6qMbbDLTGZBCNCg53tJuTWlSa7uuA2vaSxkVujwGJfDw==
X-Received: by 2002:a17:90b:1482:: with SMTP id
 js2mr3633155pjb.54.1590668745112; 
 Thu, 28 May 2020 05:25:45 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2183:e360:deba:7bf4:98ef:5568])
 by smtp.gmail.com with ESMTPSA id 1sm5722888pje.26.2020.05.28.05.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 05:25:44 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Thu, 28 May 2020 17:54:20 +0530
Message-Id: <20200528122428.4212-19-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
References: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 28 May 2020 14:25:49 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Thu, 28 May 2020 14:25:47 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH v2 18/25] parsing_c: parser: Make
	abstract_declarator pass attributes
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

The attributes in abstract_declarator can be used for adding parameter
attributes, cast attributes and others to the C AST. Make
abstract_declarator pass these attributes in a tuple.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parser_c.mly | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index 2caf4974..57528dfc 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -1397,13 +1397,14 @@ tccro: TCCro { dt "tccro" ();$1 }
 
 /*(*-----------------------------------------------------------------------*)*/
 abstract_declarator:
- | pointer                            { snd $1 }
- |         direct_abstract_declarator { $1 }
- | pointer direct_abstract_declarator { fun x -> x +> $2 +> (snd $1) }
+ | pointer                            { $1 }
+ |         direct_abstract_declarator { ([], $1) }
+ | pointer direct_abstract_declarator
+     { (fst $1, fun x -> x +> $2 +> (snd $1)) }
 
 direct_abstract_declarator:
  | TOPar abstract_declarator TCPar /*(* forunparser: old: $2 *)*/
-     { fun x -> mk_ty (ParenType ($2 x)) [$1;$3] }
+     { fun x -> mk_ty (ParenType ((snd $2) x)) [$1;$3] }
 
  | TOCro            TCCro
      { fun x -> mk_ty (Array (None, x)) [$1;$2] }
@@ -1461,7 +1462,7 @@ parameter_decl2:
      { LP.kr_impossible();
        let ((returnType,hasreg), iihasreg) = fixDeclSpecForParam (snd $1) in
        { p_namei = None;
-         p_type = $2 returnType;
+         p_type = (snd $2) returnType;
          p_register = hasreg, iihasreg;
        }
      }
@@ -1527,8 +1528,9 @@ type_name:
        let (returnType, _) = fixDeclSpecForDecl ds in returnType }
  | spec_qualif_list abstract_declaratort
      { let (attrs1, ds) = $1 in
+       let (attrs2, fn) = $2 in
        let (returnType, _) = fixDeclSpecForDecl ds in
-       $2 returnType }
+       fn returnType }
 
 
 
@@ -2117,7 +2119,7 @@ define_val:
      }
  | decl_spec abstract_declarator
      { let returnType = fixDeclSpecForMacro (snd $1) in
-       let typ = $2 returnType in
+       let typ = (snd $2) returnType in
        DefineType typ
      }
 
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
