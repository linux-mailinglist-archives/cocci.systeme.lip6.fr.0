Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D91822235D
	for <lists+cocci@lfdr.de>; Thu, 16 Jul 2020 15:03:28 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 06GD2ILI010378;
	Thu, 16 Jul 2020 15:02:18 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 92B877815;
	Thu, 16 Jul 2020 15:02:18 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 97F037779
 for <cocci@systeme.lip6.fr>; Thu, 16 Jul 2020 15:02:14 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 06GD2EvI026225
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Thu, 16 Jul 2020 15:02:14 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id 0D2D72A0BFF
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: cocci@systeme.lip6.fr
Date: Thu, 16 Jul 2020 18:30:15 +0530
Message-Id: <20200716130016.23729-25-jaskaran.singh@collabora.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200716130016.23729-1-jaskaran.singh@collabora.com>
References: <20200716130016.23729-1-jaskaran.singh@collabora.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 16 Jul 2020 15:02:18 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Thu, 16 Jul 2020 15:02:14 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Subject: [Cocci] [PATCH 24/24] tools: spgen: Reflect attributefn in AST0
	visitor
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
changes in spgen.

Signed-off-by: Jaskaran Singh <jaskaran.singh@collabora.com>
---
 tools/spgen/source/detect_patch.ml  | 3 ++-
 tools/spgen/source/meta_variable.ml | 3 ++-
 tools/spgen/source/rule_body.ml     | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/spgen/source/detect_patch.ml b/tools/spgen/source/detect_patch.ml
index 0489afec..7b148a23 100644
--- a/tools/spgen/source/detect_patch.ml
+++ b/tools/spgen/source/detect_patch.ml
@@ -111,6 +111,7 @@ let patch_combiner =
   let paramfn = donothing in
   let forinfofn = donothing in
   let string_fragmentfn = donothing in
+  let attributefn = donothing in
   let topfn = donothing in
   let dotsstmtfn = donothing in
 
@@ -163,7 +164,7 @@ let patch_combiner =
     dotsexprfn dotsinitfn dotsparamfn dotsstmtfn dotsdeclfn dotsfieldfn
     dotsenumdeclfn dotscasefn dotsdefparfn
     identfn exprfn assignOpfn binaryOpfn tyfn initfn paramfn declfn fieldfn
-    enumdeclfn stmtfn forinfofn casefn string_fragmentfn topfn
+    enumdeclfn stmtfn forinfofn casefn string_fragmentfn attributefn topfn
 
 
 (* ------------------------------------------------------------------------- *)
diff --git a/tools/spgen/source/meta_variable.ml b/tools/spgen/source/meta_variable.ml
index 31456614..40dcae9c 100644
--- a/tools/spgen/source/meta_variable.ml
+++ b/tools/spgen/source/meta_variable.ml
@@ -396,6 +396,7 @@ let metavar_combiner rn =
   let casefn = donothing in
   let topfn = donothing in
   let enumdeclfn = donothing in
+  let attributefn = donothing in
 
   (* --- These are shortened formatting functions that return MVSets --- *)
 
@@ -577,7 +578,7 @@ let metavar_combiner rn =
     dotsexprfn dotsinitfn dotsparamfn dotsstmtfn dotsdeclfn dotsfieldfn
     dotsenumdeclfn dotscasefn dotsdefparfn
     identfn exprfn assignOpfn binaryOpfn tyfn initfn paramfn declfn fieldfn
-    enumdeclfn stmtfn forinfofn casefn string_fragmentfn topfn
+    enumdeclfn stmtfn forinfofn casefn string_fragmentfn attributefn topfn
 
 
 (* ------------------------------------------------------------------------- *)
diff --git a/tools/spgen/source/rule_body.ml b/tools/spgen/source/rule_body.ml
index 163dff9a..d8aa957e 100644
--- a/tools/spgen/source/rule_body.ml
+++ b/tools/spgen/source/rule_body.ml
@@ -231,6 +231,7 @@ let rec gen_combiner ~context_mode =
   let forinfofn = donothing in
   let casefn = donothing in
   let string_fragmentfn = donothing in
+  let attributefn = donothing in
 
   (* Universal special cases, regardless of no_gen mode:
    * Disjunctions with SmPL style pattern-matching may need to be split into
@@ -353,7 +354,7 @@ let rec gen_combiner ~context_mode =
     dotsexprfn dotsinitfn dotsparamfn dotsstmtfn dotsdeclfn dotsfieldfn
     dotsenumdeclfn dotscasefn dotsdefparfn
     identfn exprfn assignOpfn binaryOpfn tyfn initfn paramfn declfn fieldfn
-    enumdeclfn stmtfn forinfofn casefn string_fragmentfn topfn
+    enumdeclfn stmtfn forinfofn casefn string_fragmentfn attributefn topfn
 
 
 (* ------------------------------------------------------------------------- *)
-- 
2.21.3

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
