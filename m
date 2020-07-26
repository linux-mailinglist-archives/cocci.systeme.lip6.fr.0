Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA2122DF46
	for <lists+cocci@lfdr.de>; Sun, 26 Jul 2020 14:53:53 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 06QCr2xn000896;
	Sun, 26 Jul 2020 14:53:02 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id CFF0D3F6C;
	Sun, 26 Jul 2020 14:53:02 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id A2EF43F6C
 for <cocci@systeme.lip6.fr>; Sun, 26 Jul 2020 14:52:58 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 06QCqwu1015607
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sun, 26 Jul 2020 14:52:58 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id 2B374263ACB
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: cocci@systeme.lip6.fr
Date: Sun, 26 Jul 2020 18:21:31 +0530
Message-Id: <20200726125141.17787-34-jaskaran.singh@collabora.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200726125141.17787-1-jaskaran.singh@collabora.com>
References: <20200726125141.17787-1-jaskaran.singh@collabora.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 26 Jul 2020 14:53:02 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sun, 26 Jul 2020 14:52:58 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: [Cocci] [PATCH 33/43] parsing_cocci: get_constants: Reflect
	MetaAttribute
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

MetaAttribute is added to the SmPL AST. Reflect these changes in
get_constants.ml.

Signed-off-by: Jaskaran Singh <jaskaran.singh@collabora.com>
---
 parsing_cocci/get_constants.ml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/parsing_cocci/get_constants.ml b/parsing_cocci/get_constants.ml
index a23f2e4f8..ebab24871 100644
--- a/parsing_cocci/get_constants.ml
+++ b/parsing_cocci/get_constants.ml
@@ -235,6 +235,11 @@ let check_inherited nm =
     | Ast.MetaStmtList(name,_,_) -> bind (k re) (minherited name)
     | _ -> k re in
 
+  let strictattribute recursor k a =
+    match Ast.unwrap a with
+      Ast.MetaAttribute(name,_,_) -> bind (k a) (minherited name)
+    | _ -> k a in
+
   let strictstatement recursor k s =
     match Ast.unwrap s with
       Ast.Disj(stms) -> option_default
@@ -244,7 +249,7 @@ let check_inherited nm =
     mcode mcode mcode mcode mcode mcode mcode mcode mcode mcode mcode mcode
     donothing donothing donothing donothing
     strictident strictexpr strictfullType stricttypeC donothing strictparam
-    strictdecls strictrule_elem strictstatement donothing donothing donothing
+    strictdecls strictrule_elem strictstatement attributefn donothing donothing
 
 (* ------------------------------------------------------------------------ *)
 
-- 
2.21.3

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
