Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C02C122DF37
	for <lists+cocci@lfdr.de>; Sun, 26 Jul 2020 14:53:19 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 06QCqR0E025046;
	Sun, 26 Jul 2020 14:52:27 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 7011F781F;
	Sun, 26 Jul 2020 14:52:27 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 894A13F6C
 for <cocci@systeme.lip6.fr>; Sun, 26 Jul 2020 14:52:21 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 06QCqK9s026961
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sun, 26 Jul 2020 14:52:21 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id DED2C2791DB
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: cocci@systeme.lip6.fr
Date: Sun, 26 Jul 2020 18:21:06 +0530
Message-Id: <20200726125141.17787-9-jaskaran.singh@collabora.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200726125141.17787-1-jaskaran.singh@collabora.com>
References: <20200726125141.17787-1-jaskaran.singh@collabora.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 26 Jul 2020 14:52:27 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sun, 26 Jul 2020 14:52:21 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: [Cocci] [PATCH 08/43] ocaml: coccilib: Reflect MetaAttribute &
	MetaAttributeDecl
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

MetaAttribute and MetaAttributeDecl are added to the SmPL AST. Reflect
these changes in coccilib.mli.

Signed-off-by: Jaskaran Singh <jaskaran.singh@collabora.com>
---
 ocaml/coccilib.mli | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/ocaml/coccilib.mli b/ocaml/coccilib.mli
index 19f1512cd..3960d1046 100644
--- a/ocaml/coccilib.mli
+++ b/ocaml/coccilib.mli
@@ -2520,6 +2520,7 @@ module Ast_cocci :
       | MetaPosDecl of arity * meta_name
       | MetaComDecl of arity * meta_name
       | MetaFmtDecl of arity * meta_name
+      | MetaAttributeDecl of arity * meta_name
       | MetaFragListDecl of arity * meta_name * list_len
       | MetaAnalysisDecl of string * meta_name
       | MetaDeclarerDecl of arity * meta_name
@@ -2928,6 +2929,8 @@ module Ast_cocci :
     and base_attr =
       Ast_cocci.base_attr =
         Attribute of string mcode
+      | MetaAttribute of meta_name mcode * constraints * keep_binding *
+          inherited
     and attr = base_attr wrap
     and metaStmtInfo =
       Ast_cocci.metaStmtInfo =
@@ -3560,6 +3563,7 @@ module Ast0_cocci :
     and base_attr =
       Ast0_cocci.base_attr =
         Attribute of string mcode
+      | MetaAttribute of Ast_cocci.meta_name mcode * constraints * pure
     and attr = base_attr wrap
     and ('a, 'b) whencode =
       ('a, 'b) Ast0_cocci.whencode =
-- 
2.21.3

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
