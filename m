Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E441CD5DF
	for <lists+cocci@lfdr.de>; Mon, 11 May 2020 12:08:12 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 04BA7lJf028270;
	Mon, 11 May 2020 12:07:47 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 113197847;
	Mon, 11 May 2020 12:07:46 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id EBD7B783C
 for <cocci@systeme.lip6.fr>; Mon, 11 May 2020 12:07:43 +0200 (CEST)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:1031])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 04BA7gbV026871
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Mon, 11 May 2020 12:07:43 +0200 (CEST)
Received: by mail-pj1-x1031.google.com with SMTP id a7so7559544pju.2
 for <cocci@systeme.lip6.fr>; Mon, 11 May 2020 03:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M91q9QGpyZbnFV5DZ/SflSN23/oSIrJm2HJMonaNS90=;
 b=Hz3ORGz3EitMt0bgKoAZffSFk3+aLERbfGoxt9ZkqH31ccgakuD+HR7G0ZvROgfuE3
 fIVLLO7/XjOico7fo5sWzDoZ3VlEec0g6EVgLQJqkceEIYOjbK12VdF9Q5uf1PKCiUL6
 mI130lQJs8FQXIK2c0QyYQ3idCo5EevtAFptfK8fOiONJrYcvzA9QW0SDOmYJ9CUPPCL
 F/n1pig4Ed9iWPD49DZpndSbGF7+goZJz3MtnCa/2x+bHgzCpmk+2sflf+6eq6WM8k49
 JocRmRnsq/pZRNXwBU8VnHG4b8KHUve9sJOLwN7r9HiTC41w06JJZdOjIYdiUdO9hXK1
 052g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M91q9QGpyZbnFV5DZ/SflSN23/oSIrJm2HJMonaNS90=;
 b=psPemCU++aY3kf/I9bmgXV57dYyI0Tvi8FDlw04Q6oSFhHpvNT6fPxfdB0yF4Aehe1
 Tws6DPrJ5naBSydrq+sCmz1mTLb/WBgDl8AW4Ipx1by+PGzv7GAG2BO1hORIznDLmCa9
 aikix8kpMeO/5YOf/dJLwtmO7ovkSgKqpLY6h0zN9sPt/JhtBje8TNDf7rTERBDRV3ns
 rTOjcXqyoKfY63LqDc1/TrLJi8PzDfd3Hd6BOB2ze7BfRO5lmpFCWnNn7qfEZ8s3IQhB
 xdXrIx9bsMc13pKk4/9KTxfVeKNXXNRyXjbB3gNYx3m7frJN6elCWxOmSspCfbzsY5PJ
 paCw==
X-Gm-Message-State: AGi0PubQdH7xIOCgrrM/8gD2DTCNFj9qtViLoVCmDtbjvO1QXpKxIALH
 JTIVzc4Hl4cLetEDri+tALmy7DeKcBA=
X-Google-Smtp-Source: APiQypJuwcYyaEKao5DLtYS/b4+uK0ZrhNQbhbzX5igDFIJUeZP21WCNJ5/xdG7pmTS8twsCHIOXGw==
X-Received: by 2002:a17:90a:f404:: with SMTP id
 ch4mr21413942pjb.123.1589191661647; 
 Mon, 11 May 2020 03:07:41 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 o99sm9772994pjo.8.2020.05.11.03.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:07:41 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:36:45 +0530
Message-Id: <20200511100715.19819-3-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
References: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 11 May 2020 12:07:47 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Mon, 11 May 2020 12:07:43 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH v2 02/32] parsing_cocci: ast0_cocci: Add cast
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

Add cast attributes to AST0 of SmPL. This is a list of attributes in the
Cast type of AST0.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/ast0_cocci.ml  | 4 ++--
 parsing_cocci/ast0_cocci.mli | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/parsing_cocci/ast0_cocci.ml b/parsing_cocci/ast0_cocci.ml
index a06d99ae..b65400be 100644
--- a/parsing_cocci/ast0_cocci.ml
+++ b/parsing_cocci/ast0_cocci.ml
@@ -123,8 +123,8 @@ and base_expression =
 	              string mcode (* ] *)
   | RecordAccess   of expression * string mcode (* . *) * ident
   | RecordPtAccess of expression * string mcode (* -> *) * ident
-  | Cast           of string mcode (* ( *) * typeC * string mcode (* ) *) *
-                      expression
+  | Cast           of string mcode (* ( *) * typeC * attr list *
+                      string mcode (* ) *) * expression
   | SizeOfExpr     of string mcode (* sizeof *) * expression
   | SizeOfType     of string mcode (* sizeof *) * string mcode (* ( *) *
                       typeC * string mcode (* ) *)
diff --git a/parsing_cocci/ast0_cocci.mli b/parsing_cocci/ast0_cocci.mli
index 5c2520be..08a4b33b 100644
--- a/parsing_cocci/ast0_cocci.mli
+++ b/parsing_cocci/ast0_cocci.mli
@@ -114,8 +114,8 @@ and base_expression =
 	              string mcode (* ] *)
   | RecordAccess   of expression * string mcode (* . *) * ident
   | RecordPtAccess of expression * string mcode (* -> *) * ident
-  | Cast           of string mcode (* ( *) * typeC * string mcode (* ) *) *
-                      expression
+  | Cast           of string mcode (* ( *) * typeC * attr list *
+                      string mcode (* ) *) * expression
   | SizeOfExpr     of string mcode (* sizeof *) * expression
   | SizeOfType     of string mcode (* sizeof *) * string mcode (* ( *) *
                       typeC * string mcode (* ) *)
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
