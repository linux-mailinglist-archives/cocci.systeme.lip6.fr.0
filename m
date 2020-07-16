Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E43E3222343
	for <lists+cocci@lfdr.de>; Thu, 16 Jul 2020 15:02:19 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 06GD1prE017156;
	Thu, 16 Jul 2020 15:01:54 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 4DB957828;
	Thu, 16 Jul 2020 15:01:54 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 173F57815
 for <cocci@systeme.lip6.fr>; Thu, 16 Jul 2020 15:01:51 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 06GD1l31016202
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Thu, 16 Jul 2020 15:01:47 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id 84AA62A570D
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: cocci@systeme.lip6.fr
Date: Thu, 16 Jul 2020 18:29:57 +0530
Message-Id: <20200716130016.23729-7-jaskaran.singh@collabora.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200716130016.23729-1-jaskaran.singh@collabora.com>
References: <20200716130016.23729-1-jaskaran.singh@collabora.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 16 Jul 2020 15:01:54 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Thu, 16 Jul 2020 15:01:47 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Subject: [Cocci] [PATCH 06/24] parsing_cocci: iso_pattern: Reflect
	attributefn in AST0 visitor
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

The SmPL AST0 visitor has a function for attributes. Reflect these
changes in iso_pattern.ml.

Signed-off-by: Jaskaran Singh <jaskaran.singh@collabora.com>
---
 parsing_cocci/iso_pattern.ml | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/parsing_cocci/iso_pattern.ml b/parsing_cocci/iso_pattern.ml
index 40fd67e8..5200a4c4 100644
--- a/parsing_cocci/iso_pattern.ml
+++ b/parsing_cocci/iso_pattern.ml
@@ -45,7 +45,7 @@ let strip_info =
     donothing donothing donothing donothing donothing donothing donothing
     donothing donothing donothing donothing donothing donothing donothing
     donothing donothing donothing donothing donothing donothing donothing
-    donothing donothing donothing
+    donothing donothing donothing donothing
 
 let anything_equal = function
     (Ast0.DotsExprTag(d1),Ast0.DotsExprTag(d2)) ->
@@ -478,7 +478,7 @@ let match_maker checks_needed context_required whencode_allowed =
       donothing donothing donothing donothing donothing donothing donothing
       donothing donothing
       ident expression assignOp binaryOp typeC init param decl field donothing
-      stmt donothing donothing donothing donothing in
+      stmt donothing donothing donothing donothing donothing in
 
   let add_pure_list_binding name pure is_pure builder1 builder2 lst =
     match (checks_needed,pure) with
@@ -1595,7 +1595,7 @@ let make_minus =
     dots dots dots dots dots dots dots dots dots
     donothing expression donothing donothing donothing initialiser donothing
     declaration field enum_decl statement donothing donothing donothing
-    donothing
+    donothing donothing
 
 (* --------------------------------------------------------------------- *)
 (* rebuild mcode cells in an instantiated alt *)
@@ -1687,7 +1687,7 @@ let rebuild_mcode start_line =
     donothing donothing donothing donothing donothing donothing donothing
     donothing donothing donothing donothing donothing donothing donothing
     donothing donothing donothing donothing donothing statement donothing
-    donothing donothing donothing
+    donothing donothing donothing donothing
 
 (* --------------------------------------------------------------------- *)
 (* The problem of whencode.  If an isomorphism contains dots in multiple
@@ -2172,7 +2172,7 @@ let instantiate bindings mv_bindings model =
     (dots elist) donothing (dots plist) (dots slist) donothing donothing
     donothing donothing donothing
     identfn exprfn donothing donothing tyfn initfn paramfn declfn fieldfn
-    enumdeclfn stmtfn donothing donothing donothing donothing
+    enumdeclfn stmtfn donothing donothing donothing donothing donothing
 
 (* --------------------------------------------------------------------- *)
 
@@ -2902,7 +2902,7 @@ let rewrap =
     donothing donothing donothing donothing donothing donothing donothing
     donothing donothing donothing donothing donothing donothing donothing
     donothing donothing donothing donothing donothing donothing donothing
-    donothing donothing donothing
+    donothing donothing donothing donothing
 
 let rec rewrap_anything = function
     Ast0.DotsExprTag(d) ->
-- 
2.21.3

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
