Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BA81CD5FE
	for <lists+cocci@lfdr.de>; Mon, 11 May 2020 12:09:39 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 04BA8YsJ005210;
	Mon, 11 May 2020 12:08:34 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 0717F782B;
	Mon, 11 May 2020 12:08:34 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id EDB2B3DC8
 for <cocci@systeme.lip6.fr>; Mon, 11 May 2020 12:08:31 +0200 (CEST)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:444])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 04BA8Uew020900
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Mon, 11 May 2020 12:08:31 +0200 (CEST)
Received: by mail-pf1-x444.google.com with SMTP id x2so4532024pfx.7
 for <cocci@systeme.lip6.fr>; Mon, 11 May 2020 03:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g8ObZEU8oQgITaiHCYVY8TZYA9FdrqRe/dufNnhXR+s=;
 b=KsNSHQ22rntlXRXO6IRcraWP7ElPy90/TomURoGIbjOtCJhXpMsMm1FvT8qqZfvkoo
 gy2AzTr1sXdsjwrLEwstSmyKAhiKc5AkZSx6r9IU44X70gQZp+RrI1kyW/se6PFi6no3
 MOKW37viInZgdanEnBnzVOybLI41or5IEj2ICCugpLvsxnaRKq6XM8zIWbMQE4XPYkSe
 WDTVKu7fR2BC0RvV/9UOXtu6umyY7fLiHcxSSDfyL0Y5KE3Bc7UpPgXKtRwiBA2xf6II
 BnG+aofI/tvQUgxWArNwoV8z/Vm2jp9EudTpTpCn6GCVrtwRxm+/CzuylzObKsf19cPM
 LaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g8ObZEU8oQgITaiHCYVY8TZYA9FdrqRe/dufNnhXR+s=;
 b=iHr91RWg2QTHFa+VwtLD4L1eW9KtO6v53VDk4UXKQpHGb2L0G2/APWkEcmp6hc6Ulo
 bqS8PmIpTrq0J54XF9OuQhFhK5AkjIkU0bXoeZWRgE+FH3pm3YAwSZ3OzzFhRsU7e2iK
 1Tx4MbhUgJqbAFJiU/0RxdZA+ZjqlgKsowf8qa0OIH/SL0mh7/Bu3gxzrm5FG4fOKtG2
 JPwMQl3c3R1tKm6swx/hchHqVL8896kuOSMGHpkaTE9Lwe4mlbGxg5m+OL19VMoiCD+F
 /ei/WBli0MjR+4/X0enhLJglF+36yxczAqgwL5GzKb79wFE4yUPiJb7GjflL42PGAY/o
 wB+A==
X-Gm-Message-State: AGi0PuZxhd2+LaMIgb7FTzTerqtsOx3R+uGoUknpiP4ZaivhMFG61R9i
 WqMnOehgyL69K0jx8J7c45mwrndMrjQ=
X-Google-Smtp-Source: APiQypJ5H7FRjYZ5aaXGAAC17qw1uUA46+UNCvREp6Jo9+bsom8nDGB8ZSA2pKhowfoZMiHhUMdP4A==
X-Received: by 2002:a63:a61:: with SMTP id z33mr13904104pgk.440.1589191709546; 
 Mon, 11 May 2020 03:08:29 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 o99sm9772994pjo.8.2020.05.11.03.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:08:29 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:36:57 +0530
Message-Id: <20200511100715.19819-15-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
References: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 11 May 2020 12:08:34 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Mon, 11 May 2020 12:08:31 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH v2 14/32] parsing_cocci: ast_cocci: Add cast
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

Add cast attributes to the SmPL AST. This is a list of attributes in the
Cast type of the SmPL AST.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/ast_cocci.ml  | 4 ++--
 parsing_cocci/ast_cocci.mli | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/parsing_cocci/ast_cocci.ml b/parsing_cocci/ast_cocci.ml
index 9b147e5c..b0190fa1 100644
--- a/parsing_cocci/ast_cocci.ml
+++ b/parsing_cocci/ast_cocci.ml
@@ -194,8 +194,8 @@ and base_expression =
 	              string mcode (* ] *)
   | RecordAccess   of expression * string mcode (* . *) * ident
   | RecordPtAccess of expression * string mcode (* -> *) * ident
-  | Cast           of string mcode (* ( *) * fullType * string mcode (* ) *) *
-                      expression
+  | Cast           of string mcode (* ( *) * fullType * attr list *
+                      string mcode (* ) *) * expression
   | SizeOfExpr     of string mcode (* sizeof *) * expression
   | SizeOfType     of string mcode (* sizeof *) * string mcode (* ( *) *
                       fullType * string mcode (* ) *)
diff --git a/parsing_cocci/ast_cocci.mli b/parsing_cocci/ast_cocci.mli
index c56bba88..ff81692c 100644
--- a/parsing_cocci/ast_cocci.mli
+++ b/parsing_cocci/ast_cocci.mli
@@ -178,8 +178,8 @@ and base_expression =
 	              string mcode (* ] *)
   | RecordAccess   of expression * string mcode (* . *) * ident
   | RecordPtAccess of expression * string mcode (* -> *) * ident
-  | Cast           of string mcode (* ( *) * fullType * string mcode (* ) *) *
-                      expression
+  | Cast           of string mcode (* ( *) * fullType * attr list *
+                      string mcode (* ) *) * expression
 
   | SizeOfExpr     of string mcode (* sizeof *) * expression
   | SizeOfType     of string mcode (* sizeof *) * string mcode (* ( *) *
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
