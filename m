Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CDA22DF4F
	for <lists+cocci@lfdr.de>; Sun, 26 Jul 2020 14:54:20 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 06QCr2xp000896;
	Sun, 26 Jul 2020 14:53:03 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 628C03F6C;
	Sun, 26 Jul 2020 14:53:03 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 4CA5377B7
 for <cocci@systeme.lip6.fr>; Sun, 26 Jul 2020 14:53:00 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 06QCqxL2002572
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sun, 26 Jul 2020 14:52:59 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id 849E727088D
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: cocci@systeme.lip6.fr
Date: Sun, 26 Jul 2020 18:21:32 +0530
Message-Id: <20200726125141.17787-35-jaskaran.singh@collabora.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200726125141.17787-1-jaskaran.singh@collabora.com>
References: <20200726125141.17787-1-jaskaran.singh@collabora.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 26 Jul 2020 14:53:03 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Sun, 26 Jul 2020 14:52:59 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Subject: [Cocci] [PATCH 34/43] parsing_cocci: get_constants2: Reflect
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
get_constants2.ml.

Signed-off-by: Jaskaran Singh <jaskaran.singh@collabora.com>
---
 parsing_cocci/get_constants2.ml | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/parsing_cocci/get_constants2.ml b/parsing_cocci/get_constants2.ml
index 8fffe1955..33d8ccf5a 100644
--- a/parsing_cocci/get_constants2.ml
+++ b/parsing_cocci/get_constants2.ml
@@ -529,9 +529,10 @@ let do_get_constants constants keywords env (neg_pos,_) =
     | Ast.MetaType(name,_,_,_) -> bind (minherited name) (k ty)
     | _ -> k ty in
 
-  let attribute a =
+  let attribute r k a =
     match Ast.unwrap a with
-      Ast.Attribute(attr) -> Ast.unwrap_mcode attr in
+      Ast.MetaAttribute(name,_,_,_) -> bind (k a) (minherited name)
+    | Ast.Attribute(attr) -> constants (Ast.unwrap_mcode attr) in
 
   let declaration r k d =
     match Ast.unwrap d with
@@ -543,7 +544,7 @@ let do_get_constants constants keywords env (neg_pos,_) =
     (* need things with explicit names too *)
     | Ast.Init(_,_,_,attr,_,_,_) | Ast.UnInit(_,_,_,attr,_) ->
 	List.fold_left bind (k d)
-	  (List.map (fun attr -> constants (attribute attr)) attr)
+	  (List.map r.V.combiner_attribute attr)
     | _ -> k d in
 
   let field r k d =
@@ -645,7 +646,7 @@ let do_get_constants constants keywords env (neg_pos,_) =
     donothing donothing donothing donothing donothing donothing donothing
     ident expression string_fragment string_format donothing donothing
     fullType typeC initialiser parameter define_parameter declaration donothing
-    field ann_field donothing rule_elem statement donothing donothing donothing
+    field ann_field donothing rule_elem statement donothing attribute donothing
     donothing
 
 (* ------------------------------------------------------------------------ *)
-- 
2.21.3

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
