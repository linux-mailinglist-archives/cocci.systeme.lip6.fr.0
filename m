Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B93CD21885A
	for <lists+cocci@lfdr.de>; Wed,  8 Jul 2020 15:02:18 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 068D1aDS024945;
	Wed, 8 Jul 2020 15:01:36 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 9EC877489;
	Wed,  8 Jul 2020 15:01:36 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 3671E44A7
 for <cocci@systeme.lip6.fr>; Wed,  8 Jul 2020 15:01:34 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 068D1X4D019938
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Wed, 8 Jul 2020 15:01:33 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id 7026D2A0A8B
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: cocci@systeme.lip6.fr
Date: Wed,  8 Jul 2020 18:30:34 +0530
Message-Id: <20200708130035.26687-20-jaskaran.singh@collabora.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200708130035.26687-1-jaskaran.singh@collabora.com>
References: <20200708130035.26687-1-jaskaran.singh@collabora.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 08 Jul 2020 15:01:36 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Wed, 08 Jul 2020 15:01:33 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Subject: [Cocci] [PATCH v2 RESEND 19/20] engine: cocci_vs_c: Wrap SmPL
	Attributes
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

Attributes are wrapped in the SmPL AST. Reflect these changes in
cocci_vs_c.ml.

Signed-off-by: Jaskaran Singh <jaskaran.singh@collabora.com>
---
 engine/cocci_vs_c.ml | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/engine/cocci_vs_c.ml b/engine/cocci_vs_c.ml
index 704c18e0..9439cdb3 100644
--- a/engine/cocci_vs_c.ml
+++ b/engine/cocci_vs_c.ml
@@ -1529,11 +1529,12 @@ let rec (expression: (A.expression, Ast_c.expression) matcher) =
     ((B.Cast (typb, attrsb, eb), typ),ii) ->
 
       let attr_allminus =
-        let mcode_is_not_context = function
-          | (_,_,A.CONTEXT(_,_),_) -> false
+        let attr_is_not_context a =
+          match A.unwrap a with
+          | A.Attribute(_,_,A.CONTEXT(_,_),_) -> false
           | _ -> true in
         check_allminus.Visitor_ast.combiner_fullType typa &&
-        List.for_all mcode_is_not_context attrsa in
+        List.for_all attr_is_not_context attrsa in
 
       let (ib1, ib2) = tuple_of_list2 ii in
       fullType typa typb >>= (fun typa typb ->
@@ -4265,8 +4266,8 @@ and attribute_list allminus attras attrbs =
   | _ -> failwith "only one attribute allowed in SmPL")
 
 and attribute = fun allminus ea eb ->
-  match ea, eb with
-    attra, (B.Attribute attrb, ii)
+  match A.unwrap ea, eb with
+    A.Attribute(attra), (B.Attribute attrb, ii)
       when (A.unwrap_mcode attra) = attrb ->
       let ib1 = tuple_of_list1 ii in
       tokenf attra ib1 >>= (fun attra ib1 ->
@@ -4274,7 +4275,7 @@ and attribute = fun allminus ea eb ->
         then minusize_list [ib1]
         else return ((), [ib1])) >>= (fun _ ib1 ->
 	return (
-	  attra,
+	  A.rewrap ea (A.Attribute(attra)),
           (B.Attribute attrb,ib1)
         )))
   | _ -> fail
-- 
2.21.3

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
