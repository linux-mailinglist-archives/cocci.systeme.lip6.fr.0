Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 312F21BC5F9
	for <lists+cocci@lfdr.de>; Tue, 28 Apr 2020 19:03:22 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 03SH2uDR011104;
	Tue, 28 Apr 2020 19:02:59 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 01447783C;
	Tue, 28 Apr 2020 19:02:59 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id AB4AF7807
 for <cocci@systeme.lip6.fr>; Tue, 28 Apr 2020 19:02:56 +0200 (CEST)
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:1042])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 03SH2pCs026639
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Tue, 28 Apr 2020 19:02:52 +0200 (CEST)
Received: by mail-pj1-x1042.google.com with SMTP id t9so1453585pjw.0
 for <cocci@systeme.lip6.fr>; Tue, 28 Apr 2020 10:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M91q9QGpyZbnFV5DZ/SflSN23/oSIrJm2HJMonaNS90=;
 b=tR+zlfa0tZB10YU1LuW9TflOQwiAPCIhJMjjH6vlszn5HelSGXJ6RhY2y+ZHRbmCeF
 ldGg6u5hq2nqRem7COIZ6TzWmnmvZOnQuzHq7rwEkOeaz2s2b8hOJiPiaahn0KdeepNH
 dtJyHdIEnJSQnL4ayDHLSWvJ5gEARQNlqh0EJykurHFJeDY+kPifUv/U9WpbBwqooQBZ
 c4Lu3eW6sjT3TAvn9McygWjkK5OpkgN2Tebf43YCD9HP8dN8v0ebpOOozj8tzmUUwy4j
 FhG0BkQZlsO+kDm4Vhb21OpwN6It+noKlGGkqbBe3KCAQUe77l5s5z+KNl4IF/cqRJzO
 1VvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M91q9QGpyZbnFV5DZ/SflSN23/oSIrJm2HJMonaNS90=;
 b=lXWOyMmlVkzfRWQk5DKv3s8ox36rjXFC0ZqzaWkTuouJ6u7cd65Au9vU+kVUVqLdFn
 PKe9T/DHWWaGhxOfyhBsHiD2waWr70MqR6yEiLsyCSARj+oDSZU2BMJjU12wIfsBD9U1
 0seZNBcJjleXYNykS1q/oysb2wRd4N0cLrkUbsDCh4rtPVLWgSV6/eJm6W1JG5/N//Uy
 7qZg+xxvnTtkuvlKdEYhOxvBLbYF2a7OPxLS9ru2cMwsc0XAyPQXqqLZslk0ITyTRipg
 gnaPDNCqILH4/PyfpJP/Rh6YHl2VqQBE6jRcOpYVKcoV0r7O9V4VZgxYy+PQkqKbcvkI
 rDJQ==
X-Gm-Message-State: AGi0PuZw6dt6/RHwe92XBYNbdZAsLFDXNHoBbpYIht4qw5e0gZKTOT5o
 hIDdzXYt3MUAXqjbUtvlxq2wgu8iJIk=
X-Google-Smtp-Source: APiQypJ56dodiDiiLL37Fv2ec2zgVwtRE8g2bWaQwoVgZ4D3a4SXlA0NdwiApkQMJpq5fMyOxzC7bQ==
X-Received: by 2002:a17:902:d34a:: with SMTP id
 l10mr29830890plk.234.1588093370295; 
 Tue, 28 Apr 2020 10:02:50 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:02:49 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:31:58 +0530
Message-Id: <20200428170228.7002-3-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 28 Apr 2020 19:02:59 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Tue, 28 Apr 2020 19:02:52 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH 02/32] parsing_cocci: ast0_cocci: Add cast attributes
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
