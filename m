Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B58222388
	for <lists+cocci@lfdr.de>; Thu, 16 Jul 2020 15:06:22 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 06GD5mHl007758;
	Thu, 16 Jul 2020 15:05:50 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 86B29781E;
	Thu, 16 Jul 2020 15:05:50 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 3948F785C
 for <cocci@systeme.lip6.fr>; Thu, 16 Jul 2020 15:05:47 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 06GD5kcd026792
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Thu, 16 Jul 2020 15:05:46 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id BEAC32A558C
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: cocci@systeme.lip6.fr
Date: Thu, 16 Jul 2020 18:35:12 +0530
Message-Id: <20200716130521.7717-9-jaskaran.singh@collabora.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200716130521.7717-1-jaskaran.singh@collabora.com>
References: <20200716130521.7717-1-jaskaran.singh@collabora.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 16 Jul 2020 15:05:50 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Thu, 16 Jul 2020 15:05:46 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Subject: [Cocci] [PATCH 08/17] parsing_cocci: safe_for_multi_decls: Reflect
	attributefn in AST visitor
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

The SmPL AST visitor has a function for attributes. Reflect these
changes in safe_for_multi_decls.ml.

Signed-off-by: Jaskaran Singh <jaskaran.singh@collabora.com>
---
 parsing_cocci/safe_for_multi_decls.ml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/parsing_cocci/safe_for_multi_decls.ml b/parsing_cocci/safe_for_multi_decls.ml
index 70335abb..ee3741b9 100644
--- a/parsing_cocci/safe_for_multi_decls.ml
+++ b/parsing_cocci/safe_for_multi_decls.ml
@@ -43,7 +43,7 @@ let all_removed_recursor =
     do_nothing do_nothing do_nothing do_nothing do_nothing do_nothing
     do_nothing do_nothing do_nothing do_nothing do_nothing do_nothing
     do_nothing do_nothing do_nothing do_nothing do_nothing do_nothing
-    do_nothing do_nothing do_nothing do_nothing
+    do_nothing do_nothing do_nothing do_nothing do_nothing
 
 let all_removed_decl =
   all_removed_recursor.V.combiner_declaration
@@ -100,7 +100,7 @@ let contains_modif =
       do_nothing do_nothing do_nothing init do_nothing
       do_nothing do_nothing do_nothing do_nothing
       do_nothing do_nothing rule_elem do_nothing do_nothing do_nothing
-      do_nothing in
+      do_nothing do_nothing in
   recursor.V.combiner_fullType
 
 let attribute a =
@@ -178,7 +178,7 @@ let process =
       donothing donothing donothing donothing donothing donothing donothing
       donothing donothing donothing donothing donothing donothing donothing
       donothing donothing donothing donothing decl anndecl field annfield
-      donothing donothing donothing donothing donothing donothing in
+      donothing donothing donothing donothing donothing donothing donothing in
   List.map fn.V.rebuilder_top_level
 
 let safe_for_multi_decls rules =
-- 
2.21.3

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
