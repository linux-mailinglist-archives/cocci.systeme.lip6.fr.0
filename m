Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B0C222357
	for <lists+cocci@lfdr.de>; Thu, 16 Jul 2020 15:03:11 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 06GD2F23001555;
	Thu, 16 Jul 2020 15:02:16 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 0FBAC3F6C;
	Thu, 16 Jul 2020 15:02:16 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 3A5C33F6C
 for <cocci@systeme.lip6.fr>; Thu, 16 Jul 2020 15:02:13 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 06GD2C9Q012920
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Thu, 16 Jul 2020 15:02:12 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id BE5CC2A2BDE
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: cocci@systeme.lip6.fr
Date: Thu, 16 Jul 2020 18:30:14 +0530
Message-Id: <20200716130016.23729-24-jaskaran.singh@collabora.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200716130016.23729-1-jaskaran.singh@collabora.com>
References: <20200716130016.23729-1-jaskaran.singh@collabora.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 16 Jul 2020 15:02:16 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Thu, 16 Jul 2020 15:02:12 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Subject: [Cocci] [PATCH 23/24] parsing_cocci: insert_plus: Reflect
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
changes in insert_plus.ml.

Signed-off-by: Jaskaran Singh <jaskaran.singh@collabora.com>
---
 parsing_cocci/insert_plus.ml | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/parsing_cocci/insert_plus.ml b/parsing_cocci/insert_plus.ml
index 6c11a339..cd45ba8c 100644
--- a/parsing_cocci/insert_plus.ml
+++ b/parsing_cocci/insert_plus.ml
@@ -83,7 +83,8 @@ it *)
       (donothing Ast0.param) (donothing Ast0.decl)
       (donothing Ast0.field) (donothing Ast0.enum_decl) statement
       (donothing Ast0.forinfo) (donothing Ast0.case_line)
-      (donothing Ast0.string_fragment) topfn in
+      (donothing Ast0.string_fragment) (donothing Ast0.attr)
+      topfn in
   res.VT0.combiner_rec_top_level e
 
 (* --------------------------------------------------------------------- *)
@@ -386,7 +387,7 @@ bind to that; not good for isomorphisms *)
     edots idots pdots sdots ddots fdots enumdots cdots dpdots
     ident expression do_nothing do_nothing
     typeC initialiser param decl field do_nothing statement forinfo
-    case_line do_nothing do_top
+    case_line do_nothing do_nothing do_top
 
 
 let call_collect_minus context_nodes :
@@ -678,7 +679,8 @@ let collect_plus_nodes root =
     (do_nothing mk_declaration) (do_nothing mk_field)
     (do_nothing mk_enum_decl)
     stmt (do_nothing mk_forinfo) (do_nothing mk_case_line)
-    (do_nothing mk_string_fragment) toplevel
+    (do_nothing mk_string_fragment) (do_nothing mk_attribute)
+    toplevel
 
 let call_collect_plus context_nodes :
     (int * (Ast0.info * Ast.count * Ast.anything) list) list =
@@ -1239,7 +1241,7 @@ let reevaluate_contextness =
       donothing donothing donothing donothing donothing donothing stmt
       donothing
       donothing donothing
-      donothing in
+      donothing donothing in
   res.VT0.combiner_rec_top_level
 
 (* --------------------------------------------------------------------- *)
-- 
2.21.3

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
