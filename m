Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FDF22DF5B
	for <lists+cocci@lfdr.de>; Sun, 26 Jul 2020 14:54:51 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 06QCrBWW001963;
	Sun, 26 Jul 2020 14:53:11 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id B53613F6C;
	Sun, 26 Jul 2020 14:53:11 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 15165777B
 for <cocci@systeme.lip6.fr>; Sun, 26 Jul 2020 14:53:09 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 06QCr8EI028763
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sun, 26 Jul 2020 14:53:08 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id 6991C27088D
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: cocci@systeme.lip6.fr
Date: Sun, 26 Jul 2020 18:21:38 +0530
Message-Id: <20200726125141.17787-41-jaskaran.singh@collabora.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200726125141.17787-1-jaskaran.singh@collabora.com>
References: <20200726125141.17787-1-jaskaran.singh@collabora.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 26 Jul 2020 14:53:11 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sun, 26 Jul 2020 14:53:08 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: [Cocci] [PATCH 40/43] engine: cocci_vs_c: Reflect MetaAttribute
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
cocci_vs_c.ml.

Signed-off-by: Jaskaran Singh <jaskaran.singh@collabora.com>
---
 engine/cocci_vs_c.ml | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/engine/cocci_vs_c.ml b/engine/cocci_vs_c.ml
index ed91a4785..0b698287d 100644
--- a/engine/cocci_vs_c.ml
+++ b/engine/cocci_vs_c.ml
@@ -1535,7 +1535,8 @@ let rec (expression: (A.expression, Ast_c.expression) matcher) =
       let attr_allminus =
         let attr_is_not_context a =
           match A.unwrap a with
-          | A.Attribute(_,_,A.CONTEXT(_,_),_) -> false
+          | A.Attribute(_,_,A.CONTEXT(_,_),_)
+          | A.MetaAttribute((_,_,A.CONTEXT(_,_),_),_,_,_) -> false
           | _ -> true in
         check_allminus.Visitor_ast.combiner_fullType typa &&
         List.for_all attr_is_not_context attrsa in
@@ -4282,6 +4283,18 @@ and attribute = fun allminus ea eb ->
 	  A.rewrap ea (A.Attribute(attra)),
           (B.Attribute attrb,ib1)
         )))
+  | A.MetaAttribute (ida,constraints,keep,inherited), _ ->
+      (* todo: use quaopt, hasreg ? *)
+      let max_min _ = Lib_parsing_c.ii_of_attr eb in
+      let mn = Ast_c.MetaAttributeVal eb in
+      check_constraints constraints ida mn
+	(fun () ->
+	  X.envf keep inherited (ida,mn,max_min) (fun () ->
+            X.distrf_attr ida eb)
+	    >>= (fun ida eb ->
+	      return
+		(A.MetaAttribute(ida,constraints,keep,inherited)+>
+		 A.rewrap ea,eb)))
   | _ -> fail
 
 (*---------------------------------------------------------------------------*)
-- 
2.21.3

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
