Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E3F22DF5C
	for <lists+cocci@lfdr.de>; Sun, 26 Jul 2020 14:54:51 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 06QCrEwQ027974;
	Sun, 26 Jul 2020 14:53:14 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 2B8F477B7;
	Sun, 26 Jul 2020 14:53:14 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id AF4993F6C
 for <cocci@systeme.lip6.fr>; Sun, 26 Jul 2020 14:53:10 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 06QCrAEQ018615
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sun, 26 Jul 2020 14:53:10 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id B9E05263ACB
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: cocci@systeme.lip6.fr
Date: Sun, 26 Jul 2020 18:21:39 +0530
Message-Id: <20200726125141.17787-42-jaskaran.singh@collabora.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200726125141.17787-1-jaskaran.singh@collabora.com>
References: <20200726125141.17787-1-jaskaran.singh@collabora.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 26 Jul 2020 14:53:14 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sun, 26 Jul 2020 14:53:10 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: [Cocci] [PATCH 41/43] tools: spgen: Reflect MetaAttribute
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

MetaAttribute is added to the SmPL AST. Reflect these changes in spgen.

Signed-off-by: Jaskaran Singh <jaskaran.singh@collabora.com>
---
 tools/spgen/source/meta_variable.ml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/spgen/source/meta_variable.ml b/tools/spgen/source/meta_variable.ml
index 40dcae9c2..70a9fe878 100644
--- a/tools/spgen/source/meta_variable.ml
+++ b/tools/spgen/source/meta_variable.ml
@@ -396,7 +396,6 @@ let metavar_combiner rn =
   let casefn = donothing in
   let topfn = donothing in
   let enumdeclfn = donothing in
-  let attributefn = donothing in
 
   (* --- These are shortened formatting functions that return MVSets --- *)
 
@@ -571,6 +570,13 @@ let metavar_combiner rn =
        )
     | _ -> fn v in
 
+  let attributefn c fn v =
+    match Ast0.unwrap v with
+    | Ast0.MetaAttribute(mc, idconstr, pure) ->
+        let constr = constraints ~rn idconstr in
+        meta_mc_format ~mc ~typ:"parameter " ~constr
+    | _ -> fn v in
+
   V0.flat_combiner bind option_default
     meta_mcode string_mcode const_mcode simpleAssign_mcode opAssign_mcode
     fix_mcode unary_mcode arithOp_mcode logicalOp_mcode cv_mcode sign_mcode
-- 
2.21.3

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
