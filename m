Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 314481BC61C
	for <lists+cocci@lfdr.de>; Tue, 28 Apr 2020 19:05:37 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 03SH5NO1018371;
	Tue, 28 Apr 2020 19:05:23 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id F14B9782D;
	Tue, 28 Apr 2020 19:05:22 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 1ADAF3DC8
 for <cocci@systeme.lip6.fr>; Tue, 28 Apr 2020 19:05:21 +0200 (CEST)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:441])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 03SH5JF1029109
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Tue, 28 Apr 2020 19:05:20 +0200 (CEST)
Received: by mail-pf1-x441.google.com with SMTP id f7so10962922pfa.9
 for <cocci@systeme.lip6.fr>; Tue, 28 Apr 2020 10:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K3ReeIBsUmvwqIkuKcc953gbdgvjaKucYr1i3+EeYT4=;
 b=FbUsJWWbLKREBAr3vFxvbEd35sOhop17Fe28zhg9wRAgXuPlRGrrjlxsWZwTAu2CCO
 4GEpXtAufHYM9mmIauS6I8WTWfJrF6aW+QCTSGQHepGHw2NEN1lcfd2qWEg2OX7qvoMs
 C7bwiTYWNzcNSSuHOotz08Po9t4Npl7o/1qnGjxNo76lioAA24jd/CnzqKbJBiWGAQfF
 rW9mplBTsCpEDvPOHwaQx9SttMDqoo/eQzfvf4bGYBZgdXyjZWg+JZNhTswotW2JILxD
 PsbgczRAHauJj3YDJscjYWAP8/MqIMnH2hcEqyA6rbcRCv6klsJWAoG/n0mYbWMWdisI
 HPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K3ReeIBsUmvwqIkuKcc953gbdgvjaKucYr1i3+EeYT4=;
 b=dRkL3dWjHxNvzgXIMxhduLKNfBA6N8LJFqnOFfsmWK6YmhQDyCYuiPcRUAwO3i/Mux
 1/MbyYTqC+c7AB/ShiuPOt10xPmDr75onyIq1k2OHJKHizkmngxyki8u4MtVNgjCG3RO
 GD1nTDxS5o39QlEygoQkrood8lzNcpiG/pvHtBxUM+uZiVJTxMEiduNDt4sIUPgzAeqn
 EeF5f11h5n+n+5TMwT5Tj6kIooxqlkvG2vcgo+ht0kRtM0/vuXHf2Q1CRzcacz2NZGqc
 2RVZ5NoNOws+u1TBdy0g9CaHZWpGCTtpI4RwMIdekTJvxEm4KDUNWQ8jd17b5H4tIgRq
 r7Fg==
X-Gm-Message-State: AGi0Pub+28SCfp0PppgMK80tWawR8Gmjmna4EK4lNOJ42lXFwiV9Cv1d
 8APVgpiUSaGg6viCqEMKudFkOc/h0Rs=
X-Google-Smtp-Source: APiQypLCemE0uvGm90G94Xm0vd4JloZlFVy2YY74eWvv8W4jozi5eyDFSecYaagL/k9ee2dwjlt4Yg==
X-Received: by 2002:a63:2885:: with SMTP id o127mr4457703pgo.198.1588093518647; 
 Tue, 28 Apr 2020 10:05:18 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:05:18 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:32:20 +0530
Message-Id: <20200428170228.7002-25-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 28 Apr 2020 19:05:23 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Tue, 28 Apr 2020 19:05:20 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH 24/32] parsing_c: unparse_cocci: Reflect Cast
	attributes
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

Cast attributes are added to the SmPL AST. Reflect these changes in
unparse_cocci.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/unparse_cocci.ml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/parsing_c/unparse_cocci.ml b/parsing_c/unparse_cocci.ml
index 395b3a3c..081bcdd9 100644
--- a/parsing_c/unparse_cocci.ml
+++ b/parsing_c/unparse_cocci.ml
@@ -455,7 +455,7 @@ let rec expression e =
     | Ast_c.RecordPtAccess (e, name) -> postfix
     | Ast_c.SizeOfExpr (e) -> unary
     | Ast_c.SizeOfType (t) -> unary
-    | Ast_c.Cast (t, e) -> cast
+    | Ast_c.Cast (t, e, a) -> cast
     | Ast_c.StatementExpr (statxs, _) -> top
     | Ast_c.Constructor (t, init) -> unary
     | Ast_c.ParenExpr (e) -> primary
@@ -503,8 +503,10 @@ let rec expression e =
       loop exp postfix; mcode print_string pt; ident field
   | Ast.RecordPtAccess(exp,ar,field) ->
       loop exp postfix; mcode print_string ar; ident field
-  | Ast.Cast(lp,ty,rp,exp) ->
+  | Ast.Cast(lp,ty,attr,rp,exp) ->
       mcode print_string_box lp; fullType ty; close_box();
+      (if not (attr = []) then pr_space());
+      print_between pr_space (mcode print_string) attr;
       mcode print_string rp; loop exp cast
   | Ast.SizeOfExpr(sizeof,exp) ->
       mcode print_string sizeof; loop exp unary
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
