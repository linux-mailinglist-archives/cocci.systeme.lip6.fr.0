Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0F522DF4A
	for <lists+cocci@lfdr.de>; Sun, 26 Jul 2020 14:54:04 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 06QCqWWi004921;
	Sun, 26 Jul 2020 14:52:33 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id C8C267780;
	Sun, 26 Jul 2020 14:52:33 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id D0F5E7815
 for <cocci@systeme.lip6.fr>; Sun, 26 Jul 2020 14:52:31 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 06QCqVc3027926
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sun, 26 Jul 2020 14:52:31 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id 2F1FC263ACB
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: cocci@systeme.lip6.fr
Date: Sun, 26 Jul 2020 18:21:13 +0530
Message-Id: <20200726125141.17787-16-jaskaran.singh@collabora.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200726125141.17787-1-jaskaran.singh@collabora.com>
References: <20200726125141.17787-1-jaskaran.singh@collabora.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 26 Jul 2020 14:52:34 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Sun, 26 Jul 2020 14:52:31 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Subject: [Cocci] [PATCH 15/43] ocaml: coccilib: Reflect MetaAttributeVal
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

MetaAttributeVal is added to the C AST. Reflect these changes in
coccilib.ml and coccilib.mli.

Signed-off-by: Jaskaran Singh <jaskaran.singh@collabora.com>
---
 ocaml/coccilib.ml  | 1 +
 ocaml/coccilib.mli | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/ocaml/coccilib.ml b/ocaml/coccilib.ml
index 0a7e0eb98..459f4c6be 100644
--- a/ocaml/coccilib.ml
+++ b/ocaml/coccilib.ml
@@ -70,6 +70,7 @@ type param_type =
   | FieldList of Ast_c.field list
   | FragList of Ast_c.string_fragment list
   | Fmt of Ast_c.string_format
+  | Attribute of Ast_c.attribute
   | Stmt of Ast_c.statement
   | StmtList of Ast_c.statement_sequencable list
 
diff --git a/ocaml/coccilib.mli b/ocaml/coccilib.mli
index 3960d1046..970229ee9 100644
--- a/ocaml/coccilib.mli
+++ b/ocaml/coccilib.mli
@@ -434,6 +434,7 @@ module Ast_c :
       | MetaStmtListVal of statement_sequencable list * stripped
       | MetaDParamListVal of string wrap wrap2 list
       | MetaFmtVal of string_format
+      | MetaAttributeVal of attribute
       | MetaFragListVal of string_fragment list
       | MetaAssignOpVal of assignOp
       | MetaBinaryOpVal of binaryOp
@@ -854,6 +855,7 @@ module Pretty_print_c :
       fragment : Ast_c.string_fragment printer;
       fragment_list : Ast_c.string_fragment list printer;
       format : Ast_c.string_format printer;
+      attribute : Ast_c.attribute printer;
       flow : Control_flow_c.node printer;
       name : Ast_c.name printer;
     }
@@ -3785,6 +3787,7 @@ type param_type =
   | FieldList of Ast_c.field list
   | FragList of Ast_c.string_fragment list
   | Fmt of Ast_c.string_format
+  | Attribute of Ast_c.attribute
   | Stmt of Ast_c.statement
   | StmtList of Ast_c.statement_sequencable list
 val fcts :
-- 
2.21.3

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
